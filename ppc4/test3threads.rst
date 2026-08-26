                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module test3threads
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
                                     18 	.globl _Producer2
                                     19 	.globl _Producer1
                                     20 	.globl _ThreadCreate
                                     21 	.globl _CY
                                     22 	.globl _AC
                                     23 	.globl _F0
                                     24 	.globl _RS1
                                     25 	.globl _RS0
                                     26 	.globl _OV
                                     27 	.globl _F1
                                     28 	.globl _P
                                     29 	.globl _PS
                                     30 	.globl _PT1
                                     31 	.globl _PX1
                                     32 	.globl _PT0
                                     33 	.globl _PX0
                                     34 	.globl _RD
                                     35 	.globl _WR
                                     36 	.globl _T1
                                     37 	.globl _T0
                                     38 	.globl _INT1
                                     39 	.globl _INT0
                                     40 	.globl _TXD
                                     41 	.globl _RXD
                                     42 	.globl _P3_7
                                     43 	.globl _P3_6
                                     44 	.globl _P3_5
                                     45 	.globl _P3_4
                                     46 	.globl _P3_3
                                     47 	.globl _P3_2
                                     48 	.globl _P3_1
                                     49 	.globl _P3_0
                                     50 	.globl _EA
                                     51 	.globl _ES
                                     52 	.globl _ET1
                                     53 	.globl _EX1
                                     54 	.globl _ET0
                                     55 	.globl _EX0
                                     56 	.globl _P2_7
                                     57 	.globl _P2_6
                                     58 	.globl _P2_5
                                     59 	.globl _P2_4
                                     60 	.globl _P2_3
                                     61 	.globl _P2_2
                                     62 	.globl _P2_1
                                     63 	.globl _P2_0
                                     64 	.globl _SM0
                                     65 	.globl _SM1
                                     66 	.globl _SM2
                                     67 	.globl _REN
                                     68 	.globl _TB8
                                     69 	.globl _RB8
                                     70 	.globl _TI
                                     71 	.globl _RI
                                     72 	.globl _P1_7
                                     73 	.globl _P1_6
                                     74 	.globl _P1_5
                                     75 	.globl _P1_4
                                     76 	.globl _P1_3
                                     77 	.globl _P1_2
                                     78 	.globl _P1_1
                                     79 	.globl _P1_0
                                     80 	.globl _TF1
                                     81 	.globl _TR1
                                     82 	.globl _TF0
                                     83 	.globl _TR0
                                     84 	.globl _IE1
                                     85 	.globl _IT1
                                     86 	.globl _IE0
                                     87 	.globl _IT0
                                     88 	.globl _P0_7
                                     89 	.globl _P0_6
                                     90 	.globl _P0_5
                                     91 	.globl _P0_4
                                     92 	.globl _P0_3
                                     93 	.globl _P0_2
                                     94 	.globl _P0_1
                                     95 	.globl _P0_0
                                     96 	.globl _B
                                     97 	.globl _ACC
                                     98 	.globl _PSW
                                     99 	.globl _IP
                                    100 	.globl _P3
                                    101 	.globl _IE
                                    102 	.globl _P2
                                    103 	.globl _SBUF
                                    104 	.globl _SCON
                                    105 	.globl _P1
                                    106 	.globl _TH1
                                    107 	.globl _TH0
                                    108 	.globl _TL1
                                    109 	.globl _TL0
                                    110 	.globl _TMOD
                                    111 	.globl _TCON
                                    112 	.globl _PCON
                                    113 	.globl _DPH
                                    114 	.globl _DPL
                                    115 	.globl _SP
                                    116 	.globl _P0
                                    117 	.globl _nextNum
                                    118 	.globl _readCursor
                                    119 	.globl _writeCursor
                                    120 	.globl _full
                                    121 	.globl _empty
                                    122 	.globl _mutex
                                    123 	.globl _nextChar
                                    124 	.globl _circBuf
                                    125 ;--------------------------------------------------------
                                    126 ; special function registers
                                    127 ;--------------------------------------------------------
                                    128 	.area RSEG    (ABS,DATA)
      000000                        129 	.org 0x0000
                           000080   130 _P0	=	0x0080
                           000081   131 _SP	=	0x0081
                           000082   132 _DPL	=	0x0082
                           000083   133 _DPH	=	0x0083
                           000087   134 _PCON	=	0x0087
                           000088   135 _TCON	=	0x0088
                           000089   136 _TMOD	=	0x0089
                           00008A   137 _TL0	=	0x008a
                           00008B   138 _TL1	=	0x008b
                           00008C   139 _TH0	=	0x008c
                           00008D   140 _TH1	=	0x008d
                           000090   141 _P1	=	0x0090
                           000098   142 _SCON	=	0x0098
                           000099   143 _SBUF	=	0x0099
                           0000A0   144 _P2	=	0x00a0
                           0000A8   145 _IE	=	0x00a8
                           0000B0   146 _P3	=	0x00b0
                           0000B8   147 _IP	=	0x00b8
                           0000D0   148 _PSW	=	0x00d0
                           0000E0   149 _ACC	=	0x00e0
                           0000F0   150 _B	=	0x00f0
                                    151 ;--------------------------------------------------------
                                    152 ; special function bits
                                    153 ;--------------------------------------------------------
                                    154 	.area RSEG    (ABS,DATA)
      000000                        155 	.org 0x0000
                           000080   156 _P0_0	=	0x0080
                           000081   157 _P0_1	=	0x0081
                           000082   158 _P0_2	=	0x0082
                           000083   159 _P0_3	=	0x0083
                           000084   160 _P0_4	=	0x0084
                           000085   161 _P0_5	=	0x0085
                           000086   162 _P0_6	=	0x0086
                           000087   163 _P0_7	=	0x0087
                           000088   164 _IT0	=	0x0088
                           000089   165 _IE0	=	0x0089
                           00008A   166 _IT1	=	0x008a
                           00008B   167 _IE1	=	0x008b
                           00008C   168 _TR0	=	0x008c
                           00008D   169 _TF0	=	0x008d
                           00008E   170 _TR1	=	0x008e
                           00008F   171 _TF1	=	0x008f
                           000090   172 _P1_0	=	0x0090
                           000091   173 _P1_1	=	0x0091
                           000092   174 _P1_2	=	0x0092
                           000093   175 _P1_3	=	0x0093
                           000094   176 _P1_4	=	0x0094
                           000095   177 _P1_5	=	0x0095
                           000096   178 _P1_6	=	0x0096
                           000097   179 _P1_7	=	0x0097
                           000098   180 _RI	=	0x0098
                           000099   181 _TI	=	0x0099
                           00009A   182 _RB8	=	0x009a
                           00009B   183 _TB8	=	0x009b
                           00009C   184 _REN	=	0x009c
                           00009D   185 _SM2	=	0x009d
                           00009E   186 _SM1	=	0x009e
                           00009F   187 _SM0	=	0x009f
                           0000A0   188 _P2_0	=	0x00a0
                           0000A1   189 _P2_1	=	0x00a1
                           0000A2   190 _P2_2	=	0x00a2
                           0000A3   191 _P2_3	=	0x00a3
                           0000A4   192 _P2_4	=	0x00a4
                           0000A5   193 _P2_5	=	0x00a5
                           0000A6   194 _P2_6	=	0x00a6
                           0000A7   195 _P2_7	=	0x00a7
                           0000A8   196 _EX0	=	0x00a8
                           0000A9   197 _ET0	=	0x00a9
                           0000AA   198 _EX1	=	0x00aa
                           0000AB   199 _ET1	=	0x00ab
                           0000AC   200 _ES	=	0x00ac
                           0000AF   201 _EA	=	0x00af
                           0000B0   202 _P3_0	=	0x00b0
                           0000B1   203 _P3_1	=	0x00b1
                           0000B2   204 _P3_2	=	0x00b2
                           0000B3   205 _P3_3	=	0x00b3
                           0000B4   206 _P3_4	=	0x00b4
                           0000B5   207 _P3_5	=	0x00b5
                           0000B6   208 _P3_6	=	0x00b6
                           0000B7   209 _P3_7	=	0x00b7
                           0000B0   210 _RXD	=	0x00b0
                           0000B1   211 _TXD	=	0x00b1
                           0000B2   212 _INT0	=	0x00b2
                           0000B3   213 _INT1	=	0x00b3
                           0000B4   214 _T0	=	0x00b4
                           0000B5   215 _T1	=	0x00b5
                           0000B6   216 _WR	=	0x00b6
                           0000B7   217 _RD	=	0x00b7
                           0000B8   218 _PX0	=	0x00b8
                           0000B9   219 _PT0	=	0x00b9
                           0000BA   220 _PX1	=	0x00ba
                           0000BB   221 _PT1	=	0x00bb
                           0000BC   222 _PS	=	0x00bc
                           0000D0   223 _P	=	0x00d0
                           0000D1   224 _F1	=	0x00d1
                           0000D2   225 _OV	=	0x00d2
                           0000D3   226 _RS0	=	0x00d3
                           0000D4   227 _RS1	=	0x00d4
                           0000D5   228 _F0	=	0x00d5
                           0000D6   229 _AC	=	0x00d6
                           0000D7   230 _CY	=	0x00d7
                                    231 ;--------------------------------------------------------
                                    232 ; overlayable register banks
                                    233 ;--------------------------------------------------------
                                    234 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        235 	.ds 8
                                    236 ;--------------------------------------------------------
                                    237 ; internal ram data
                                    238 ;--------------------------------------------------------
                                    239 	.area DSEG    (DATA)
                           000030   240 _circBuf	=	0x0030
                           000033   241 _nextChar	=	0x0033
                           000034   242 _mutex	=	0x0034
                           000035   243 _empty	=	0x0035
                           000036   244 _full	=	0x0036
                           000037   245 _writeCursor	=	0x0037
                           000038   246 _readCursor	=	0x0038
                           000039   247 _nextNum	=	0x0039
                                    248 ;--------------------------------------------------------
                                    249 ; overlayable items in internal ram
                                    250 ;--------------------------------------------------------
                                    251 ;--------------------------------------------------------
                                    252 ; Stack segment in internal ram
                                    253 ;--------------------------------------------------------
                                    254 	.area SSEG
      000021                        255 __start__stack:
      000021                        256 	.ds	1
                                    257 
                                    258 ;--------------------------------------------------------
                                    259 ; indirectly addressable internal ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area ISEG    (DATA)
                                    262 ;--------------------------------------------------------
                                    263 ; absolute internal ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area IABS    (ABS,DATA)
                                    266 	.area IABS    (ABS,DATA)
                                    267 ;--------------------------------------------------------
                                    268 ; bit data
                                    269 ;--------------------------------------------------------
                                    270 	.area BSEG    (BIT)
                                    271 ;--------------------------------------------------------
                                    272 ; paged external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area PSEG    (PAG,XDATA)
                                    275 ;--------------------------------------------------------
                                    276 ; uninitialized external ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area XSEG    (XDATA)
                                    279 ;--------------------------------------------------------
                                    280 ; absolute external ram data
                                    281 ;--------------------------------------------------------
                                    282 	.area XABS    (ABS,XDATA)
                                    283 ;--------------------------------------------------------
                                    284 ; initialized external ram data
                                    285 ;--------------------------------------------------------
                                    286 	.area XISEG   (XDATA)
                                    287 	.area HOME    (CODE)
                                    288 	.area GSINIT0 (CODE)
                                    289 	.area GSINIT1 (CODE)
                                    290 	.area GSINIT2 (CODE)
                                    291 	.area GSINIT3 (CODE)
                                    292 	.area GSINIT4 (CODE)
                                    293 	.area GSINIT5 (CODE)
                                    294 	.area GSINIT  (CODE)
                                    295 	.area GSFINAL (CODE)
                                    296 	.area CSEG    (CODE)
                                    297 ;--------------------------------------------------------
                                    298 ; interrupt vector
                                    299 ;--------------------------------------------------------
                                    300 	.area HOME    (CODE)
      000000                        301 __interrupt_vect:
      000000 02 01 82         [24]  302 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  303 	reti
      000004                        304 	.ds	7
      00000B 02 01 89         [24]  305 	ljmp	_timer0_ISR
                                    306 ; restartable atomic support routines
      00000E                        307 	.ds	2
      000010                        308 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  309 	nop
      000011 00               [12]  310 	nop
      000012                        311 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  312 	movx	a, @r0
      000013 FB               [12]  313 	mov	r3, a
      000014 EA               [12]  314 	mov	a, r2
      000015 F2               [24]  315 	movx	@r0, a
      000016 80 2C            [24]  316 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  317 	nop
      000019 00               [12]  318 	nop
      00001A                        319 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  320 	movx	a, @dptr
      00001B FB               [12]  321 	mov	r3, a
      00001C EA               [12]  322 	mov	a, r2
      00001D F0               [24]  323 	movx	@dptr, a
      00001E 80 24            [24]  324 	sjmp	sdcc_atomic_exchange_exit
      000020                        325 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  326 	mov	a, @r0
      000021 B5 02 02         [24]  327 	cjne	a, ar2, .+#5
      000024 EB               [12]  328 	mov	a, r3
      000025 F6               [12]  329 	mov	@r0, a
      000026 22               [24]  330 	ret
      000027 00               [12]  331 	nop
      000028                        332 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  333 	movx	a, @r0
      000029 B5 02 02         [24]  334 	cjne	a, ar2, .+#5
      00002C EB               [12]  335 	mov	a, r3
      00002D F2               [24]  336 	movx	@r0, a
      00002E 22               [24]  337 	ret
      00002F 00               [12]  338 	nop
      000030                        339 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  340 	movx	a, @dptr
      000031 B5 02 02         [24]  341 	cjne	a, ar2, .+#5
      000034 EB               [12]  342 	mov	a, r3
      000035 F0               [24]  343 	movx	@dptr, a
      000036 22               [24]  344 	ret
      000037                        345 sdcc_atomic_exchange_rollback_end::
                                    346 
      000037                        347 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  348 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  349 	mov	r0, dpl
      00003C 20 F5 D3         [24]  350 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        351 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  352 	mov	a, r2
      000040 C6               [12]  353 	xch	a, @r0
      000041 F5 82            [12]  354 	mov	dpl, a
      000043 22               [24]  355 	ret
      000044                        356 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  357 	mov	dpl, r3
      000046 22               [24]  358 	ret
      000047                        359 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  360 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  361 	mov	r0, dpl
      00004C 20 F5 D9         [24]  362 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  363 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    364 ;--------------------------------------------------------
                                    365 ; global & static initialisations
                                    366 ;--------------------------------------------------------
                                    367 	.area HOME    (CODE)
                                    368 	.area GSINIT  (CODE)
                                    369 	.area GSFINAL (CODE)
                                    370 	.area GSINIT  (CODE)
                                    371 	.globl __sdcc_gsinit_startup
                                    372 	.globl __sdcc_program_startup
                                    373 	.globl __start__stack
                                    374 	.globl __mcs51_genXINIT
                                    375 	.globl __mcs51_genXRAMCLEAR
                                    376 	.globl __mcs51_genRAMCLEAR
                                    377 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  378 	ljmp	__sdcc_program_startup
                                    379 ;--------------------------------------------------------
                                    380 ; Home
                                    381 ;--------------------------------------------------------
                                    382 	.area HOME    (CODE)
                                    383 	.area HOME    (CODE)
      000051                        384 __sdcc_program_startup:
      000051 02 01 67         [24]  385 	ljmp	_main
                                    386 ;	return from main will return to caller
                                    387 ;--------------------------------------------------------
                                    388 ; code
                                    389 ;--------------------------------------------------------
                                    390 	.area CSEG    (CODE)
                                    391 ;------------------------------------------------------------
                                    392 ;Allocation info for local variables in function 'Producer1'
                                    393 ;------------------------------------------------------------
                                    394 ;	test3threads.c:16: void Producer1(void)
                                    395 ;	-----------------------------------------
                                    396 ;	 function Producer1
                                    397 ;	-----------------------------------------
      000081                        398 _Producer1:
                           000007   399 	ar7 = 0x07
                           000006   400 	ar6 = 0x06
                           000005   401 	ar5 = 0x05
                           000004   402 	ar4 = 0x04
                           000003   403 	ar3 = 0x03
                           000002   404 	ar2 = 0x02
                           000001   405 	ar1 = 0x01
                           000000   406 	ar0 = 0x00
                                    407 ;	test3threads.c:18: nextChar = 'A';
      000081 75 33 41         [24]  408 	mov	_nextChar,#0x41
                                    409 ;	test3threads.c:19: while (1){
      000084                        410 00102$:
                                    411 ;	test3threads.c:20: SemaphoreWaitBody(empty,  L(__COUNTER__));
      000084                        412 0$:
      000084 E5 35            [12]  413 	MOV A, _empty 
      000086 60 FC            [24]  414 	JZ 0$ 
      000088 20 E7 F9         [24]  415 	JB ACC.7, 0$ 
      00008B 15 35            [12]  416 	dec _empty 
                                    417 ;	test3threads.c:21: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      00008D                        418 1$:
      00008D E5 34            [12]  419 	MOV A, _mutex 
      00008F 60 FC            [24]  420 	JZ 1$ 
      000091 20 E7 F9         [24]  421 	JB ACC.7, 1$ 
      000094 15 34            [12]  422 	dec _mutex 
                                    423 ;	test3threads.c:22: circBuf[writeCursor] = nextChar;
      000096 E5 37            [12]  424 	mov	a,_writeCursor
      000098 24 30            [12]  425 	add	a, #_circBuf
      00009A F8               [12]  426 	mov	r0,a
      00009B A6 33            [24]  427 	mov	@r0,_nextChar
                                    428 ;	test3threads.c:23: writeCursor = (writeCursor == 2) ? 0 : writeCursor + 1;
      00009D 74 02            [12]  429 	mov	a,#0x02
      00009F B5 37 06         [24]  430 	cjne	a,_writeCursor,00106$
      0000A2 7E 00            [12]  431 	mov	r6,#0x00
      0000A4 7F 00            [12]  432 	mov	r7,#0x00
      0000A6 80 09            [24]  433 	sjmp	00107$
      0000A8                        434 00106$:
      0000A8 AD 37            [24]  435 	mov	r5,_writeCursor
      0000AA 0D               [12]  436 	inc	r5
      0000AB ED               [12]  437 	mov	a,r5
      0000AC FE               [12]  438 	mov	r6,a
      0000AD 33               [12]  439 	rlc	a
      0000AE 95 E0            [12]  440 	subb	a,acc
      0000B0 FF               [12]  441 	mov	r7,a
      0000B1                        442 00107$:
      0000B1 8E 37            [24]  443 	mov	_writeCursor,r6
                                    444 ;	test3threads.c:24: SemaphoreSignal(mutex);
      0000B3 05 34            [12]  445 	INC _mutex 
                                    446 ;	test3threads.c:25: SemaphoreSignal(full);
      0000B5 05 36            [12]  447 	INC _full 
                                    448 ;	test3threads.c:26: nextChar = (nextChar == 'Z') ? 'A' : nextChar + 1;
      0000B7 74 5A            [12]  449 	mov	a,#0x5a
      0000B9 B5 33 06         [24]  450 	cjne	a,_nextChar,00108$
      0000BC 7E 41            [12]  451 	mov	r6,#0x41
      0000BE 7F 00            [12]  452 	mov	r7,#0x00
      0000C0 80 09            [24]  453 	sjmp	00109$
      0000C2                        454 00108$:
      0000C2 AD 33            [24]  455 	mov	r5,_nextChar
      0000C4 0D               [12]  456 	inc	r5
      0000C5 ED               [12]  457 	mov	a,r5
      0000C6 FE               [12]  458 	mov	r6,a
      0000C7 33               [12]  459 	rlc	a
      0000C8 95 E0            [12]  460 	subb	a,acc
      0000CA FF               [12]  461 	mov	r7,a
      0000CB                        462 00109$:
      0000CB 8E 33            [24]  463 	mov	_nextChar,r6
                                    464 ;	test3threads.c:28: }
      0000CD 80 B5            [24]  465 	sjmp	00102$
                                    466 ;------------------------------------------------------------
                                    467 ;Allocation info for local variables in function 'Producer2'
                                    468 ;------------------------------------------------------------
                                    469 ;	test3threads.c:30: void Producer2(void)
                                    470 ;	-----------------------------------------
                                    471 ;	 function Producer2
                                    472 ;	-----------------------------------------
      0000CF                        473 _Producer2:
                                    474 ;	test3threads.c:32: nextNum = '0';
      0000CF 75 39 30         [24]  475 	mov	_nextNum,#0x30
                                    476 ;	test3threads.c:33: while (1){
      0000D2                        477 00102$:
                                    478 ;	test3threads.c:34: SemaphoreWaitBody(empty,  L(__COUNTER__));
      0000D2                        479 2$:
      0000D2 E5 35            [12]  480 	MOV A, _empty 
      0000D4 60 FC            [24]  481 	JZ 2$ 
      0000D6 20 E7 F9         [24]  482 	JB ACC.7, 2$ 
      0000D9 15 35            [12]  483 	dec _empty 
                                    484 ;	test3threads.c:35: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      0000DB                        485 3$:
      0000DB E5 34            [12]  486 	MOV A, _mutex 
      0000DD 60 FC            [24]  487 	JZ 3$ 
      0000DF 20 E7 F9         [24]  488 	JB ACC.7, 3$ 
      0000E2 15 34            [12]  489 	dec _mutex 
                                    490 ;	test3threads.c:36: circBuf[writeCursor] = nextNum;
      0000E4 E5 37            [12]  491 	mov	a,_writeCursor
      0000E6 24 30            [12]  492 	add	a, #_circBuf
      0000E8 F8               [12]  493 	mov	r0,a
      0000E9 A6 39            [24]  494 	mov	@r0,_nextNum
                                    495 ;	test3threads.c:37: writeCursor = (writeCursor == 2) ? 0 : writeCursor + 1;
      0000EB 74 02            [12]  496 	mov	a,#0x02
      0000ED B5 37 06         [24]  497 	cjne	a,_writeCursor,00106$
      0000F0 7E 00            [12]  498 	mov	r6,#0x00
      0000F2 7F 00            [12]  499 	mov	r7,#0x00
      0000F4 80 09            [24]  500 	sjmp	00107$
      0000F6                        501 00106$:
      0000F6 AD 37            [24]  502 	mov	r5,_writeCursor
      0000F8 0D               [12]  503 	inc	r5
      0000F9 ED               [12]  504 	mov	a,r5
      0000FA FE               [12]  505 	mov	r6,a
      0000FB 33               [12]  506 	rlc	a
      0000FC 95 E0            [12]  507 	subb	a,acc
      0000FE FF               [12]  508 	mov	r7,a
      0000FF                        509 00107$:
      0000FF 8E 37            [24]  510 	mov	_writeCursor,r6
                                    511 ;	test3threads.c:38: SemaphoreSignal(mutex);
      000101 05 34            [12]  512 	INC _mutex 
                                    513 ;	test3threads.c:39: SemaphoreSignal(full);
      000103 05 36            [12]  514 	INC _full 
                                    515 ;	test3threads.c:40: nextNum = (nextNum == '9') ? '0' : nextNum + 1;
      000105 74 39            [12]  516 	mov	a,#0x39
      000107 B5 39 06         [24]  517 	cjne	a,_nextNum,00108$
      00010A 7E 30            [12]  518 	mov	r6,#0x30
      00010C 7F 00            [12]  519 	mov	r7,#0x00
      00010E 80 09            [24]  520 	sjmp	00109$
      000110                        521 00108$:
      000110 AD 39            [24]  522 	mov	r5,_nextNum
      000112 0D               [12]  523 	inc	r5
      000113 ED               [12]  524 	mov	a,r5
      000114 FE               [12]  525 	mov	r6,a
      000115 33               [12]  526 	rlc	a
      000116 95 E0            [12]  527 	subb	a,acc
      000118 FF               [12]  528 	mov	r7,a
      000119                        529 00109$:
      000119 8E 39            [24]  530 	mov	_nextNum,r6
                                    531 ;	test3threads.c:42: }
      00011B 80 B5            [24]  532 	sjmp	00102$
                                    533 ;------------------------------------------------------------
                                    534 ;Allocation info for local variables in function 'Consumer'
                                    535 ;------------------------------------------------------------
                                    536 ;	test3threads.c:44: void Consumer(void)
                                    537 ;	-----------------------------------------
                                    538 ;	 function Consumer
                                    539 ;	-----------------------------------------
      00011D                        540 _Consumer:
                                    541 ;	test3threads.c:46: EA = 0;
                                    542 ;	assignBit
      00011D C2 AF            [12]  543 	clr	_EA
                                    544 ;	test3threads.c:47: TMOD |= 0x20;
      00011F 43 89 20         [24]  545 	orl	_TMOD,#0x20
                                    546 ;	test3threads.c:48: TH1 = -6;
      000122 75 8D FA         [24]  547 	mov	_TH1,#0xfa
                                    548 ;	test3threads.c:49: SCON = 0x50;
      000125 75 98 50         [24]  549 	mov	_SCON,#0x50
                                    550 ;	test3threads.c:50: TR1 = 1;
                                    551 ;	assignBit
      000128 D2 8E            [12]  552 	setb	_TR1
                                    553 ;	test3threads.c:51: EA = 1;
                                    554 ;	assignBit
      00012A D2 AF            [12]  555 	setb	_EA
                                    556 ;	test3threads.c:52: readCursor = 0;
      00012C 75 38 00         [24]  557 	mov	_readCursor,#0x00
                                    558 ;	test3threads.c:53: while (1){
      00012F                        559 00105$:
                                    560 ;	test3threads.c:54: SemaphoreWaitBody(full,  L(__COUNTER__));
      00012F                        561 4$:
      00012F E5 36            [12]  562 	MOV A, _full 
      000131 60 FC            [24]  563 	JZ 4$ 
      000133 20 E7 F9         [24]  564 	JB ACC.7, 4$ 
      000136 15 36            [12]  565 	dec _full 
                                    566 ;	test3threads.c:55: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      000138                        567 5$:
      000138 E5 34            [12]  568 	MOV A, _mutex 
      00013A 60 FC            [24]  569 	JZ 5$ 
      00013C 20 E7 F9         [24]  570 	JB ACC.7, 5$ 
      00013F 15 34            [12]  571 	dec _mutex 
                                    572 ;	test3threads.c:56: SBUF = circBuf[readCursor];
      000141 E5 38            [12]  573 	mov	a,_readCursor
      000143 24 30            [12]  574 	add	a, #_circBuf
      000145 F9               [12]  575 	mov	r1,a
      000146 87 99            [24]  576 	mov	_SBUF,@r1
                                    577 ;	test3threads.c:57: SemaphoreSignal(mutex);
      000148 05 34            [12]  578 	INC _mutex 
                                    579 ;	test3threads.c:58: readCursor = (readCursor == 2) ? 0 : readCursor + 1;
      00014A 74 02            [12]  580 	mov	a,#0x02
      00014C B5 38 06         [24]  581 	cjne	a,_readCursor,00109$
      00014F 7E 00            [12]  582 	mov	r6,#0x00
      000151 7F 00            [12]  583 	mov	r7,#0x00
      000153 80 09            [24]  584 	sjmp	00110$
      000155                        585 00109$:
      000155 AD 38            [24]  586 	mov	r5,_readCursor
      000157 0D               [12]  587 	inc	r5
      000158 ED               [12]  588 	mov	a,r5
      000159 FE               [12]  589 	mov	r6,a
      00015A 33               [12]  590 	rlc	a
      00015B 95 E0            [12]  591 	subb	a,acc
      00015D FF               [12]  592 	mov	r7,a
      00015E                        593 00110$:
      00015E 8E 38            [24]  594 	mov	_readCursor,r6
                                    595 ;	test3threads.c:59: SemaphoreSignal(empty);
      000160 05 35            [12]  596 	INC _empty 
                                    597 ;	test3threads.c:60: while (!TI);
      000162                        598 00101$:
                                    599 ;	test3threads.c:61: TI = 0;
                                    600 ;	assignBit
      000162 10 99 CA         [24]  601 	jbc	_TI,00105$
                                    602 ;	test3threads.c:63: }
      000165 80 FB            [24]  603 	sjmp	00101$
                                    604 ;------------------------------------------------------------
                                    605 ;Allocation info for local variables in function 'main'
                                    606 ;------------------------------------------------------------
                                    607 ;	test3threads.c:65: void main(void)
                                    608 ;	-----------------------------------------
                                    609 ;	 function main
                                    610 ;	-----------------------------------------
      000167                        611 _main:
                                    612 ;	test3threads.c:67: writeCursor = 0;
      000167 75 37 00         [24]  613 	mov	_writeCursor,#0x00
                                    614 ;	test3threads.c:68: SemaphoreCreate(full, 0);
      00016A 75 36 00         [24]  615 	mov	_full,#0x00
                                    616 ;	test3threads.c:69: SemaphoreCreate(mutex, 1);
      00016D 75 34 01         [24]  617 	mov	_mutex,#0x01
                                    618 ;	test3threads.c:70: SemaphoreCreate(empty, 3);
      000170 75 35 03         [24]  619 	mov	_empty,#0x03
                                    620 ;	test3threads.c:71: ThreadCreate(Consumer); // for unfairness test
      000173 90 01 1D         [24]  621 	mov	dptr,#_Consumer
      000176 12 02 34         [24]  622 	lcall	_ThreadCreate
                                    623 ;	test3threads.c:72: ThreadCreate(Producer2);  //
      000179 90 00 CF         [24]  624 	mov	dptr,#_Producer2
      00017C 12 02 34         [24]  625 	lcall	_ThreadCreate
                                    626 ;	test3threads.c:73: Producer1(); //
                                    627 ;	test3threads.c:74: }
      00017F 02 00 81         [24]  628 	ljmp	_Producer1
                                    629 ;------------------------------------------------------------
                                    630 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    631 ;------------------------------------------------------------
                                    632 ;	test3threads.c:76: void _sdcc_gsinit_startup(void)
                                    633 ;	-----------------------------------------
                                    634 ;	 function _sdcc_gsinit_startup
                                    635 ;	-----------------------------------------
      000182                        636 __sdcc_gsinit_startup:
                                    637 ;	test3threads.c:80: __endasm;
      000182 02 01 8F         [24]  638 	LJMP	_Bootstrap
                                    639 ;	test3threads.c:81: }
      000185 22               [24]  640 	ret
                                    641 ;------------------------------------------------------------
                                    642 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    643 ;------------------------------------------------------------
                                    644 ;	test3threads.c:83: void _mcs51_genRAMCLEAR(void) {}
                                    645 ;	-----------------------------------------
                                    646 ;	 function _mcs51_genRAMCLEAR
                                    647 ;	-----------------------------------------
      000186                        648 __mcs51_genRAMCLEAR:
      000186 22               [24]  649 	ret
                                    650 ;------------------------------------------------------------
                                    651 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    652 ;------------------------------------------------------------
                                    653 ;	test3threads.c:84: void _mcs51_genXINIT(void) {}
                                    654 ;	-----------------------------------------
                                    655 ;	 function _mcs51_genXINIT
                                    656 ;	-----------------------------------------
      000187                        657 __mcs51_genXINIT:
      000187 22               [24]  658 	ret
                                    659 ;------------------------------------------------------------
                                    660 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    661 ;------------------------------------------------------------
                                    662 ;	test3threads.c:85: void _mcs51_genXRAMCLEAR(void) {}
                                    663 ;	-----------------------------------------
                                    664 ;	 function _mcs51_genXRAMCLEAR
                                    665 ;	-----------------------------------------
      000188                        666 __mcs51_genXRAMCLEAR:
      000188 22               [24]  667 	ret
                                    668 ;------------------------------------------------------------
                                    669 ;Allocation info for local variables in function 'timer0_ISR'
                                    670 ;------------------------------------------------------------
                                    671 ;	test3threads.c:86: void timer0_ISR(void) __interrupt(1) {
                                    672 ;	-----------------------------------------
                                    673 ;	 function timer0_ISR
                                    674 ;	-----------------------------------------
      000189                        675 _timer0_ISR:
                                    676 ;	test3threads.c:89: __endasm;
      000189 02 01 B8         [24]  677 	ljmp	_myTimer0Handler
                                    678 ;	test3threads.c:90: }
      00018C 02 00 54         [24]  679 	ljmp	sdcc_atomic_maybe_rollback
                                    680 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    681 ;	eliminated unneeded push/pop not_psw
                                    682 ;	eliminated unneeded push/pop dpl
                                    683 ;	eliminated unneeded push/pop dph
                                    684 ;	eliminated unneeded push/pop b
                                    685 ;	eliminated unneeded push/pop acc
                                    686 	.area CSEG    (CODE)
                                    687 	.area CONST   (CODE)
                                    688 	.area XINIT   (CODE)
                                    689 	.area CABS    (ABS,CODE)
