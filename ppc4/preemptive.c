#include <8051.h>
#include "preemptive.h"


__data __at (0x25) char savedSP[MAXTHREADS];
__data __at (0x29) char currentThread;
__data __at (0x2A) char threadMask;
__data __at (0x2B) char i;
__data __at (0x2C) char tempSP;
__data __at (0x2D) char newThread;
__data __at (0x2E) char temp;
__data __at (0x2F) char clockwise;


/*
 * SAVESTATE: push ACC, B, DPL, DPH, PSW onto the active stack,
 * then snapshot SP into savedSP[currentThread].
 * Written in assembly to prevent the compiler from inserting
 * extra register operations between the pushes.
 */
#define SAVESTATE               \
    {                           \
        __asm                   \
        PUSH ACC                \
        PUSH B                  \
        PUSH DPL                \
        PUSH DPH                \
        PUSH PSW                \
        __endasm;               \
        savedSP[currentThread] = SP; \
    }

/*
 * RESTORESTATE: the exact reverse of SAVESTATE.
 * Reload SP from savedSP[currentThread], then pop the five
 * registers in reverse order so execution resumes correctly.
 */
#define RESTORESTATE            \
    {                           \
        SP = savedSP[currentThread]; \
        __asm                   \
        POP PSW                 \
        POP DPH                 \
        POP DPL                 \
        POP B                   \
        POP ACC                 \
        __endasm;               \
    }


extern void main(void);

/*
 * Bootstrap is jumped to by the startup code to make the thread for
 * main, and restore its context so the thread can run.
 */

void Bootstrap(void) {
    threadMask = 0;
    clockwise = 1;
    TMOD = 0; // timer 0 mode 0
    // TH0 = 0xD8;
    // TL0 = 0x00;
    IE = 0x82; // enable timer 0 interrupt,
    TR0 = 1; // start running timer0
    currentThread = ThreadCreate(main);
    RESTORESTATE;
}


/* for unfairness test
void myTimer0Handler(void) {
    EA = 0;
    SAVESTATE;
    do {
        currentThread = (currentThread < 3) ? currentThread + 1 : 0;
        temp = 1 << currentThread;
        if (threadMask & temp) break;
    } while (1);
    RESTORESTATE;
    EA = 1;
    __asm
    RETI
    __endasm;
}
*/


void myTimer0Handler(void) {
    EA = 0; // don't do __critial
    SAVESTATE;
    do{
        if(clockwise){
            clockwise = !(currentThread == 3);
            if(currentThread == 3) currentThread = 2;
            else currentThread++;
        } 
        else {
            clockwise = (currentThread == 0);
            if(currentThread == 0) currentThread = 1;
            else currentThread--;
        }
        temp = 1 << currentThread;
        if (threadMask & temp){
            break;
        }
    } while (1);
    RESTORESTATE;
    // TH0 = 0xD8;
    // TL0 = 0x00;
    EA = 1;
    __asm
    RETI
    __endasm;
}


ThreadID ThreadCreate(FunctionPtr fp){
    EA = 0;
    if(threadMask == 0x0F){
        return -1;
    }
    /*
     * [TODO]
     *     otherwise, find a thread ID that is not in use,
     *     and grab it. (can check the bit mask for threads),
     *
     * [TODO] below
     * a. update the bit mask
         (and increment thread count, if you use a thread count,
          but it is optional)
       b. calculate the starting stack location for new thread
       c. save the current SP in a temporary
          set SP to the starting location for the new thread
       d. push the return address fp (2-byte parameter to
          ThreadCreate) onto stack so it can be the return
          address to resume the thread. Note that in SDCC
          convention, 2-byte ptr is passed in DPTR.  but
          push instruction can only push it as two separate
          registers, DPL and DPH.
       e. we want to initialize the registers to 0, so we
          assign a register to 0 and push it four times
          for ACC, B, DPL, DPH.  Note: push #0 will not work
          because push takes only direct address as its operand,
          but it does not take an immediate (literal) operand.
       f. finally, we need to push PSW (processor status word)
          register, which consist of bits
           CY AC F0 RS1 RS0 OV UD P
          all bits can be initialized to zero, except <RS1:RS0>
          which selects the register bank.
          Thread 0 uses bank 0, Thread 1 uses bank 1, etc.
          Setting the bits to 00B, 01B, 10B, 11B will select
          the register bank so no need to push/pop registers
          R0-R7.  So, set PSW to
          00000000B for thread 0, 00001000B for thread 1,
          00010000B for thread 2, 00011000B for thread 3.
       g. write the current stack pointer to the saved stack
          pointer array for this newly created thread ID
       h. set SP to the saved SP in step c.
       i. finally, return the newly created thread ID.
     */
    for(i = 0; i != MAXTHREADS; i++){
        /* Scan for the lowest free thread ID */
        temp = 1;
        temp <<= i;
        if(!(threadMask & temp)){
            threadMask |= temp; /* mark slot as occupied */
            newThread = i;
            break;
        }
    }
    /* Switch SP to the new thread's stack region */
    tempSP = SP;
    //calculate the starting stack location for new thread
    //set SP to the starting location for the new thread
    SP = (0x3F) + newThread * (0x10);
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
    PSW = (newThread << 3);
    __asm
        PUSH PSW
    __endasm;
    /* Record new thread's initial SP, then restore caller's SP */
    savedSP[newThread] = SP;
    SP = tempSP;
    EA = 1;
    return newThread;
}


void ThreadYield(void){
    EA = 0;
    SAVESTATE;
    do{
        currentThread = (currentThread < 3) ? currentThread + 1 : 0;
        temp = 1 << currentThread;
        if (threadMask & temp){
            // DEBUG = currentThread; 
            break;
        }
    } while (1);
    EA = 1;
    RESTORESTATE;
}
/*
 * ThreadExit() is called by the thread's own code to terminate
 * itself.  It will never return; instead, it switches context
 * to another thread.
 */
void ThreadExit(void)
{
    EA = 0;
    temp = 1 << currentThread;
    threadMask ^= temp;
    for(i = 0; i < MAXTHREADS; i++){
        temp = 1 << i;
        if(temp & threadMask){
            currentThread = i;
            break;
        }
    }
    if (i == MAXTHREADS){
        currentThread = -1;
    }
    RESTORESTATE;
    EA = 1;
}