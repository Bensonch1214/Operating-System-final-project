;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (MINGW64)
;--------------------------------------------------------
	.module dino
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _game_ctrl
	.globl _keypad_ctrl
	.globl _render_task
	.globl _LCD_write_char
	.globl _LCD_IRWrite
	.globl _LCD_Init
	.globl _AnyKeyPressed
	.globl _KeyToChar
	.globl _Init_Keypad
	.globl _ThreadReset
	.globl _ThreadYield
	.globl _ThreadCreate
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _mask
	.globl _carry
	.globl _gameover
	.globl _score
	.globl _dino_row
	.globl _spare
	.globl _key_ch
	.globl _level
	.globl _row_bot
	.globl _row_top
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_row_top	=	0x0030
_row_bot	=	0x0032
_level	=	0x0034
_key_ch	=	0x0035
_spare	=	0x0036
_dino_row	=	0x0037
_score	=	0x0038
_gameover	=	0x0039
_carry	=	0x003a
_mask	=	0x003b
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_keypad_ctrl_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
; restartable atomic support routines
	.ds	2
sdcc_atomic_exchange_rollback_start::
	nop
	nop
sdcc_atomic_exchange_pdata_impl:
	movx	a, @r0
	mov	r3, a
	mov	a, r2
	movx	@r0, a
	sjmp	sdcc_atomic_exchange_exit
	nop
	nop
sdcc_atomic_exchange_xdata_impl:
	movx	a, @dptr
	mov	r3, a
	mov	a, r2
	movx	@dptr, a
	sjmp	sdcc_atomic_exchange_exit
sdcc_atomic_compare_exchange_idata_impl:
	mov	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	mov	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_pdata_impl:
	movx	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_xdata_impl:
	movx	a, @dptr
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@dptr, a
	ret
sdcc_atomic_exchange_rollback_end::

sdcc_atomic_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_exchange_pdata_impl
sdcc_atomic_exchange_idata_impl:
	mov	a, r2
	xch	a, @r0
	mov	dpl, a
	ret
sdcc_atomic_exchange_exit:
	mov	dpl, r3
	ret
sdcc_atomic_compare_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
	sjmp	sdcc_atomic_compare_exchange_idata_impl
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'render_task'
;------------------------------------------------------------
;	dino.c:38: void render_task(void)
;	-----------------------------------------
;	 function render_task
;	-----------------------------------------
_render_task:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	dino.c:40: while (1) {
00134$:
;	dino.c:41: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:43: if (gameover) ThreadYield();
	mov	a,_gameover
	jz	00102$
	lcall	_ThreadYield
00102$:
;	dino.c:46: if (dino_row == 0 && (row_top[0] & 0x40)) { gameover = 1; ThreadYield(); }
	mov	a,_dino_row
	jnz	00104$
	mov	a,_row_top
	jnb	acc.6,00104$
	mov	_gameover,#0x01
	lcall	_ThreadYield
00104$:
;	dino.c:47: if (dino_row == 1 && (row_bot[0] & 0x40)) { gameover = 1; ThreadYield(); }
	mov	a,#0x01
	cjne	a,_dino_row,00107$
	mov	a,_row_bot
	jnb	acc.6,00107$
	mov	_gameover,#0x01
	lcall	_ThreadYield
00107$:
;	dino.c:50: carry = 0;
	mov	_carry,#0x00
;	dino.c:51: if (row_top[0] & 0x80) carry = 1;
	mov	a,_row_top
	jnb	acc.7,00110$
	mov	_carry,#0x01
00110$:
;	dino.c:52: row_top[0] <<= 1;
	mov	a,_row_top
	add	a,_row_top
	mov	_row_top, a
;	dino.c:53: if (row_top[1] & 0x80) row_top[0]++;
	mov	a,(_row_top + 0x0001)
	jnb	acc.7,00112$
	mov	a,_row_top
	inc	a
	mov	_row_top,a
00112$:
;	dino.c:54: row_top[1] <<= 1;
	mov	a,(_row_top + 0x0001)
	add	a,acc
	mov	(_row_top + 0x0001), a
;	dino.c:55: if (carry) { score++; row_top[1]++; }
	mov	a,_carry
	jz	00114$
	mov	a,_score
	inc	a
	mov	_score,a
	mov	a,(_row_top + 0x0001)
	inc	a
	mov	(_row_top + 0x0001),a
00114$:
;	dino.c:58: carry = 0;
	mov	_carry,#0x00
;	dino.c:59: if (row_bot[0] & 0x80) carry = 1;
	mov	a,_row_bot
	jnb	acc.7,00116$
	mov	_carry,#0x01
00116$:
;	dino.c:60: row_bot[0] <<= 1;
	mov	a,_row_bot
	add	a,_row_bot
	mov	_row_bot, a
;	dino.c:61: if (row_bot[1] & 0x80) row_bot[0]++;
	mov	a,(_row_bot + 0x0001)
	jnb	acc.7,00118$
	mov	a,_row_bot
	inc	a
	mov	_row_bot,a
00118$:
;	dino.c:62: row_bot[1] <<= 1;
	mov	a,(_row_bot + 0x0001)
	add	a,acc
	mov	(_row_bot + 0x0001), a
;	dino.c:63: if (carry) { score++; row_bot[1]++; }
	mov	a,_carry
	jz	00120$
	mov	a,_score
	inc	a
	mov	_score,a
	mov	a,(_row_bot + 0x0001)
	inc	a
	mov	(_row_bot + 0x0001),a
00120$:
;	dino.c:66: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:67: mask = 0x80;
	mov	_mask,#0x80
;	dino.c:68: while (mask) {
00121$:
	mov	a,_mask
	jz	00123$
;	dino.c:69: LCD_write_char((row_top[0] & mask) ? '\2' : ' ');
	mov	a,_mask
	anl	a,_row_top
	jz	00138$
	mov	r7,#0x02
	sjmp	00139$
00138$:
	mov	r7,#0x20
00139$:
	mov	dpl,r7
	lcall	_LCD_write_char
;	dino.c:70: mask >>= 1;
	mov	a,_mask
	clr	c
	rrc	a
	mov	_mask,a
	sjmp	00121$
00123$:
;	dino.c:72: mask = 0x80;
	mov	_mask,#0x80
;	dino.c:73: while (mask != 1) {
00124$:
	mov	a,#0x01
	cjne	a,_mask,00304$
	sjmp	00126$
00304$:
;	dino.c:74: LCD_write_char((row_top[1] & mask) ? '\2' : ' ');
	mov	a,_mask
	anl	a,(_row_top + 0x0001)
	jz	00140$
	mov	r7,#0x02
	sjmp	00141$
00140$:
	mov	r7,#0x20
00141$:
	mov	dpl,r7
	lcall	_LCD_write_char
;	dino.c:75: mask >>= 1;
	mov	a,_mask
	clr	c
	rrc	a
	mov	_mask,a
	sjmp	00124$
00126$:
;	dino.c:79: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:80: mask = 0x80;
	mov	_mask,#0x80
;	dino.c:81: while (mask) {
00127$:
	mov	a,_mask
	jz	00129$
;	dino.c:82: LCD_write_char((row_bot[0] & mask) ? '\2' : ' ');
	mov	a,_mask
	anl	a,_row_bot
	jz	00142$
	mov	r7,#0x02
	sjmp	00143$
00142$:
	mov	r7,#0x20
00143$:
	mov	dpl,r7
	lcall	_LCD_write_char
;	dino.c:83: mask >>= 1;
	mov	a,_mask
	clr	c
	rrc	a
	mov	_mask,a
	sjmp	00127$
00129$:
;	dino.c:85: mask = 0x80;
	mov	_mask,#0x80
;	dino.c:86: while (mask != 1) {
00130$:
	mov	a,#0x01
	cjne	a,_mask,00308$
	sjmp	00132$
00308$:
;	dino.c:87: LCD_write_char((row_bot[1] & mask) ? '\2' : ' ');
	mov	a,_mask
	anl	a,(_row_bot + 0x0001)
	jz	00144$
	mov	r7,#0x02
	sjmp	00145$
00144$:
	mov	r7,#0x20
00145$:
	mov	dpl,r7
	lcall	_LCD_write_char
;	dino.c:88: mask >>= 1;
	mov	a,_mask
	clr	c
	rrc	a
	mov	_mask,a
	sjmp	00130$
00132$:
;	dino.c:92: LCD_cursorGoTo(dino_row, 0);
	mov	a,_dino_row
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:93: LCD_write_char('\1');
	mov	dpl, #0x01
	lcall	_LCD_write_char
;	dino.c:95: EA = 1;
;	assignBit
	setb	_EA
;	dino.c:96: ThreadYield();
	lcall	_ThreadYield
;	dino.c:98: }
	ljmp	00134$
;------------------------------------------------------------
;Allocation info for local variables in function 'keypad_ctrl'
;------------------------------------------------------------
;	dino.c:105: void keypad_ctrl(void)
;	-----------------------------------------
;	 function keypad_ctrl
;	-----------------------------------------
_keypad_ctrl:
;	dino.c:108: while (!AnyKeyPressed());
00101$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jz	00101$
;	dino.c:109: key_ch = KeyToChar();
	lcall	_KeyToChar
	mov	_key_ch,dpl
;	dino.c:124: }
	setb	_keypad_ctrl_sloc0_1_0
	jbc	ea,00183$
	clr	_keypad_ctrl_sloc0_1_0
00183$:
;	dino.c:112: if (key_ch == '2' && dino_row == 1) {
	mov	a,#0x32
	cjne	a,_key_ch,00107$
	mov	a,#0x01
	cjne	a,_dino_row,00107$
;	dino.c:113: if (row_top[0] & 0x80) { gameover = 1; ThreadYield(); }
	mov	a,_row_top
	jnb	acc.7,00105$
	mov	_gameover,#0x01
	lcall	_ThreadYield
00105$:
;	dino.c:114: dino_row = 0;
	mov	_dino_row,#0x00
;	dino.c:115: LCD_cursorGoTo(1, 0); LCD_write_char(' ');
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:116: LCD_cursorGoTo(0, 0); LCD_write_char('\1');
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
	mov	dpl, #0x01
	lcall	_LCD_write_char
00107$:
;	dino.c:118: if (key_ch == '8' && dino_row == 0) {
	mov	a,#0x38
	cjne	a,_key_ch,00112$
	mov	a,_dino_row
	jnz	00112$
;	dino.c:119: if (row_bot[0] & 0x80) { gameover = 1; ThreadYield(); }
	mov	a,_row_bot
	jnb	acc.7,00110$
	mov	_gameover,#0x01
	lcall	_ThreadYield
00110$:
;	dino.c:120: dino_row = 1;
	mov	_dino_row,#0x01
;	dino.c:121: LCD_cursorGoTo(0, 0); LCD_write_char(' ');
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:122: LCD_cursorGoTo(1, 0); LCD_write_char('\1');
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
	mov	dpl, #0x01
	lcall	_LCD_write_char
00112$:
	mov	c,_keypad_ctrl_sloc0_1_0
	mov	ea,c
;	dino.c:126: while (AnyKeyPressed());
00114$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jnz	00114$
;	dino.c:128: }
	ljmp	00101$
;------------------------------------------------------------
;Allocation info for local variables in function 'game_ctrl'
;------------------------------------------------------------
;	dino.c:134: void game_ctrl(void)
;	-----------------------------------------
;	 function game_ctrl
;	-----------------------------------------
_game_ctrl:
;	dino.c:136: while (1){
00104$:
;	dino.c:137: if(gameover){
	mov	a,_gameover
	jnz	00120$
	ljmp	00102$
00120$:
;	dino.c:138: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:139: LCD_cursorGoTo(0, 0);
	mov	dpl, #0x80
	lcall	_LCD_IRWrite
;	dino.c:140: LCD_write_char('G');
	mov	dpl, #0x47
	lcall	_LCD_write_char
;	dino.c:141: LCD_write_char('A');
	mov	dpl, #0x41
	lcall	_LCD_write_char
;	dino.c:142: LCD_write_char('M');
	mov	dpl, #0x4d
	lcall	_LCD_write_char
;	dino.c:143: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:144: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:145: LCD_write_char('O');
	mov	dpl, #0x4f
	lcall	_LCD_write_char
;	dino.c:146: LCD_write_char('V');
	mov	dpl, #0x56
	lcall	_LCD_write_char
;	dino.c:147: LCD_write_char('E');
	mov	dpl, #0x45
	lcall	_LCD_write_char
;	dino.c:148: LCD_write_char('R');
	mov	dpl, #0x52
	lcall	_LCD_write_char
;	dino.c:149: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:150: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:151: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:152: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:153: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:154: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:155: LCD_cursorGoTo(1, 0);
	mov	dpl, #0xc0
	lcall	_LCD_IRWrite
;	dino.c:156: LCD_write_char('S');
	mov	dpl, #0x53
	lcall	_LCD_write_char
;	dino.c:157: LCD_write_char('c');
	mov	dpl, #0x63
	lcall	_LCD_write_char
;	dino.c:158: LCD_write_char('o');
	mov	dpl, #0x6f
	lcall	_LCD_write_char
;	dino.c:159: LCD_write_char('r');
	mov	dpl, #0x72
	lcall	_LCD_write_char
;	dino.c:160: LCD_write_char('e');
	mov	dpl, #0x65
	lcall	_LCD_write_char
;	dino.c:161: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:162: LCD_write_char(':');
	mov	dpl, #0x3a
	lcall	_LCD_write_char
;	dino.c:163: LCD_write_char(score/10 + '0');
	mov	r7,_score
	mov	b,#0x0a
	mov	a,r7
	div	ab
	add	a,#0x30
	mov	dpl,a
	lcall	_LCD_write_char
;	dino.c:164: LCD_write_char(score%10 + '0');
	mov	r7,_score
	mov	b,#0x0a
	mov	a,r7
	div	ab
	mov	r7,b
	mov	a,#0x30
	add	a, r7
	mov	dpl,a
	lcall	_LCD_write_char
;	dino.c:165: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:166: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:167: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:168: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:169: LCD_write_char(' ');
	mov	dpl, #0x20
	lcall	_LCD_write_char
;	dino.c:170: LCD_write_char(' ');
	mov	dpl, #0x20
;	dino.c:171: return;
	ljmp	_LCD_write_char
00102$:
;	dino.c:173: ThreadYield();
	lcall	_ThreadYield
;	dino.c:175: }
	ljmp	00104$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	dino.c:183: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	dino.c:185: Init_Keypad();
	lcall	_Init_Keypad
;	dino.c:186: LCD_Init();
	lcall	_LCD_Init
;	dino.c:187: LCD_entryModeSet(1, 1);
	mov	dpl, #0x07
	lcall	_LCD_IRWrite
;	dino.c:188: LCD_displayOnOffControl(1, 0, 0);
	mov	dpl, #0x0c
	lcall	_LCD_IRWrite
;	dino.c:190: do {
00117$:
;	dino.c:192: row_top[0] = 0x21;  row_top[1] = 0xC4;
	mov	_row_top,#0x21
	mov	(_row_top + 0x0001),#0xc4
;	dino.c:193: row_bot[0] = 0x08;  row_bot[1] = 0x11;
	mov	_row_bot,#0x08
	mov	(_row_bot + 0x0001),#0x11
;	dino.c:195: EA       = 0;
;	assignBit
	clr	_EA
;	dino.c:196: level    = 0;
	mov	_level,#0x00
;	dino.c:197: gameover = 0;
	mov	_gameover,#0x00
;	dino.c:198: score    = 0;
	mov	_score,#0x00
;	dino.c:199: dino_row = 0;
	mov	_dino_row,#0x00
;	dino.c:203: while (!AnyKeyPressed());
00101$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jz	00101$
;	dino.c:204: key_ch = KeyToChar();
	lcall	_KeyToChar
	mov	_key_ch,dpl
;	dino.c:205: while (AnyKeyPressed());
00104$:
	lcall	_AnyKeyPressed
	mov	a, dpl
	jnz	00104$
;	dino.c:206: if (key_ch == '#') {
	mov	a,#0x23
	cjne	a,_key_ch,00111$
;	dino.c:207: if (level == 0) continue;
	mov	a,_level
	jnz	00116$
;	dino.c:208: else            break;
	sjmp	00101$
00111$:
;	dino.c:210: if (key_ch == '*') continue;
	mov	a,#0x2a
	cjne	a,_key_ch,00175$
	sjmp	00101$
00175$:
;	dino.c:211: level = key_ch - '0';
	mov	a,_key_ch
	add	a,#0xd0
	mov	_level,a
	sjmp	00101$
00116$:
;	dino.c:214: ThreadCreate(render_task);
	mov	dptr,#_render_task
	lcall	_ThreadCreate
;	dino.c:215: ThreadCreate(keypad_ctrl);
	mov	dptr,#_keypad_ctrl
	lcall	_ThreadCreate
;	dino.c:217: TMOD = 0;            /* Timer 0 mode 0 (13-bit) */
	mov	_TMOD,#0x00
;	dino.c:218: TH0  = (level << 4);
	mov	a,_level
	swap	a
	anl	a,#0xf0
	mov	_TH0,a
;	dino.c:219: TL0  = 0x00;
	mov	_TL0,#0x00
;	dino.c:220: IE   = 0x82;         /* enable Timer 0 interrupt */
	mov	_IE,#0x82
;	dino.c:221: TR0  = 1;
;	assignBit
	setb	_TR0
;	dino.c:223: game_ctrl();
	lcall	_game_ctrl
;	dino.c:225: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:226: ThreadReset();
	lcall	_ThreadReset
;	dino.c:227: } while (1);
;	dino.c:228: }
	sjmp	00117$
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	dino.c:230: void _sdcc_gsinit_startup(void) { __asm LJMP _Bootstrap __endasm; }
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
	LJMP	_Bootstrap 
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	dino.c:231: void _mcs51_genRAMCLEAR(void)   {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	dino.c:232: void _mcs51_genXINIT(void)      {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	dino.c:233: void _mcs51_genXRAMCLEAR(void)  {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	dino.c:234: void timer0_ISR(void) __interrupt(1) { __asm ljmp _myTimer0Handler __endasm; }
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
	ljmp	_myTimer0Handler 
	ljmp	sdcc_atomic_maybe_rollback
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
