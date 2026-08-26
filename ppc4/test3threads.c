#include <8051.h>
#include "preemptive.h"

__data __at (0x30) char circBuf[3];
__data __at (0x33) char nextChar;
__data __at (0x34) char mutex;
__data __at (0x35) char empty;
__data __at (0x36) char full;
__data __at (0x37) char writeCursor;
__data __at (0x38) char readCursor;
__data __at (0x39) char nextNum;

#define LABEL(x) x ## $
#define L(x) LABEL(x)

void Producer1(void)
{
    nextChar = 'A';
    while (1){
        SemaphoreWaitBody(empty,  L(__COUNTER__));
        SemaphoreWaitBody(mutex,  L(__COUNTER__));
        circBuf[writeCursor] = nextChar;
        writeCursor = (writeCursor == 2) ? 0 : writeCursor + 1;
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
        nextChar = (nextChar == 'Z') ? 'A' : nextChar + 1;
    }
}

void Producer2(void)
{
    nextNum = '0';
    while (1){
        SemaphoreWaitBody(empty,  L(__COUNTER__));
        SemaphoreWaitBody(mutex,  L(__COUNTER__));
        circBuf[writeCursor] = nextNum;
        writeCursor = (writeCursor == 2) ? 0 : writeCursor + 1;
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
        nextNum = (nextNum == '9') ? '0' : nextNum + 1;
    }
}

void Consumer(void)
{
    EA = 0;
    TMOD |= 0x20;
    TH1 = -6;
    SCON = 0x50;
    TR1 = 1;
    EA = 1;
    readCursor = 0;
    while (1){
        SemaphoreWaitBody(full,  L(__COUNTER__));
        SemaphoreWaitBody(mutex,  L(__COUNTER__));
        SBUF = circBuf[readCursor];
        SemaphoreSignal(mutex);
        readCursor = (readCursor == 2) ? 0 : readCursor + 1;
        SemaphoreSignal(empty);
        while (!TI);
        TI = 0;
    }
}

void main(void)
{
    writeCursor = 0;
    SemaphoreCreate(full, 0);
    SemaphoreCreate(mutex, 1);
    SemaphoreCreate(empty, 3);
    ThreadCreate(Consumer); // for unfairness test
    ThreadCreate(Producer2);  //
    Producer1(); //
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
void timer0_ISR(void) __interrupt(1) {
        __asm
            ljmp _myTimer0Handler
        __endasm;
}