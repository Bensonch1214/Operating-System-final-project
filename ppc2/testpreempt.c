/*
 * testpreempt.c — test harness for preemptive multithreading
 *
 * Sets up a single-buffer producer-consumer pair.
 * The Producer generates characters 'A'–'Z' (cycling) and
 * writes each one into the shared buffer once the buffer is empty.
 * The Consumer reads from the buffer and transmits each character
 * over the serial port using UART polling.
 *
 * Thread layout:
 *   Thread 0 — main() → becomes Consumer after ThreadCreate(Producer)
 *   Thread 1 — Producer
 *
 * Preemption is handled entirely by Timer 0; neither Producer nor
 * Consumer calls ThreadYield().
 */

#include <8051.h>
#include "preemptive.h"

/*
 * Shared state between Producer and Consumer.
 * Placed at fixed IRAM addresses just above the scheduler's
 * scratch variables (0x30–0x39) and below the thread stacks
 * (0x40 onwards).
 */
__data __at (0x3A) char sharedBuffer;   /* the single-slot buffer      */
__data __at (0x3B) char nextChar;       /* Producer's current character */
__data __at (0x3C) char bufferReady;    /* 1 = buffer holds valid data  */



void Producer(void)
{
    nextChar = 'A';
    while (1) {
        /* Spin until Consumer has consumed the previous item */
        while (bufferReady)
            ;
        /* Atomically deposit the character and signal readiness */
        __critical {
            sharedBuffer = nextChar;
            bufferReady  = 1;
        }
        /* Advance to the next character, wrapping Z → A */
        if (nextChar == 'Z')
            nextChar = 'A';
        else
            nextChar++;
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

    while (1) {
        /* Spin until Producer has placed a character in the buffer */
        while (!bufferReady)
            ;
        /* Atomically read the character and clear the ready flag */
        __critical {
            SBUF      = sharedBuffer;
            bufferReady = 0;
        }
        /* Wait for the UART transmit shift-register to finish */
        while (!TI)
            ;
        TI = 0;   /* clear transmit-interrupt flag manually */
    }
}


void main(void)
{
    bufferReady = 0;          /* buffer starts empty */
    ThreadCreate(Producer);   /* spawn Thread 1 */
    Consumer();               /* main itself becomes the Consumer */
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