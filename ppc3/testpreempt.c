/*
 * testpreempt.c — bounded-buffer producer-consumer test
 *
 * A 3-slot circular buffer protected by three semaphores:
 *   mutex  (init 1) — mutual exclusion for buffer access
 *   empty  (init 3) — counts free slots
 *   full   (init 0) — counts filled slots
 *
 * Thread layout:
 *   Thread 0 — main() → becomes Consumer
 *   Thread 1 — Producer
 */
#include <8051.h>
#include "preemptive.h"

/*
 * Shared data — placed at fixed IRAM addresses.
 * Layout (0x30–0x38):
 *   0x30-0x32  circBuf[3]    3-slot circular buffer
 *   0x33       nextChar      Producer's current character
 *   0x34       mutex         mutual-exclusion semaphore
 *   0x35       empty         free-slot semaphore
 *   0x36       full          filled-slot semaphore
 *   0x37       writeCursor   Producer's write index (0-2)
 *   0x38       readCursor    Consumer's read  index (0-2)
 */
__data __at (0x30) char circBuf[3];
__data __at (0x33) char nextChar;
__data __at (0x34) char mutex;
__data __at (0x35) char empty;
__data __at (0x36) char full;
__data __at (0x37) char writeCursor;
__data __at (0x38) char readCursor;


void Producer(void)
{
    nextChar    = 'A';
    writeCursor = 0;

    while (1) {
        /* wait for a free slot, then acquire the lock */
        SemaphoreWait(empty);
        SemaphoreWait(mutex);

        /* critical section */
        circBuf[writeCursor] = nextChar;
        writeCursor = (writeCursor == 2) ? 0 : writeCursor + 1;
        /* end critical section */

        SemaphoreSignal(mutex);
        SemaphoreSignal(full);

        /* advance character outside the critical section */
        nextChar = (nextChar == 'Z') ? 'A' : nextChar + 1;
    }
}


void Consumer(void)
{
    /*
     * Initialise UART for 4800 baud (Timer 1, mode 2).
     * TMOD |= 0x20 is used (not plain assignment) so that
     * Bootstrap's Timer 0 configuration in the lower nibble
     * is preserved.
     */
    __critical {
        TMOD |= 0x20;
        TH1   = -6;
        SCON  = 0x50;
        TR1   = 1;
    }
    readCursor = 0;

    while (1) {
        /* wait for a filled slot, then acquire the lock */
        SemaphoreWait(full);
        SemaphoreWait(mutex);

        /* critical section */
        SBUF = circBuf[readCursor];
        readCursor = (readCursor == 2) ? 0 : readCursor + 1;
        /* end critical section */

        SemaphoreSignal(mutex);
        SemaphoreSignal(empty);

        /* wait for UART transmit to complete outside critical section */
        while (!TI);
        TI = 0;
    }
}


void main(void)
{
    /* initialise semaphores */
    SemaphoreCreate(full,  0);
    SemaphoreCreate(mutex, 1);
    SemaphoreCreate(empty, 3);

    ThreadCreate(Producer);   /* spawn Thread 1 */
    Consumer();               /* main becomes the Consumer */
}

/*  Startup hook — redirects C runtime init to Bootstrap              */
void _sdcc_gsinit_startup(void)
{
    __asm
        LJMP _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void)  {}
void _mcs51_genXINIT(void)     {}
void _mcs51_genXRAMCLEAR(void) {}
/*
 * Timer 0 ISR — must live in the same file as main() so SDCC
 * generates the correct interrupt-vector entry.
 * The body simply jumps to myTimer0Handler() in preemptive.c.
 */
void timer0_ISR(void) __interrupt(1) {
    __asm
        ljmp _myTimer0Handler
    __endasm;
}