                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _bufferReady
                                    117 	.globl _nextChar
                                    118 	.globl _sharedBuffer
                                    119 ;--------------------------------------------------------
                                    120 ; special function registers
                                    121 ;--------------------------------------------------------
                                    122 	.area RSEG    (ABS,DATA)
      000000                        123 	.org 0x0000
                           000080   124 _P0	=	0x0080
                           000081   125 _SP	=	0x0081
                           000082   126 _DPL	=	0x0082
                           000083   127 _DPH	=	0x0083
                           000087   128 _PCON	=	0x0087
                           000088   129 _TCON	=	0x0088
                           000089   130 _TMOD	=	0x0089
                           00008A   131 _TL0	=	0x008a
                           00008B   132 _TL1	=	0x008b
                           00008C   133 _TH0	=	0x008c
                           00008D   134 _TH1	=	0x008d
                           000090   135 _P1	=	0x0090
                           000098   136 _SCON	=	0x0098
                           000099   137 _SBUF	=	0x0099
                           0000A0   138 _P2	=	0x00a0
                           0000A8   139 _IE	=	0x00a8
                           0000B0   140 _P3	=	0x00b0
                           0000B8   141 _IP	=	0x00b8
                           0000D0   142 _PSW	=	0x00d0
                           0000E0   143 _ACC	=	0x00e0
                           0000F0   144 _B	=	0x00f0
                                    145 ;--------------------------------------------------------
                                    146 ; special function bits
                                    147 ;--------------------------------------------------------
                                    148 	.area RSEG    (ABS,DATA)
      000000                        149 	.org 0x0000
                           000080   150 _P0_0	=	0x0080
                           000081   151 _P0_1	=	0x0081
                           000082   152 _P0_2	=	0x0082
                           000083   153 _P0_3	=	0x0083
                           000084   154 _P0_4	=	0x0084
                           000085   155 _P0_5	=	0x0085
                           000086   156 _P0_6	=	0x0086
                           000087   157 _P0_7	=	0x0087
                           000088   158 _IT0	=	0x0088
                           000089   159 _IE0	=	0x0089
                           00008A   160 _IT1	=	0x008a
                           00008B   161 _IE1	=	0x008b
                           00008C   162 _TR0	=	0x008c
                           00008D   163 _TF0	=	0x008d
                           00008E   164 _TR1	=	0x008e
                           00008F   165 _TF1	=	0x008f
                           000090   166 _P1_0	=	0x0090
                           000091   167 _P1_1	=	0x0091
                           000092   168 _P1_2	=	0x0092
                           000093   169 _P1_3	=	0x0093
                           000094   170 _P1_4	=	0x0094
                           000095   171 _P1_5	=	0x0095
                           000096   172 _P1_6	=	0x0096
                           000097   173 _P1_7	=	0x0097
                           000098   174 _RI	=	0x0098
                           000099   175 _TI	=	0x0099
                           00009A   176 _RB8	=	0x009a
                           00009B   177 _TB8	=	0x009b
                           00009C   178 _REN	=	0x009c
                           00009D   179 _SM2	=	0x009d
                           00009E   180 _SM1	=	0x009e
                           00009F   181 _SM0	=	0x009f
                           0000A0   182 _P2_0	=	0x00a0
                           0000A1   183 _P2_1	=	0x00a1
                           0000A2   184 _P2_2	=	0x00a2
                           0000A3   185 _P2_3	=	0x00a3
                           0000A4   186 _P2_4	=	0x00a4
                           0000A5   187 _P2_5	=	0x00a5
                           0000A6   188 _P2_6	=	0x00a6
                           0000A7   189 _P2_7	=	0x00a7
                           0000A8   190 _EX0	=	0x00a8
                           0000A9   191 _ET0	=	0x00a9
                           0000AA   192 _EX1	=	0x00aa
                           0000AB   193 _ET1	=	0x00ab
                           0000AC   194 _ES	=	0x00ac
                           0000AF   195 _EA	=	0x00af
                           0000B0   196 _P3_0	=	0x00b0
                           0000B1   197 _P3_1	=	0x00b1
                           0000B2   198 _P3_2	=	0x00b2
                           0000B3   199 _P3_3	=	0x00b3
                           0000B4   200 _P3_4	=	0x00b4
                           0000B5   201 _P3_5	=	0x00b5
                           0000B6   202 _P3_6	=	0x00b6
                           0000B7   203 _P3_7	=	0x00b7
                           0000B0   204 _RXD	=	0x00b0
                           0000B1   205 _TXD	=	0x00b1
                           0000B2   206 _INT0	=	0x00b2
                           0000B3   207 _INT1	=	0x00b3
                           0000B4   208 _T0	=	0x00b4
                           0000B5   209 _T1	=	0x00b5
                           0000B6   210 _WR	=	0x00b6
                           0000B7   211 _RD	=	0x00b7
                           0000B8   212 _PX0	=	0x00b8
                           0000B9   213 _PT0	=	0x00b9
                           0000BA   214 _PX1	=	0x00ba
                           0000BB   215 _PT1	=	0x00bb
                           0000BC   216 _PS	=	0x00bc
                           0000D0   217 _P	=	0x00d0
                           0000D1   218 _F1	=	0x00d1
                           0000D2   219 _OV	=	0x00d2
                           0000D3   220 _RS0	=	0x00d3
                           0000D4   221 _RS1	=	0x00d4
                           0000D5   222 _F0	=	0x00d5
                           0000D6   223 _AC	=	0x00d6
                           0000D7   224 _CY	=	0x00d7
                                    225 ;--------------------------------------------------------
                                    226 ; overlayable register banks
                                    227 ;--------------------------------------------------------
                                    228 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        229 	.ds 8
                                    230 ;--------------------------------------------------------
                                    231 ; internal ram data
                                    232 ;--------------------------------------------------------
                                    233 	.area DSEG    (DATA)
                           00003A   234 _sharedBuffer	=	0x003a
                           00003B   235 _nextChar	=	0x003b
                           00003C   236 _bufferReady	=	0x003c
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable items in internal ram
                                    239 ;--------------------------------------------------------
                                    240 ;--------------------------------------------------------
                                    241 ; Stack segment in internal ram
                                    242 ;--------------------------------------------------------
                                    243 	.area SSEG
      000021                        244 __start__stack:
      000021                        245 	.ds	1
                                    246 
                                    247 ;--------------------------------------------------------
                                    248 ; indirectly addressable internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area ISEG    (DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; absolute internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area IABS    (ABS,DATA)
                                    255 	.area IABS    (ABS,DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; bit data
                                    258 ;--------------------------------------------------------
                                    259 	.area BSEG    (BIT)
      000000                        260 _Producer_sloc0_1_0:
      000000                        261 	.ds 1
      000001                        262 _Consumer_sloc0_1_0:
      000001                        263 	.ds 1
                                    264 ;--------------------------------------------------------
                                    265 ; paged external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area PSEG    (PAG,XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; uninitialized external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XSEG    (XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; absolute external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XABS    (ABS,XDATA)
                                    276 ;--------------------------------------------------------
                                    277 ; initialized external ram data
                                    278 ;--------------------------------------------------------
                                    279 	.area XISEG   (XDATA)
                                    280 	.area HOME    (CODE)
                                    281 	.area GSINIT0 (CODE)
                                    282 	.area GSINIT1 (CODE)
                                    283 	.area GSINIT2 (CODE)
                                    284 	.area GSINIT3 (CODE)
                                    285 	.area GSINIT4 (CODE)
                                    286 	.area GSINIT5 (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 	.area GSFINAL (CODE)
                                    289 	.area CSEG    (CODE)
                                    290 ;--------------------------------------------------------
                                    291 ; interrupt vector
                                    292 ;--------------------------------------------------------
                                    293 	.area HOME    (CODE)
      000000                        294 __interrupt_vect:
      000000 02 00 E6         [24]  295 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  296 	reti
      000004                        297 	.ds	7
      00000B 02 00 ED         [24]  298 	ljmp	_timer0_ISR
                                    299 ; restartable atomic support routines
      00000E                        300 	.ds	2
      000010                        301 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  302 	nop
      000011 00               [12]  303 	nop
      000012                        304 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  305 	movx	a, @r0
      000013 FB               [12]  306 	mov	r3, a
      000014 EA               [12]  307 	mov	a, r2
      000015 F2               [24]  308 	movx	@r0, a
      000016 80 2C            [24]  309 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  310 	nop
      000019 00               [12]  311 	nop
      00001A                        312 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  313 	movx	a, @dptr
      00001B FB               [12]  314 	mov	r3, a
      00001C EA               [12]  315 	mov	a, r2
      00001D F0               [24]  316 	movx	@dptr, a
      00001E 80 24            [24]  317 	sjmp	sdcc_atomic_exchange_exit
      000020                        318 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  319 	mov	a, @r0
      000021 B5 02 02         [24]  320 	cjne	a, ar2, .+#5
      000024 EB               [12]  321 	mov	a, r3
      000025 F6               [12]  322 	mov	@r0, a
      000026 22               [24]  323 	ret
      000027 00               [12]  324 	nop
      000028                        325 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  326 	movx	a, @r0
      000029 B5 02 02         [24]  327 	cjne	a, ar2, .+#5
      00002C EB               [12]  328 	mov	a, r3
      00002D F2               [24]  329 	movx	@r0, a
      00002E 22               [24]  330 	ret
      00002F 00               [12]  331 	nop
      000030                        332 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  333 	movx	a, @dptr
      000031 B5 02 02         [24]  334 	cjne	a, ar2, .+#5
      000034 EB               [12]  335 	mov	a, r3
      000035 F0               [24]  336 	movx	@dptr, a
      000036 22               [24]  337 	ret
      000037                        338 sdcc_atomic_exchange_rollback_end::
                                    339 
      000037                        340 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  341 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  342 	mov	r0, dpl
      00003C 20 F5 D3         [24]  343 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        344 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  345 	mov	a, r2
      000040 C6               [12]  346 	xch	a, @r0
      000041 F5 82            [12]  347 	mov	dpl, a
      000043 22               [24]  348 	ret
      000044                        349 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  350 	mov	dpl, r3
      000046 22               [24]  351 	ret
      000047                        352 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  353 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  354 	mov	r0, dpl
      00004C 20 F5 D9         [24]  355 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  356 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    357 ;--------------------------------------------------------
                                    358 ; global & static initialisations
                                    359 ;--------------------------------------------------------
                                    360 	.area HOME    (CODE)
                                    361 	.area GSINIT  (CODE)
                                    362 	.area GSFINAL (CODE)
                                    363 	.area GSINIT  (CODE)
                                    364 	.globl __sdcc_gsinit_startup
                                    365 	.globl __sdcc_program_startup
                                    366 	.globl __start__stack
                                    367 	.globl __mcs51_genXINIT
                                    368 	.globl __mcs51_genXRAMCLEAR
                                    369 	.globl __mcs51_genRAMCLEAR
                                    370 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  371 	ljmp	__sdcc_program_startup
                                    372 ;--------------------------------------------------------
                                    373 ; Home
                                    374 ;--------------------------------------------------------
                                    375 	.area HOME    (CODE)
                                    376 	.area HOME    (CODE)
      000051                        377 __sdcc_program_startup:
      000051 02 00 DA         [24]  378 	ljmp	_main
                                    379 ;	return from main will return to caller
                                    380 ;--------------------------------------------------------
                                    381 ; code
                                    382 ;--------------------------------------------------------
                                    383 	.area CSEG    (CODE)
                                    384 ;------------------------------------------------------------
                                    385 ;Allocation info for local variables in function 'Producer'
                                    386 ;------------------------------------------------------------
                                    387 ;	testpreempt.c:33: void Producer(void)
                                    388 ;	-----------------------------------------
                                    389 ;	 function Producer
                                    390 ;	-----------------------------------------
      000081                        391 _Producer:
                           000007   392 	ar7 = 0x07
                           000006   393 	ar6 = 0x06
                           000005   394 	ar5 = 0x05
                           000004   395 	ar4 = 0x04
                           000003   396 	ar3 = 0x03
                           000002   397 	ar2 = 0x02
                           000001   398 	ar1 = 0x01
                           000000   399 	ar0 = 0x00
                                    400 ;	testpreempt.c:35: nextChar = 'A';
      000081 75 3B 41         [24]  401 	mov	_nextChar,#0x41
                                    402 ;	testpreempt.c:38: while (bufferReady)
      000084                        403 00101$:
      000084 E5 3C            [12]  404 	mov	a,_bufferReady
      000086 70 FC            [24]  405 	jnz	00101$
                                    406 ;	testpreempt.c:44: }
      000088 D2 00            [12]  407 	setb	_Producer_sloc0_1_0
      00008A 10 AF 02         [24]  408 	jbc	ea,00131$
      00008D C2 00            [12]  409 	clr	_Producer_sloc0_1_0
      00008F                        410 00131$:
                                    411 ;	testpreempt.c:42: sharedBuffer = nextChar;
      00008F 85 3B 3A         [24]  412 	mov	_sharedBuffer,_nextChar
                                    413 ;	testpreempt.c:43: bufferReady  = 1;
      000092 75 3C 01         [24]  414 	mov	_bufferReady,#0x01
      000095 A2 00            [12]  415 	mov	c,_Producer_sloc0_1_0
      000097 92 AF            [24]  416 	mov	ea,c
                                    417 ;	testpreempt.c:46: if (nextChar == 'Z')
      000099 74 5A            [12]  418 	mov	a,#0x5a
      00009B B5 3B 05         [24]  419 	cjne	a,_nextChar,00105$
                                    420 ;	testpreempt.c:47: nextChar = 'A';
      00009E 75 3B 41         [24]  421 	mov	_nextChar,#0x41
      0000A1 80 E1            [24]  422 	sjmp	00101$
      0000A3                        423 00105$:
                                    424 ;	testpreempt.c:49: nextChar++;
      0000A3 E5 3B            [12]  425 	mov	a,_nextChar
      0000A5 04               [12]  426 	inc	a
      0000A6 F5 3B            [12]  427 	mov	_nextChar,a
                                    428 ;	testpreempt.c:51: }
      0000A8 80 DA            [24]  429 	sjmp	00101$
                                    430 ;------------------------------------------------------------
                                    431 ;Allocation info for local variables in function 'Consumer'
                                    432 ;------------------------------------------------------------
                                    433 ;	testpreempt.c:55: void Consumer(void)
                                    434 ;	-----------------------------------------
                                    435 ;	 function Consumer
                                    436 ;	-----------------------------------------
      0000AA                        437 _Consumer:
                                    438 ;	testpreempt.c:68: }
      0000AA D2 01            [12]  439 	setb	_Consumer_sloc0_1_0
      0000AC 10 AF 02         [24]  440 	jbc	ea,00136$
      0000AF C2 01            [12]  441 	clr	_Consumer_sloc0_1_0
      0000B1                        442 00136$:
                                    443 ;	testpreempt.c:64: TMOD |= 0x20;
      0000B1 43 89 20         [24]  444 	orl	_TMOD,#0x20
                                    445 ;	testpreempt.c:65: TH1   = -6;
      0000B4 75 8D FA         [24]  446 	mov	_TH1,#0xfa
                                    447 ;	testpreempt.c:66: SCON  = 0x50;
      0000B7 75 98 50         [24]  448 	mov	_SCON,#0x50
                                    449 ;	testpreempt.c:67: TR1   = 1;
                                    450 ;	assignBit
      0000BA D2 8E            [12]  451 	setb	_TR1
      0000BC A2 01            [12]  452 	mov	c,_Consumer_sloc0_1_0
      0000BE 92 AF            [24]  453 	mov	ea,c
                                    454 ;	testpreempt.c:72: while (!bufferReady)
      0000C0                        455 00101$:
      0000C0 E5 3C            [12]  456 	mov	a,_bufferReady
      0000C2 60 FC            [24]  457 	jz	00101$
                                    458 ;	testpreempt.c:78: }
      0000C4 D2 01            [12]  459 	setb	_Consumer_sloc0_1_0
      0000C6 10 AF 02         [24]  460 	jbc	ea,00138$
      0000C9 C2 01            [12]  461 	clr	_Consumer_sloc0_1_0
      0000CB                        462 00138$:
                                    463 ;	testpreempt.c:76: SBUF      = sharedBuffer;
      0000CB 85 3A 99         [24]  464 	mov	_SBUF,_sharedBuffer
                                    465 ;	testpreempt.c:77: bufferReady = 0;
      0000CE 75 3C 00         [24]  466 	mov	_bufferReady,#0x00
      0000D1 A2 01            [12]  467 	mov	c,_Consumer_sloc0_1_0
      0000D3 92 AF            [24]  468 	mov	ea,c
                                    469 ;	testpreempt.c:80: while (!TI)
      0000D5                        470 00104$:
                                    471 ;	testpreempt.c:82: TI = 0;   /* clear transmit-interrupt flag manually */
                                    472 ;	assignBit
      0000D5 10 99 E8         [24]  473 	jbc	_TI,00101$
                                    474 ;	testpreempt.c:84: }
      0000D8 80 FB            [24]  475 	sjmp	00104$
                                    476 ;------------------------------------------------------------
                                    477 ;Allocation info for local variables in function 'main'
                                    478 ;------------------------------------------------------------
                                    479 ;	testpreempt.c:87: void main(void)
                                    480 ;	-----------------------------------------
                                    481 ;	 function main
                                    482 ;	-----------------------------------------
      0000DA                        483 _main:
                                    484 ;	testpreempt.c:89: bufferReady = 0;          /* buffer starts empty */
      0000DA 75 3C 00         [24]  485 	mov	_bufferReady,#0x00
                                    486 ;	testpreempt.c:90: ThreadCreate(Producer);   /* spawn Thread 1 */
      0000DD 90 00 81         [24]  487 	mov	dptr,#_Producer
      0000E0 12 01 6E         [24]  488 	lcall	_ThreadCreate
                                    489 ;	testpreempt.c:91: Consumer();               /* main itself becomes the Consumer */
                                    490 ;	testpreempt.c:92: }
      0000E3 02 00 AA         [24]  491 	ljmp	_Consumer
                                    492 ;------------------------------------------------------------
                                    493 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    494 ;------------------------------------------------------------
                                    495 ;	testpreempt.c:96: void _sdcc_gsinit_startup(void)
                                    496 ;	-----------------------------------------
                                    497 ;	 function _sdcc_gsinit_startup
                                    498 ;	-----------------------------------------
      0000E6                        499 __sdcc_gsinit_startup:
                                    500 ;	testpreempt.c:100: __endasm;
      0000E6 02 00 F3         [24]  501 	LJMP	_Bootstrap
                                    502 ;	testpreempt.c:101: }
      0000E9 22               [24]  503 	ret
                                    504 ;------------------------------------------------------------
                                    505 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    506 ;------------------------------------------------------------
                                    507 ;	testpreempt.c:104: void _mcs51_genRAMCLEAR(void)  {}
                                    508 ;	-----------------------------------------
                                    509 ;	 function _mcs51_genRAMCLEAR
                                    510 ;	-----------------------------------------
      0000EA                        511 __mcs51_genRAMCLEAR:
      0000EA 22               [24]  512 	ret
                                    513 ;------------------------------------------------------------
                                    514 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    515 ;------------------------------------------------------------
                                    516 ;	testpreempt.c:105: void _mcs51_genXINIT(void)     {}
                                    517 ;	-----------------------------------------
                                    518 ;	 function _mcs51_genXINIT
                                    519 ;	-----------------------------------------
      0000EB                        520 __mcs51_genXINIT:
      0000EB 22               [24]  521 	ret
                                    522 ;------------------------------------------------------------
                                    523 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    524 ;------------------------------------------------------------
                                    525 ;	testpreempt.c:106: void _mcs51_genXRAMCLEAR(void) {}
                                    526 ;	-----------------------------------------
                                    527 ;	 function _mcs51_genXRAMCLEAR
                                    528 ;	-----------------------------------------
      0000EC                        529 __mcs51_genXRAMCLEAR:
      0000EC 22               [24]  530 	ret
                                    531 ;------------------------------------------------------------
                                    532 ;Allocation info for local variables in function 'timer0_ISR'
                                    533 ;------------------------------------------------------------
                                    534 ;	testpreempt.c:112: void timer0_ISR(void) __interrupt(1) {
                                    535 ;	-----------------------------------------
                                    536 ;	 function timer0_ISR
                                    537 ;	-----------------------------------------
      0000ED                        538 _timer0_ISR:
                                    539 ;	testpreempt.c:115: __endasm;
      0000ED 02 01 19         [24]  540 	ljmp	_myTimer0Handler
                                    541 ;	testpreempt.c:116: }
      0000F0 02 00 54         [24]  542 	ljmp	sdcc_atomic_maybe_rollback
                                    543 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    544 ;	eliminated unneeded push/pop not_psw
                                    545 ;	eliminated unneeded push/pop dpl
                                    546 ;	eliminated unneeded push/pop dph
                                    547 ;	eliminated unneeded push/pop b
                                    548 ;	eliminated unneeded push/pop acc
                                    549 	.area CSEG    (CODE)
                                    550 	.area CONST   (CODE)
                                    551 	.area XINIT   (CODE)
                                    552 	.area CABS    (ABS,CODE)
