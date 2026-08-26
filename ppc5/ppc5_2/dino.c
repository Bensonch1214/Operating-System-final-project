/*
 * dino.c
 * Dinosaur game using three preemptive threads:
 *   render_task  - shifts cactus map and redraws the LCD each frame
 *   keypad_ctrl  - reads keypad input and moves the player
 *   game_ctrl    - waits for collision and displays the score
 */
#include <8051.h>
#include "preemptive.h"
#include "keylib.h"
#include "lcdlib.h"

/*
 * Global state (manually placed to avoid overlap with preemptive.c).
 * row_top/row_bot: 16-bit cactus bitmaps for each LCD row.
 *   bit 7 of [0] = col 0 (leftmost), bit 0 of [1] = col 15 (rightmost)
 * level: difficulty 1-9; placed at 0x34 to alias preemptive.c's my_time
 *        so the timer ISR automatically reloads TH0 with the right value.
 */
__data __at (0x30) unsigned char row_top[2];
__data __at (0x32) unsigned char row_bot[2];
__data __at (0x34) unsigned char level;      /* aliases my_time in preemptive.c */
__data __at (0x35) char          key_ch;
__data __at (0x36) char          spare;
__data __at (0x37) char          dino_row;
__data __at (0x38) unsigned char score;
__data __at (0x39) unsigned char gameover;
__data __at (0x3A) unsigned char carry;
__data __at (0x3B) unsigned char mask;

/*
 * render_task (Thread 1)
 * Each frame:
 *  (1) Check collision at col 1 (bit 0x40 of [0])
 *  (2) Left-shift both bitmaps; wrap exiting cactus to col 15
 *  (3) Redraw both rows; overdraw col 0 with the player sprite
 */
void render_task(void)
{
    while (1) {
        EA = 0;

        if (gameover) ThreadYield();

        /* collision check */
        if (dino_row == 0 && (row_top[0] & 0x40)) { gameover = 1; ThreadYield(); }
        if (dino_row == 1 && (row_bot[0] & 0x40)) { gameover = 1; ThreadYield(); }

        /* shift row_top left, wrap carry to rightmost column */
        carry = 0;
        if (row_top[0] & 0x80) carry = 1;
        row_top[0] <<= 1;
        if (row_top[1] & 0x80) row_top[0]++;
        row_top[1] <<= 1;
        if (carry) { score++; row_top[1]++; }

        /* shift row_bot left */
        carry = 0;
        if (row_bot[0] & 0x80) carry = 1;
        row_bot[0] <<= 1;
        if (row_bot[1] & 0x80) row_bot[0]++;
        row_bot[1] <<= 1;
        if (carry) { score++; row_bot[1]++; }

        /* draw row 0 (cols 0-7 then 8-14) */
        LCD_cursorGoTo(0, 0);
        mask = 0x80;
        while (mask) {
            LCD_write_char((row_top[0] & mask) ? '\2' : ' ');
            mask >>= 1;
        }
        mask = 0x80;
        while (mask != 1) {
            LCD_write_char((row_top[1] & mask) ? '\2' : ' ');
            mask >>= 1;
        }

        /* draw row 1 */
        LCD_cursorGoTo(1, 0);
        mask = 0x80;
        while (mask) {
            LCD_write_char((row_bot[0] & mask) ? '\2' : ' ');
            mask >>= 1;
        }
        mask = 0x80;
        while (mask != 1) {
            LCD_write_char((row_bot[1] & mask) ? '\2' : ' ');
            mask >>= 1;
        }

        /* overdraw col 0 with player sprite */
        LCD_cursorGoTo(dino_row, 0);
        LCD_write_char('\1');

        EA = 1;
        ThreadYield();
    }
}

/*
 * keypad_ctrl (Thread 2)
 * '2' moves player up (row 0), '8' moves player down (row 1).
 * Before moving, check col 0 of the destination row for a cactus.
 */
void keypad_ctrl(void)
{
    while (1) {
        while (!AnyKeyPressed());
        key_ch = KeyToChar();

        __critical {
            if (key_ch == '2' && dino_row == 1) {
                if (row_top[0] & 0x80) { gameover = 1; ThreadYield(); }
                dino_row = 0;
                LCD_cursorGoTo(1, 0); LCD_write_char(' ');
                LCD_cursorGoTo(0, 0); LCD_write_char('\1');
            }
            if (key_ch == '8' && dino_row == 0) {
                if (row_bot[0] & 0x80) { gameover = 1; ThreadYield(); }
                dino_row = 1;
                LCD_cursorGoTo(0, 0); LCD_write_char(' ');
                LCD_cursorGoTo(1, 0); LCD_write_char('\1');
            }
        }

        while (AnyKeyPressed());
    }
}

/*
 * game_ctrl (Thread 0, shared with main)
 * Yields until gameover, then prints the score and returns to main.
 */
void game_ctrl(void)
{
    while (1){
        if(gameover){
            EA = 0;
            LCD_cursorGoTo(0, 0);
            LCD_write_char('G');
            LCD_write_char('A');
            LCD_write_char('M');
            LCD_write_char('E');
            LCD_write_char(' ');
            LCD_write_char('O');
            LCD_write_char('V');
            LCD_write_char('E');
            LCD_write_char('R');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_cursorGoTo(1, 0);
            LCD_write_char('S');
            LCD_write_char('c');
            LCD_write_char('o');
            LCD_write_char('r');
            LCD_write_char('e');
            LCD_write_char(' ');
            LCD_write_char(':');
            LCD_write_char(score/10 + '0');
            LCD_write_char(score%10 + '0');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            LCD_write_char(' ');
            return;
        }
        ThreadYield();
    }
}

/*
 * main (Thread 0)
 * Initialises hardware, collects difficulty input (digit + '#'),
 * spawns threads, starts Timer 0, then runs game_ctrl().
 * Loops forever to support multiple rounds.
 */
void main(void)
{
    Init_Keypad();
    LCD_Init();
    LCD_entryModeSet(1, 1);
    LCD_displayOnOffControl(1, 0, 0);

    do {
        /* predefined starting map (no vertical or diagonal walls) */
        row_top[0] = 0x21;  row_top[1] = 0xC4;
        row_bot[0] = 0x08;  row_bot[1] = 0x11;

        EA       = 0;
        level    = 0;
        gameover = 0;
        score    = 0;
        dino_row = 0;

        /* wait for a digit then '#' to confirm difficulty */
        while (1) {
            while (!AnyKeyPressed());
            key_ch = KeyToChar();
            while (AnyKeyPressed());
            if (key_ch == '#') {
                if (level == 0) continue;
                else            break;
            }
            if (key_ch == '*') continue;
            level = key_ch - '0';
        }

        ThreadCreate(render_task);
        ThreadCreate(keypad_ctrl);

        TMOD = 0;            /* Timer 0 mode 0 (13-bit) */
        TH0  = (level << 4);
        TL0  = 0x00;
        IE   = 0x82;         /* enable Timer 0 interrupt */
        TR0  = 1;

        game_ctrl();

        EA = 0;
        ThreadReset();
    } while (1);
}

void _sdcc_gsinit_startup(void) { __asm LJMP _Bootstrap __endasm; }
void _mcs51_genRAMCLEAR(void)   {}
void _mcs51_genXINIT(void)      {}
void _mcs51_genXRAMCLEAR(void)  {}
void timer0_ISR(void) __interrupt(1) { __asm ljmp _myTimer0Handler __endasm; }
