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
                                    116 	.globl _readCursor
                                    117 	.globl _writeCursor
                                    118 	.globl _full
                                    119 	.globl _empty
                                    120 	.globl _mutex
                                    121 	.globl _nextChar
                                    122 	.globl _circBuf
                                    123 ;--------------------------------------------------------
                                    124 ; special function registers
                                    125 ;--------------------------------------------------------
                                    126 	.area RSEG    (ABS,DATA)
      000000                        127 	.org 0x0000
                           000080   128 _P0	=	0x0080
                           000081   129 _SP	=	0x0081
                           000082   130 _DPL	=	0x0082
                           000083   131 _DPH	=	0x0083
                           000087   132 _PCON	=	0x0087
                           000088   133 _TCON	=	0x0088
                           000089   134 _TMOD	=	0x0089
                           00008A   135 _TL0	=	0x008a
                           00008B   136 _TL1	=	0x008b
                           00008C   137 _TH0	=	0x008c
                           00008D   138 _TH1	=	0x008d
                           000090   139 _P1	=	0x0090
                           000098   140 _SCON	=	0x0098
                           000099   141 _SBUF	=	0x0099
                           0000A0   142 _P2	=	0x00a0
                           0000A8   143 _IE	=	0x00a8
                           0000B0   144 _P3	=	0x00b0
                           0000B8   145 _IP	=	0x00b8
                           0000D0   146 _PSW	=	0x00d0
                           0000E0   147 _ACC	=	0x00e0
                           0000F0   148 _B	=	0x00f0
                                    149 ;--------------------------------------------------------
                                    150 ; special function bits
                                    151 ;--------------------------------------------------------
                                    152 	.area RSEG    (ABS,DATA)
      000000                        153 	.org 0x0000
                           000080   154 _P0_0	=	0x0080
                           000081   155 _P0_1	=	0x0081
                           000082   156 _P0_2	=	0x0082
                           000083   157 _P0_3	=	0x0083
                           000084   158 _P0_4	=	0x0084
                           000085   159 _P0_5	=	0x0085
                           000086   160 _P0_6	=	0x0086
                           000087   161 _P0_7	=	0x0087
                           000088   162 _IT0	=	0x0088
                           000089   163 _IE0	=	0x0089
                           00008A   164 _IT1	=	0x008a
                           00008B   165 _IE1	=	0x008b
                           00008C   166 _TR0	=	0x008c
                           00008D   167 _TF0	=	0x008d
                           00008E   168 _TR1	=	0x008e
                           00008F   169 _TF1	=	0x008f
                           000090   170 _P1_0	=	0x0090
                           000091   171 _P1_1	=	0x0091
                           000092   172 _P1_2	=	0x0092
                           000093   173 _P1_3	=	0x0093
                           000094   174 _P1_4	=	0x0094
                           000095   175 _P1_5	=	0x0095
                           000096   176 _P1_6	=	0x0096
                           000097   177 _P1_7	=	0x0097
                           000098   178 _RI	=	0x0098
                           000099   179 _TI	=	0x0099
                           00009A   180 _RB8	=	0x009a
                           00009B   181 _TB8	=	0x009b
                           00009C   182 _REN	=	0x009c
                           00009D   183 _SM2	=	0x009d
                           00009E   184 _SM1	=	0x009e
                           00009F   185 _SM0	=	0x009f
                           0000A0   186 _P2_0	=	0x00a0
                           0000A1   187 _P2_1	=	0x00a1
                           0000A2   188 _P2_2	=	0x00a2
                           0000A3   189 _P2_3	=	0x00a3
                           0000A4   190 _P2_4	=	0x00a4
                           0000A5   191 _P2_5	=	0x00a5
                           0000A6   192 _P2_6	=	0x00a6
                           0000A7   193 _P2_7	=	0x00a7
                           0000A8   194 _EX0	=	0x00a8
                           0000A9   195 _ET0	=	0x00a9
                           0000AA   196 _EX1	=	0x00aa
                           0000AB   197 _ET1	=	0x00ab
                           0000AC   198 _ES	=	0x00ac
                           0000AF   199 _EA	=	0x00af
                           0000B0   200 _P3_0	=	0x00b0
                           0000B1   201 _P3_1	=	0x00b1
                           0000B2   202 _P3_2	=	0x00b2
                           0000B3   203 _P3_3	=	0x00b3
                           0000B4   204 _P3_4	=	0x00b4
                           0000B5   205 _P3_5	=	0x00b5
                           0000B6   206 _P3_6	=	0x00b6
                           0000B7   207 _P3_7	=	0x00b7
                           0000B0   208 _RXD	=	0x00b0
                           0000B1   209 _TXD	=	0x00b1
                           0000B2   210 _INT0	=	0x00b2
                           0000B3   211 _INT1	=	0x00b3
                           0000B4   212 _T0	=	0x00b4
                           0000B5   213 _T1	=	0x00b5
                           0000B6   214 _WR	=	0x00b6
                           0000B7   215 _RD	=	0x00b7
                           0000B8   216 _PX0	=	0x00b8
                           0000B9   217 _PT0	=	0x00b9
                           0000BA   218 _PX1	=	0x00ba
                           0000BB   219 _PT1	=	0x00bb
                           0000BC   220 _PS	=	0x00bc
                           0000D0   221 _P	=	0x00d0
                           0000D1   222 _F1	=	0x00d1
                           0000D2   223 _OV	=	0x00d2
                           0000D3   224 _RS0	=	0x00d3
                           0000D4   225 _RS1	=	0x00d4
                           0000D5   226 _F0	=	0x00d5
                           0000D6   227 _AC	=	0x00d6
                           0000D7   228 _CY	=	0x00d7
                                    229 ;--------------------------------------------------------
                                    230 ; overlayable register banks
                                    231 ;--------------------------------------------------------
                                    232 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        233 	.ds 8
                                    234 ;--------------------------------------------------------
                                    235 ; internal ram data
                                    236 ;--------------------------------------------------------
                                    237 	.area DSEG    (DATA)
                           000030   238 _circBuf	=	0x0030
                           000033   239 _nextChar	=	0x0033
                           000034   240 _mutex	=	0x0034
                           000035   241 _empty	=	0x0035
                           000036   242 _full	=	0x0036
                           000037   243 _writeCursor	=	0x0037
                           000038   244 _readCursor	=	0x0038
                                    245 ;--------------------------------------------------------
                                    246 ; overlayable items in internal ram
                                    247 ;--------------------------------------------------------
                                    248 ;--------------------------------------------------------
                                    249 ; Stack segment in internal ram
                                    250 ;--------------------------------------------------------
                                    251 	.area SSEG
      000021                        252 __start__stack:
      000021                        253 	.ds	1
                                    254 
                                    255 ;--------------------------------------------------------
                                    256 ; indirectly addressable internal ram data
                                    257 ;--------------------------------------------------------
                                    258 	.area ISEG    (DATA)
                                    259 ;--------------------------------------------------------
                                    260 ; absolute internal ram data
                                    261 ;--------------------------------------------------------
                                    262 	.area IABS    (ABS,DATA)
                                    263 	.area IABS    (ABS,DATA)
                                    264 ;--------------------------------------------------------
                                    265 ; bit data
                                    266 ;--------------------------------------------------------
                                    267 	.area BSEG    (BIT)
      000000                        268 _Consumer_sloc0_1_0:
      000000                        269 	.ds 1
                                    270 ;--------------------------------------------------------
                                    271 ; paged external ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area PSEG    (PAG,XDATA)
                                    274 ;--------------------------------------------------------
                                    275 ; uninitialized external ram data
                                    276 ;--------------------------------------------------------
                                    277 	.area XSEG    (XDATA)
                                    278 ;--------------------------------------------------------
                                    279 ; absolute external ram data
                                    280 ;--------------------------------------------------------
                                    281 	.area XABS    (ABS,XDATA)
                                    282 ;--------------------------------------------------------
                                    283 ; initialized external ram data
                                    284 ;--------------------------------------------------------
                                    285 	.area XISEG   (XDATA)
                                    286 	.area HOME    (CODE)
                                    287 	.area GSINIT0 (CODE)
                                    288 	.area GSINIT1 (CODE)
                                    289 	.area GSINIT2 (CODE)
                                    290 	.area GSINIT3 (CODE)
                                    291 	.area GSINIT4 (CODE)
                                    292 	.area GSINIT5 (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 	.area GSFINAL (CODE)
                                    295 	.area CSEG    (CODE)
                                    296 ;--------------------------------------------------------
                                    297 ; interrupt vector
                                    298 ;--------------------------------------------------------
                                    299 	.area HOME    (CODE)
      000000                        300 __interrupt_vect:
      000000 02 01 35         [24]  301 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  302 	reti
      000004                        303 	.ds	7
      00000B 02 01 3C         [24]  304 	ljmp	_timer0_ISR
                                    305 ; restartable atomic support routines
      00000E                        306 	.ds	2
      000010                        307 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  308 	nop
      000011 00               [12]  309 	nop
      000012                        310 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  311 	movx	a, @r0
      000013 FB               [12]  312 	mov	r3, a
      000014 EA               [12]  313 	mov	a, r2
      000015 F2               [24]  314 	movx	@r0, a
      000016 80 2C            [24]  315 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  316 	nop
      000019 00               [12]  317 	nop
      00001A                        318 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  319 	movx	a, @dptr
      00001B FB               [12]  320 	mov	r3, a
      00001C EA               [12]  321 	mov	a, r2
      00001D F0               [24]  322 	movx	@dptr, a
      00001E 80 24            [24]  323 	sjmp	sdcc_atomic_exchange_exit
      000020                        324 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  325 	mov	a, @r0
      000021 B5 02 02         [24]  326 	cjne	a, ar2, .+#5
      000024 EB               [12]  327 	mov	a, r3
      000025 F6               [12]  328 	mov	@r0, a
      000026 22               [24]  329 	ret
      000027 00               [12]  330 	nop
      000028                        331 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  332 	movx	a, @r0
      000029 B5 02 02         [24]  333 	cjne	a, ar2, .+#5
      00002C EB               [12]  334 	mov	a, r3
      00002D F2               [24]  335 	movx	@r0, a
      00002E 22               [24]  336 	ret
      00002F 00               [12]  337 	nop
      000030                        338 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  339 	movx	a, @dptr
      000031 B5 02 02         [24]  340 	cjne	a, ar2, .+#5
      000034 EB               [12]  341 	mov	a, r3
      000035 F0               [24]  342 	movx	@dptr, a
      000036 22               [24]  343 	ret
      000037                        344 sdcc_atomic_exchange_rollback_end::
                                    345 
      000037                        346 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  347 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  348 	mov	r0, dpl
      00003C 20 F5 D3         [24]  349 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        350 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  351 	mov	a, r2
      000040 C6               [12]  352 	xch	a, @r0
      000041 F5 82            [12]  353 	mov	dpl, a
      000043 22               [24]  354 	ret
      000044                        355 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  356 	mov	dpl, r3
      000046 22               [24]  357 	ret
      000047                        358 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  359 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  360 	mov	r0, dpl
      00004C 20 F5 D9         [24]  361 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  362 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    363 ;--------------------------------------------------------
                                    364 ; global & static initialisations
                                    365 ;--------------------------------------------------------
                                    366 	.area HOME    (CODE)
                                    367 	.area GSINIT  (CODE)
                                    368 	.area GSFINAL (CODE)
                                    369 	.area GSINIT  (CODE)
                                    370 	.globl __sdcc_gsinit_startup
                                    371 	.globl __sdcc_program_startup
                                    372 	.globl __start__stack
                                    373 	.globl __mcs51_genXINIT
                                    374 	.globl __mcs51_genXRAMCLEAR
                                    375 	.globl __mcs51_genRAMCLEAR
                                    376 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  377 	ljmp	__sdcc_program_startup
                                    378 ;--------------------------------------------------------
                                    379 ; Home
                                    380 ;--------------------------------------------------------
                                    381 	.area HOME    (CODE)
                                    382 	.area HOME    (CODE)
      000051                        383 __sdcc_program_startup:
      000051 02 01 23         [24]  384 	ljmp	_main
                                    385 ;	return from main will return to caller
                                    386 ;--------------------------------------------------------
                                    387 ; code
                                    388 ;--------------------------------------------------------
                                    389 	.area CSEG    (CODE)
                                    390 ;------------------------------------------------------------
                                    391 ;Allocation info for local variables in function 'Producer'
                                    392 ;------------------------------------------------------------
                                    393 ;	testpreempt.c:36: void Producer(void)
                                    394 ;	-----------------------------------------
                                    395 ;	 function Producer
                                    396 ;	-----------------------------------------
      000081                        397 _Producer:
                           000007   398 	ar7 = 0x07
                           000006   399 	ar6 = 0x06
                           000005   400 	ar5 = 0x05
                           000004   401 	ar4 = 0x04
                           000003   402 	ar3 = 0x03
                           000002   403 	ar2 = 0x02
                           000001   404 	ar1 = 0x01
                           000000   405 	ar0 = 0x00
                                    406 ;	testpreempt.c:38: nextChar    = 'A';
      000081 75 33 41         [24]  407 	mov	_nextChar,#0x41
                                    408 ;	testpreempt.c:39: writeCursor = 0;
      000084 75 37 00         [24]  409 	mov	_writeCursor,#0x00
                                    410 ;	testpreempt.c:41: while (1) {
      000087                        411 00102$:
                                    412 ;	testpreempt.c:43: SemaphoreWait(empty);
      000087                        413 0$:
      000087 E5 35            [12]  414 	MOV A, _empty 
      000089 60 FC            [24]  415 	JZ 0$ 
      00008B 20 E7 F9         [24]  416 	JB ACC.7, 0$ 
      00008E 15 35            [12]  417 	DEC _empty 
                                    418 ;	testpreempt.c:44: SemaphoreWait(mutex);
      000090                        419 1$:
      000090 E5 34            [12]  420 	MOV A, _mutex 
      000092 60 FC            [24]  421 	JZ 1$ 
      000094 20 E7 F9         [24]  422 	JB ACC.7, 1$ 
      000097 15 34            [12]  423 	DEC _mutex 
                                    424 ;	testpreempt.c:47: circBuf[writeCursor] = nextChar;
      000099 E5 37            [12]  425 	mov	a,_writeCursor
      00009B 24 30            [12]  426 	add	a, #_circBuf
      00009D F8               [12]  427 	mov	r0,a
      00009E A6 33            [24]  428 	mov	@r0,_nextChar
                                    429 ;	testpreempt.c:48: writeCursor = (writeCursor == 2) ? 0 : writeCursor + 1;
      0000A0 74 02            [12]  430 	mov	a,#0x02
      0000A2 B5 37 06         [24]  431 	cjne	a,_writeCursor,00106$
      0000A5 7E 00            [12]  432 	mov	r6,#0x00
      0000A7 7F 00            [12]  433 	mov	r7,#0x00
      0000A9 80 09            [24]  434 	sjmp	00107$
      0000AB                        435 00106$:
      0000AB AD 37            [24]  436 	mov	r5,_writeCursor
      0000AD 0D               [12]  437 	inc	r5
      0000AE ED               [12]  438 	mov	a,r5
      0000AF FE               [12]  439 	mov	r6,a
      0000B0 33               [12]  440 	rlc	a
      0000B1 95 E0            [12]  441 	subb	a,acc
      0000B3 FF               [12]  442 	mov	r7,a
      0000B4                        443 00107$:
      0000B4 8E 37            [24]  444 	mov	_writeCursor,r6
                                    445 ;	testpreempt.c:51: SemaphoreSignal(mutex);
      0000B6 05 34            [12]  446 	INC _mutex 
                                    447 ;	testpreempt.c:52: SemaphoreSignal(full);
      0000B8 05 36            [12]  448 	INC _full 
                                    449 ;	testpreempt.c:55: nextChar = (nextChar == 'Z') ? 'A' : nextChar + 1;
      0000BA 74 5A            [12]  450 	mov	a,#0x5a
      0000BC B5 33 06         [24]  451 	cjne	a,_nextChar,00108$
      0000BF 7E 41            [12]  452 	mov	r6,#0x41
      0000C1 7F 00            [12]  453 	mov	r7,#0x00
      0000C3 80 09            [24]  454 	sjmp	00109$
      0000C5                        455 00108$:
      0000C5 AD 33            [24]  456 	mov	r5,_nextChar
      0000C7 0D               [12]  457 	inc	r5
      0000C8 ED               [12]  458 	mov	a,r5
      0000C9 FE               [12]  459 	mov	r6,a
      0000CA 33               [12]  460 	rlc	a
      0000CB 95 E0            [12]  461 	subb	a,acc
      0000CD FF               [12]  462 	mov	r7,a
      0000CE                        463 00109$:
      0000CE 8E 33            [24]  464 	mov	_nextChar,r6
                                    465 ;	testpreempt.c:57: }
      0000D0 80 B5            [24]  466 	sjmp	00102$
                                    467 ;------------------------------------------------------------
                                    468 ;Allocation info for local variables in function 'Consumer'
                                    469 ;------------------------------------------------------------
                                    470 ;	testpreempt.c:60: void Consumer(void)
                                    471 ;	-----------------------------------------
                                    472 ;	 function Consumer
                                    473 ;	-----------------------------------------
      0000D2                        474 _Consumer:
                                    475 ;	testpreempt.c:73: }
      0000D2 D2 00            [12]  476 	setb	_Consumer_sloc0_1_0
      0000D4 10 AF 02         [24]  477 	jbc	ea,00135$
      0000D7 C2 00            [12]  478 	clr	_Consumer_sloc0_1_0
      0000D9                        479 00135$:
                                    480 ;	testpreempt.c:69: TMOD |= 0x20;
      0000D9 43 89 20         [24]  481 	orl	_TMOD,#0x20
                                    482 ;	testpreempt.c:70: TH1   = -6;
      0000DC 75 8D FA         [24]  483 	mov	_TH1,#0xfa
                                    484 ;	testpreempt.c:71: SCON  = 0x50;
      0000DF 75 98 50         [24]  485 	mov	_SCON,#0x50
                                    486 ;	testpreempt.c:72: TR1   = 1;
                                    487 ;	assignBit
      0000E2 D2 8E            [12]  488 	setb	_TR1
      0000E4 A2 00            [12]  489 	mov	c,_Consumer_sloc0_1_0
      0000E6 92 AF            [24]  490 	mov	ea,c
                                    491 ;	testpreempt.c:74: readCursor = 0;
      0000E8 75 38 00         [24]  492 	mov	_readCursor,#0x00
                                    493 ;	testpreempt.c:76: while (1) {
      0000EB                        494 00105$:
                                    495 ;	testpreempt.c:78: SemaphoreWait(full);
      0000EB                        496 2$:
      0000EB E5 36            [12]  497 	MOV A, _full 
      0000ED 60 FC            [24]  498 	JZ 2$ 
      0000EF 20 E7 F9         [24]  499 	JB ACC.7, 2$ 
      0000F2 15 36            [12]  500 	DEC _full 
                                    501 ;	testpreempt.c:79: SemaphoreWait(mutex);
      0000F4                        502 3$:
      0000F4 E5 34            [12]  503 	MOV A, _mutex 
      0000F6 60 FC            [24]  504 	JZ 3$ 
      0000F8 20 E7 F9         [24]  505 	JB ACC.7, 3$ 
      0000FB 15 34            [12]  506 	DEC _mutex 
                                    507 ;	testpreempt.c:82: SBUF = circBuf[readCursor];
      0000FD E5 38            [12]  508 	mov	a,_readCursor
      0000FF 24 30            [12]  509 	add	a, #_circBuf
      000101 F9               [12]  510 	mov	r1,a
      000102 87 99            [24]  511 	mov	_SBUF,@r1
                                    512 ;	testpreempt.c:83: readCursor = (readCursor == 2) ? 0 : readCursor + 1;
      000104 74 02            [12]  513 	mov	a,#0x02
      000106 B5 38 06         [24]  514 	cjne	a,_readCursor,00109$
      000109 7E 00            [12]  515 	mov	r6,#0x00
      00010B 7F 00            [12]  516 	mov	r7,#0x00
      00010D 80 09            [24]  517 	sjmp	00110$
      00010F                        518 00109$:
      00010F AD 38            [24]  519 	mov	r5,_readCursor
      000111 0D               [12]  520 	inc	r5
      000112 ED               [12]  521 	mov	a,r5
      000113 FE               [12]  522 	mov	r6,a
      000114 33               [12]  523 	rlc	a
      000115 95 E0            [12]  524 	subb	a,acc
      000117 FF               [12]  525 	mov	r7,a
      000118                        526 00110$:
      000118 8E 38            [24]  527 	mov	_readCursor,r6
                                    528 ;	testpreempt.c:86: SemaphoreSignal(mutex);
      00011A 05 34            [12]  529 	INC _mutex 
                                    530 ;	testpreempt.c:87: SemaphoreSignal(empty);
      00011C 05 35            [12]  531 	INC _empty 
                                    532 ;	testpreempt.c:90: while (!TI);
      00011E                        533 00101$:
                                    534 ;	testpreempt.c:91: TI = 0;
                                    535 ;	assignBit
      00011E 10 99 CA         [24]  536 	jbc	_TI,00105$
                                    537 ;	testpreempt.c:93: }
      000121 80 FB            [24]  538 	sjmp	00101$
                                    539 ;------------------------------------------------------------
                                    540 ;Allocation info for local variables in function 'main'
                                    541 ;------------------------------------------------------------
                                    542 ;	testpreempt.c:96: void main(void)
                                    543 ;	-----------------------------------------
                                    544 ;	 function main
                                    545 ;	-----------------------------------------
      000123                        546 _main:
                                    547 ;	testpreempt.c:99: SemaphoreCreate(full,  0);
      000123 75 36 00         [24]  548 	mov	_full,#0x00
                                    549 ;	testpreempt.c:100: SemaphoreCreate(mutex, 1);
      000126 75 34 01         [24]  550 	mov	_mutex,#0x01
                                    551 ;	testpreempt.c:101: SemaphoreCreate(empty, 3);
      000129 75 35 03         [24]  552 	mov	_empty,#0x03
                                    553 ;	testpreempt.c:103: ThreadCreate(Producer);   /* spawn Thread 1 */
      00012C 90 00 81         [24]  554 	mov	dptr,#_Producer
      00012F 12 01 BD         [24]  555 	lcall	_ThreadCreate
                                    556 ;	testpreempt.c:104: Consumer();               /* main becomes the Consumer */
                                    557 ;	testpreempt.c:105: }
      000132 02 00 D2         [24]  558 	ljmp	_Consumer
                                    559 ;------------------------------------------------------------
                                    560 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    561 ;------------------------------------------------------------
                                    562 ;	testpreempt.c:108: void _sdcc_gsinit_startup(void)
                                    563 ;	-----------------------------------------
                                    564 ;	 function _sdcc_gsinit_startup
                                    565 ;	-----------------------------------------
      000135                        566 __sdcc_gsinit_startup:
                                    567 ;	testpreempt.c:112: __endasm;
      000135 02 01 42         [24]  568 	LJMP	_Bootstrap
                                    569 ;	testpreempt.c:113: }
      000138 22               [24]  570 	ret
                                    571 ;------------------------------------------------------------
                                    572 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    573 ;------------------------------------------------------------
                                    574 ;	testpreempt.c:115: void _mcs51_genRAMCLEAR(void)  {}
                                    575 ;	-----------------------------------------
                                    576 ;	 function _mcs51_genRAMCLEAR
                                    577 ;	-----------------------------------------
      000139                        578 __mcs51_genRAMCLEAR:
      000139 22               [24]  579 	ret
                                    580 ;------------------------------------------------------------
                                    581 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    582 ;------------------------------------------------------------
                                    583 ;	testpreempt.c:116: void _mcs51_genXINIT(void)     {}
                                    584 ;	-----------------------------------------
                                    585 ;	 function _mcs51_genXINIT
                                    586 ;	-----------------------------------------
      00013A                        587 __mcs51_genXINIT:
      00013A 22               [24]  588 	ret
                                    589 ;------------------------------------------------------------
                                    590 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    591 ;------------------------------------------------------------
                                    592 ;	testpreempt.c:117: void _mcs51_genXRAMCLEAR(void) {}
                                    593 ;	-----------------------------------------
                                    594 ;	 function _mcs51_genXRAMCLEAR
                                    595 ;	-----------------------------------------
      00013B                        596 __mcs51_genXRAMCLEAR:
      00013B 22               [24]  597 	ret
                                    598 ;------------------------------------------------------------
                                    599 ;Allocation info for local variables in function 'timer0_ISR'
                                    600 ;------------------------------------------------------------
                                    601 ;	testpreempt.c:123: void timer0_ISR(void) __interrupt(1) {
                                    602 ;	-----------------------------------------
                                    603 ;	 function timer0_ISR
                                    604 ;	-----------------------------------------
      00013C                        605 _timer0_ISR:
                                    606 ;	testpreempt.c:126: __endasm;
      00013C 02 01 68         [24]  607 	ljmp	_myTimer0Handler
                                    608 ;	testpreempt.c:127: }
      00013F 02 00 54         [24]  609 	ljmp	sdcc_atomic_maybe_rollback
                                    610 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    611 ;	eliminated unneeded push/pop not_psw
                                    612 ;	eliminated unneeded push/pop dpl
                                    613 ;	eliminated unneeded push/pop dph
                                    614 ;	eliminated unneeded push/pop b
                                    615 ;	eliminated unneeded push/pop acc
                                    616 	.area CSEG    (CODE)
                                    617 	.area CONST   (CODE)
                                    618 	.area XINIT   (CODE)
                                    619 	.area CABS    (ABS,CODE)
