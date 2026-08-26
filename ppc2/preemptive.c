#include <8051.h>
#include "preemptive.h"

/*
 * Global variables for thread management.
 * Manually assigned to specific IRAM addresses to avoid
 * conflicts with thread stacks (which start at 0x40).
 *
 * savedSP[0..3] : saved stack pointer for each thread
 * currentThread : ID of the currently running thread
 * threadMask    : bitmask of live threads (bit i = thread i alive)
 * savedCurrentSP: scratch space to preserve SP during ThreadCreate
 * nextID        : newly allocated thread ID (set in ThreadCreate)
 * mask          : general-purpose bitmask scratch variable
 * loopIdx       : loop counter for thread search loops
 */
__data __at (0x30) char savedSP[MAXTHREADS];
__data __at (0x34) char currentThread;
__data __at (0x35) char threadMask;
__data __at (0x36) char loopIdx;
__data __at (0x37) char savedCurrentSP;
__data __at (0x38) char nextID;
__data __at (0x39) char mask;

/*
 * SAVESTATE: push ACC, B, DPL, DPH, PSW onto the current stack,
 * then record SP into savedSP[currentThread].
 * Must be written in assembly so the compiler doesn't insert
 * extra register usage between the pushes.
 */
#define SAVESTATE                        \
    {                                    \
        __asm                            \
        PUSH ACC                         \
        PUSH B                           \
        PUSH DPL                         \
        PUSH DPH                         \
        PUSH PSW                         \
        __endasm;                        \
        savedSP[currentThread] = SP;     \
    }

/*
 * RESTORESTATE: the exact reverse of SAVESTATE.
 * Load SP from savedSP[currentThread], then pop registers
 * in reverse order so each thread resumes where it left off.
 */
#define RESTORESTATE                     \
    {                                    \
        SP = savedSP[currentThread];     \
        __asm                            \
        POP PSW                          \
        POP DPH                          \
        POP DPL                          \
        POP B                            \
        POP ACC                          \
        __endasm;                        \
    }

extern void main(void);

/*
 * Bootstrap: called once at startup (via _sdcc_gsinit_startup).
 * Initialises the thread subsystem, configures Timer 0 for
 * preemptive scheduling, creates the main thread, then jumps
 * into it via RESTORESTATE.
 *
 * Timer 0 is set to mode 0 (13-bit auto-reload).
 * IE = 0x82 enables the global interrupt flag (EA) and the
 * Timer 0 overflow interrupt (ET0) while leaving others off.
 */
void Bootstrap(void) {
    threadMask = 0;
    TMOD = 0;      /* Timer 0: mode 0 (13-bit timer) */
    IE   = 0x82;   /* EA=1, ET0=1 */
    TR0  = 1;      /* start Timer 0 */
    currentThread = ThreadCreate(main);
    RESTORESTATE;
}

/*
 * myTimer0Handler: Timer 0 ISR — the heart of preemption.
 * Saves the interrupted thread's context, selects the next
 * live thread via round-robin, restores its context, then
 * returns from interrupt with RETI.
 *
 * EA is cleared on entry so we are not re-interrupted while
 * manipulating shared scheduler state.
 */
void myTimer0Handler(void) {
    EA = 0;
    SAVESTATE;
    /* Round-robin: advance to the next thread, wrapping with % */
    do {
        currentThread = (currentThread + 1) % MAXTHREADS;
        mask = 1 << currentThread;
    } while (!(threadMask & mask));
    RESTORESTATE;
    EA = 1;
    __asm
    RETI
    __endasm;
}


ThreadID ThreadCreate(FunctionPtr fp) {
    /* Reject if every slot is taken */
    if (threadMask == 0x0F) {
        return -1;
    }

    __critical {
        /* Scan for the lowest free thread ID */
        loopIdx = 0;
        while (loopIdx != MAXTHREADS) {
            mask = 1 << loopIdx;
            if (!(threadMask & mask)) {
                threadMask |= mask;   /* mark slot as occupied */
                nextID = loopIdx;
                break;
            }
            loopIdx++;
        }

        /* Switch SP to the new thread's stack region */
        savedCurrentSP = SP;
        SP = 0x3F + (nextID << 4);   /* equivalent to nextID * 0x10 */

        /* Push the function entry address (fp arrives in DPTR) */
        __asm
            PUSH DPL
            PUSH DPH
        __endasm;

        /* Push zeroed register save-slots: ACC, B, DPL, DPH */
        __asm
            ANL A, #0
            PUSH ACC
            PUSH ACC
            PUSH ACC
            PUSH ACC
        __endasm;

        /* Push PSW with the correct register-bank bits set */
        PSW = (nextID << 3);
        __asm
            PUSH PSW
        __endasm;

        /* Record new thread's initial SP, then restore caller's SP */
        savedSP[nextID] = SP;
        SP = savedCurrentSP;
    }

    return nextID;
}

/*
 * ThreadYield: voluntarily relinquish the CPU.
 * Saves context, picks the next live thread round-robin,
 * then restores that thread's context.
 */
void ThreadYield(void) {
    __critical {
        SAVESTATE;
        do {
            currentThread = (currentThread + 1) % MAXTHREADS;
            mask = 1 << currentThread;
        } while (!(threadMask & mask));
        RESTORESTATE;
    }
}

/*
 * ThreadExit: terminate the calling thread permanently.
 * Clears the thread's bit from threadMask, finds any remaining
 * live thread to switch into, then restores it.
 * If no threads remain, currentThread is set to -1
 * (the system halts naturally since nothing can run).
 */
void ThreadExit(void) {
    EA = 0;

    /* Remove current thread from the live-thread bitmask */
    mask = 1 << currentThread;
    threadMask ^= mask;

    /* Search from thread 0 for the first remaining live thread */
    loopIdx = 0;
    while (loopIdx < MAXTHREADS) {
        mask = 1 << loopIdx;
        if (mask & threadMask) {
            currentThread = loopIdx;
            break;
        }
        loopIdx++;
    }

    if (loopIdx == MAXTHREADS) {
        currentThread = -1;
    }

    RESTORESTATE;
    EA = 1;
}