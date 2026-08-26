;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (MINGW64)
;--------------------------------------------------------
	.module preemptive
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myTimer0Handler
	.globl _Bootstrap
	.globl _main
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
	.globl _nextID
	.globl _savedCurrentSP
	.globl _loopIdx
	.globl _threadMask
	.globl _currentThread
	.globl _savedSP
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
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
_savedSP	=	0x0020
_currentThread	=	0x0024
_threadMask	=	0x0025
_loopIdx	=	0x0026
_savedCurrentSP	=	0x0027
_nextID	=	0x0028
_mask	=	0x0029
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
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
_ThreadCreate_sloc0_1_0:
	.ds 1
_ThreadYield_sloc0_1_0:
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:71: void Bootstrap(void) {
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:72: threadMask    = 0;
	mov	_threadMask,#0x00
;	preemptive.c:73: TMOD          = 0;      /* Timer 0 mode 0 — 13-bit counter */
	mov	_TMOD,#0x00
;	preemptive.c:74: IE            = 0x82;   /* EA=1, ET0=1                     */
	mov	_IE,#0x82
;	preemptive.c:75: TR0           = 1;      /* start Timer 0                   */
;	assignBit
	setb	_TR0
;	preemptive.c:76: currentThread = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_currentThread,dpl
;	preemptive.c:77: RESTORESTATE;
	mov	a,_currentThread
	add	a, #_savedSP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:78: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:86: void myTimer0Handler(void) {
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:87: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:88: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_currentThread
	add	a, #_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:89: do {
00101$:
;	preemptive.c:90: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
	mov	a,#0x100 - 0x03
	add	a,_currentThread
	jc	00106$
	mov	r7,_currentThread
	inc	r7
	mov	a,r7
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	sjmp	00107$
00106$:
	mov	r6,#0x00
	mov	r7,#0x00
00107$:
	mov	_currentThread,r6
;	preemptive.c:91: mask = 1 << currentThread;
	mov	b,_currentThread
	inc	b
	mov	a,#0x01
	sjmp	00128$
00127$:
	add	a,acc
00128$:
	djnz	b,00127$
	mov	_mask,a
;	preemptive.c:92: } while (!(threadMask & mask));
	mov	a,_mask
	anl	a,_threadMask
	jz	00101$
;	preemptive.c:93: RESTORESTATE;
	mov	a,_currentThread
	add	a, #_savedSP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:94: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:97: __endasm;
	RETI
;	preemptive.c:98: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp            Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:101: ThreadID ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:102: if (threadMask == 0x0F) {
	mov	a,#0x0f
	cjne	a,_threadMask,00102$
;	preemptive.c:103: return -1;
	mov	dpl, #0xff
	ret
00102$:
;	preemptive.c:147: }
	setb	_ThreadCreate_sloc0_1_0
	jbc	ea,00136$
	clr	_ThreadCreate_sloc0_1_0
00136$:
;	preemptive.c:108: loopIdx = 0;
	mov	_loopIdx,#0x00
;	preemptive.c:109: while (loopIdx != MAXTHREADS) {
00105$:
	mov	a,#0x04
	cjne	a,_loopIdx,00137$
	sjmp	00107$
00137$:
;	preemptive.c:110: mask = 1 << loopIdx;
	mov	b,_loopIdx
	inc	b
	mov	a,#0x01
	sjmp	00139$
00138$:
	add	a,acc
00139$:
	djnz	b,00138$
	mov	_mask,a
;	preemptive.c:111: if (!(threadMask & mask)) {
	mov	a,_mask
	anl	a,_threadMask
	jnz	00104$
;	preemptive.c:112: threadMask |= mask; /* mark slot as occupied */
	mov	a,_mask
	orl	_threadMask,a
;	preemptive.c:113: nextID = loopIdx;
	mov	_nextID,_loopIdx
;	preemptive.c:114: break;
	sjmp	00107$
00104$:
;	preemptive.c:116: loopIdx++;
	mov	a,_loopIdx
	inc	a
	mov	_loopIdx,a
	sjmp	00105$
00107$:
;	preemptive.c:120: savedCurrentSP = SP;
	mov	_savedCurrentSP,_SP
;	preemptive.c:121: SP = 0x3F + (nextID << 4);  
	mov	a,_nextID
	swap	a
	anl	a,#0xf0
	mov	r7,a
	add	a,#0x3f
	mov	_SP,a
;	preemptive.c:127: __endasm;
	PUSH	DPL
	PUSH	DPH
;	preemptive.c:136: __endasm;
	ANL	A, #0
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
;	preemptive.c:139: PSW = (nextID << 3);
	mov	a,_nextID
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_PSW,a
;	preemptive.c:142: __endasm;
	PUSH	PSW
;	preemptive.c:145: savedSP[nextID] = SP;
	mov	a,_nextID
	add	a, #_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:146: SP = savedCurrentSP;
	mov	_SP,_savedCurrentSP
	mov	c,_ThreadCreate_sloc0_1_0
	mov	ea,c
;	preemptive.c:149: return nextID;
	mov	dpl, _nextID
;	preemptive.c:150: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:157: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:165: }
	setb	_ThreadYield_sloc0_1_0
	jbc	ea,00126$
	clr	_ThreadYield_sloc0_1_0
00126$:
;	preemptive.c:159: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_currentThread
	add	a, #_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:160: do {
00101$:
;	preemptive.c:161: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
	mov	a,#0x100 - 0x03
	add	a,_currentThread
	jc	00106$
	mov	r7,_currentThread
	inc	r7
	mov	a,r7
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	sjmp	00107$
00106$:
	mov	r6,#0x00
	mov	r7,#0x00
00107$:
	mov	_currentThread,r6
;	preemptive.c:162: mask = 1 << currentThread;
	mov	b,_currentThread
	inc	b
	mov	a,#0x01
	sjmp	00129$
00128$:
	add	a,acc
00129$:
	djnz	b,00128$
	mov	_mask,a
;	preemptive.c:163: } while (!(threadMask & mask));
	mov	a,_mask
	anl	a,_threadMask
	jz	00101$
;	preemptive.c:164: RESTORESTATE;
	mov	a,_currentThread
	add	a, #_savedSP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
	mov	c,_ThreadYield_sloc0_1_0
	mov	ea,c
;	preemptive.c:166: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:173: void ThreadExit(void) {
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemptive.c:174: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:176: mask = 1 << currentThread;
	mov	b,_currentThread
	inc	b
	mov	a,#0x01
	sjmp	00135$
00134$:
	add	a,acc
00135$:
	djnz	b,00134$
	mov	_mask,a
;	preemptive.c:177: threadMask ^= mask;
	mov	a,_mask
	xrl	_threadMask,a
;	preemptive.c:179: loopIdx = 0;
	mov	_loopIdx,#0x00
;	preemptive.c:180: while (loopIdx < MAXTHREADS) {
00103$:
	mov	a,#0x100 - 0x04
	add	a,_loopIdx
	jc	00105$
;	preemptive.c:181: mask = 1 << loopIdx;
	mov	b,_loopIdx
	inc	b
	mov	a,#0x01
	sjmp	00138$
00137$:
	add	a,acc
00138$:
	djnz	b,00137$
	mov	_mask,a
;	preemptive.c:182: if (mask & threadMask) {
	mov	a,_threadMask
	anl	a,_mask
	jz	00102$
;	preemptive.c:183: currentThread = loopIdx;
	mov	_currentThread,_loopIdx
;	preemptive.c:184: break;
	sjmp	00105$
00102$:
;	preemptive.c:186: loopIdx++;
	mov	a,_loopIdx
	inc	a
	mov	_loopIdx,a
	sjmp	00103$
00105$:
;	preemptive.c:189: if (loopIdx == MAXTHREADS) {
	mov	a,#0x04
	cjne	a,_loopIdx,00107$
;	preemptive.c:190: currentThread = -1;
	mov	_currentThread,#0xff
00107$:
;	preemptive.c:193: RESTORESTATE;
	mov	a,_currentThread
	add	a, #_savedSP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:194: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:195: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
