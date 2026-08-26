/*
 * file: testcoop.c
 */
#include <8051.h>
#include "cooperative.h"

/*
 * [TODO]
 */
__data __at (0x3A) char buffer;
__data __at (0x3B) char currentChar;
__data __at (0x3C) char bufferFull;

/* [TODO for this function]
 */


void Producer(void)
{
    currentChar = 'A';
    while (1)
    {
        while (bufferFull){
            ThreadYield();
        }
        buffer = currentChar;
        bufferFull = 1;
        currentChar = (currentChar == 'Z') ? 'A' : currentChar + 1;
    }
}

/* [TODO for this function]
 */
void Consumer(void)
{
    TMOD = 0x20;
    TH1 = -6;
    SCON = 0x50;
    TR1 = 1;
    while (1){
        while (!bufferFull){
            ThreadYield();
        }
        SBUF = buffer;
        bufferFull = 0;
        while (!TI){
            ThreadYield();
        }
        TI = 0;
        //ThreadYield();    // yield to producer to produce the next character
    }
}

/* [TODO for this function]
 */
void main(void)
{
    bufferFull = 0;
    ThreadCreate(Producer);
    Consumer();
}

void _sdcc_gsinit_startup(void)
{
    __asm
        LJMP _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
