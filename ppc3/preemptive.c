#include <8051.h>
#include "preemptive.h"

/*
 * Thread-management globals, manually placed in IRAM.
 * These must not overlap with testpreempt.c's variables
 * (buffer 0x30-0x32, semaphores 0x33-0x38) or the thread
 * stacks (0x40 onwards), so we place them at 0x20-0x26.
 *
 * savedSP[0..3]  : saved stack pointer for each thread
 * currentThread  : ID of the currently running thread
 * threadMask     : bitmask — bit i set means thread i is alive
 * savedCurrentSP : preserves SP across ThreadCreate
 * nextID         : thread ID being allocated in ThreadCreate
 * mask           : scratch bitmask variable
 * loopIdx        : loop counter for thread-search loops
 */
__data __at (0x20) char savedSP[MAXTHREADS];
__data __at (0x24) char currentThread;
__data __at (0x25) char threadMask;
__data __at (0x26) char loopIdx;
__data __at (0x27) char savedCurrentSP;
__data __at (0x28) char nextID;
__data __at (0x29) char mask;

/*
 * SAVESTATE: push ACC, B, DPL, DPH, PSW onto the active stack,
 * then snapshot SP into savedSP[currentThread].
 * Written in assembly to prevent the compiler from inserting
 * extra register operations between the pushes.
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
 * Reload SP from savedSP[currentThread], then pop the five
 * registers in reverse order so execution resumes correctly.
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
 * Bootstrap: entry point redirected from _sdcc_gsinit_startup.
 * Clears the thread table, enables Timer 0 for preemption,
 * creates the initial thread for main(), then context-switches
 * into it via RESTORESTATE.
 *
 * IE = 0x82: EA (global enable) + ET0 (Timer 0 overflow).
 */
void Bootstrap(void) {
    threadMask    = 0;
    TMOD          = 0;      /* Timer 0 mode 0 — 13-bit counter */
    IE            = 0x82;   /* EA=1, ET0=1                     */
    TR0           = 1;      /* start Timer 0                   */
    currentThread = ThreadCreate(main);
    RESTORESTATE;
}

/*
 * myTimer0Handler: Timer 0 ISR, invoked on every overflow.
 * Performs a preemptive context switch using round-robin:
 * saves the interrupted thread, finds the next live thread,
 * restores it, then returns from interrupt with RETI.
 */
void myTimer0Handler(void) {
    EA = 0;
    SAVESTATE;
    do {
        currentThread = (currentThread < 3) ? currentThread + 1 : 0;
        mask = 1 << currentThread;
    } while (!(threadMask & mask));
    RESTORESTATE;
    EA = 1;
    __asm
    RETI
    __endasm;
}


ThreadID ThreadCreate(FunctionPtr fp) {
    if (threadMask == 0x0F) {
        return -1;
    }

    __critical {
        /* Scan for the lowest free thread ID */
        loopIdx = 0;
        while (loopIdx != MAXTHREADS) {
            mask = 1 << loopIdx;
            if (!(threadMask & mask)) {
                threadMask |= mask; /* mark slot as occupied */
                nextID = loopIdx;
                break;
            }
            loopIdx++;
        }

        /* Switch SP to the new thread's stack region */
        savedCurrentSP = SP;
        SP = 0x3F + (nextID << 4);  

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
 * ThreadYield: voluntarily hand over the CPU.
 * Saves the caller's context, selects the next live thread
 * round-robin, then restores that thread's context.
 */
void ThreadYield(void) {
    __critical {
        SAVESTATE;
        do {
            currentThread = (currentThread < 3) ? currentThread + 1 : 0;
            mask = 1 << currentThread;
        } while (!(threadMask & mask));
        RESTORESTATE;
    }
}

/*
 * ThreadExit: permanently terminate the calling thread.
 * Removes the thread from threadMask, switches to the first
 * remaining live thread, or sets currentThread to -1 if none.
 */
void ThreadExit(void) {
    EA = 0;

    mask = 1 << currentThread;
    threadMask ^= mask;

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