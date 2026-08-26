                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _mask
                                    111 	.globl _nextID
                                    112 	.globl _savedCurrentSP
                                    113 	.globl _loopIdx
                                    114 	.globl _threadMask
                                    115 	.globl _currentThread
                                    116 	.globl _savedSP
                                    117 	.globl _ThreadCreate
                                    118 	.globl _ThreadYield
                                    119 	.globl _ThreadExit
                                    120 ;--------------------------------------------------------
                                    121 ; special function registers
                                    122 ;--------------------------------------------------------
                                    123 	.area RSEG    (ABS,DATA)
      000000                        124 	.org 0x0000
                           000080   125 _P0	=	0x0080
                           000081   126 _SP	=	0x0081
                           000082   127 _DPL	=	0x0082
                           000083   128 _DPH	=	0x0083
                           000087   129 _PCON	=	0x0087
                           000088   130 _TCON	=	0x0088
                           000089   131 _TMOD	=	0x0089
                           00008A   132 _TL0	=	0x008a
                           00008B   133 _TL1	=	0x008b
                           00008C   134 _TH0	=	0x008c
                           00008D   135 _TH1	=	0x008d
                           000090   136 _P1	=	0x0090
                           000098   137 _SCON	=	0x0098
                           000099   138 _SBUF	=	0x0099
                           0000A0   139 _P2	=	0x00a0
                           0000A8   140 _IE	=	0x00a8
                           0000B0   141 _P3	=	0x00b0
                           0000B8   142 _IP	=	0x00b8
                           0000D0   143 _PSW	=	0x00d0
                           0000E0   144 _ACC	=	0x00e0
                           0000F0   145 _B	=	0x00f0
                                    146 ;--------------------------------------------------------
                                    147 ; special function bits
                                    148 ;--------------------------------------------------------
                                    149 	.area RSEG    (ABS,DATA)
      000000                        150 	.org 0x0000
                           000080   151 _P0_0	=	0x0080
                           000081   152 _P0_1	=	0x0081
                           000082   153 _P0_2	=	0x0082
                           000083   154 _P0_3	=	0x0083
                           000084   155 _P0_4	=	0x0084
                           000085   156 _P0_5	=	0x0085
                           000086   157 _P0_6	=	0x0086
                           000087   158 _P0_7	=	0x0087
                           000088   159 _IT0	=	0x0088
                           000089   160 _IE0	=	0x0089
                           00008A   161 _IT1	=	0x008a
                           00008B   162 _IE1	=	0x008b
                           00008C   163 _TR0	=	0x008c
                           00008D   164 _TF0	=	0x008d
                           00008E   165 _TR1	=	0x008e
                           00008F   166 _TF1	=	0x008f
                           000090   167 _P1_0	=	0x0090
                           000091   168 _P1_1	=	0x0091
                           000092   169 _P1_2	=	0x0092
                           000093   170 _P1_3	=	0x0093
                           000094   171 _P1_4	=	0x0094
                           000095   172 _P1_5	=	0x0095
                           000096   173 _P1_6	=	0x0096
                           000097   174 _P1_7	=	0x0097
                           000098   175 _RI	=	0x0098
                           000099   176 _TI	=	0x0099
                           00009A   177 _RB8	=	0x009a
                           00009B   178 _TB8	=	0x009b
                           00009C   179 _REN	=	0x009c
                           00009D   180 _SM2	=	0x009d
                           00009E   181 _SM1	=	0x009e
                           00009F   182 _SM0	=	0x009f
                           0000A0   183 _P2_0	=	0x00a0
                           0000A1   184 _P2_1	=	0x00a1
                           0000A2   185 _P2_2	=	0x00a2
                           0000A3   186 _P2_3	=	0x00a3
                           0000A4   187 _P2_4	=	0x00a4
                           0000A5   188 _P2_5	=	0x00a5
                           0000A6   189 _P2_6	=	0x00a6
                           0000A7   190 _P2_7	=	0x00a7
                           0000A8   191 _EX0	=	0x00a8
                           0000A9   192 _ET0	=	0x00a9
                           0000AA   193 _EX1	=	0x00aa
                           0000AB   194 _ET1	=	0x00ab
                           0000AC   195 _ES	=	0x00ac
                           0000AF   196 _EA	=	0x00af
                           0000B0   197 _P3_0	=	0x00b0
                           0000B1   198 _P3_1	=	0x00b1
                           0000B2   199 _P3_2	=	0x00b2
                           0000B3   200 _P3_3	=	0x00b3
                           0000B4   201 _P3_4	=	0x00b4
                           0000B5   202 _P3_5	=	0x00b5
                           0000B6   203 _P3_6	=	0x00b6
                           0000B7   204 _P3_7	=	0x00b7
                           0000B0   205 _RXD	=	0x00b0
                           0000B1   206 _TXD	=	0x00b1
                           0000B2   207 _INT0	=	0x00b2
                           0000B3   208 _INT1	=	0x00b3
                           0000B4   209 _T0	=	0x00b4
                           0000B5   210 _T1	=	0x00b5
                           0000B6   211 _WR	=	0x00b6
                           0000B7   212 _RD	=	0x00b7
                           0000B8   213 _PX0	=	0x00b8
                           0000B9   214 _PT0	=	0x00b9
                           0000BA   215 _PX1	=	0x00ba
                           0000BB   216 _PT1	=	0x00bb
                           0000BC   217 _PS	=	0x00bc
                           0000D0   218 _P	=	0x00d0
                           0000D1   219 _F1	=	0x00d1
                           0000D2   220 _OV	=	0x00d2
                           0000D3   221 _RS0	=	0x00d3
                           0000D4   222 _RS1	=	0x00d4
                           0000D5   223 _F0	=	0x00d5
                           0000D6   224 _AC	=	0x00d6
                           0000D7   225 _CY	=	0x00d7
                                    226 ;--------------------------------------------------------
                                    227 ; overlayable register banks
                                    228 ;--------------------------------------------------------
                                    229 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        230 	.ds 8
                                    231 ;--------------------------------------------------------
                                    232 ; internal ram data
                                    233 ;--------------------------------------------------------
                                    234 	.area DSEG    (DATA)
                           000030   235 _savedSP	=	0x0030
                           000034   236 _currentThread	=	0x0034
                           000035   237 _threadMask	=	0x0035
                           000036   238 _loopIdx	=	0x0036
                           000037   239 _savedCurrentSP	=	0x0037
                           000038   240 _nextID	=	0x0038
                           000039   241 _mask	=	0x0039
                                    242 ;--------------------------------------------------------
                                    243 ; overlayable items in internal ram
                                    244 ;--------------------------------------------------------
                                    245 	.area	OSEG    (OVR,DATA)
                                    246 ;--------------------------------------------------------
                                    247 ; indirectly addressable internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area ISEG    (DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; absolute internal ram data
                                    252 ;--------------------------------------------------------
                                    253 	.area IABS    (ABS,DATA)
                                    254 	.area IABS    (ABS,DATA)
                                    255 ;--------------------------------------------------------
                                    256 ; bit data
                                    257 ;--------------------------------------------------------
                                    258 	.area BSEG    (BIT)
      000002                        259 _ThreadCreate_sloc0_1_0:
      000002                        260 	.ds 1
      000003                        261 _ThreadYield_sloc0_1_0:
      000003                        262 	.ds 1
                                    263 ;--------------------------------------------------------
                                    264 ; paged external ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area PSEG    (PAG,XDATA)
                                    267 ;--------------------------------------------------------
                                    268 ; uninitialized external ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XSEG    (XDATA)
                                    271 ;--------------------------------------------------------
                                    272 ; absolute external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area XABS    (ABS,XDATA)
                                    275 ;--------------------------------------------------------
                                    276 ; initialized external ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area XISEG   (XDATA)
                                    279 	.area HOME    (CODE)
                                    280 	.area GSINIT0 (CODE)
                                    281 	.area GSINIT1 (CODE)
                                    282 	.area GSINIT2 (CODE)
                                    283 	.area GSINIT3 (CODE)
                                    284 	.area GSINIT4 (CODE)
                                    285 	.area GSINIT5 (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 	.area GSFINAL (CODE)
                                    288 	.area CSEG    (CODE)
                                    289 ;--------------------------------------------------------
                                    290 ; global & static initialisations
                                    291 ;--------------------------------------------------------
                                    292 	.area HOME    (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 	.area GSFINAL (CODE)
                                    295 	.area GSINIT  (CODE)
                                    296 ;--------------------------------------------------------
                                    297 ; Home
                                    298 ;--------------------------------------------------------
                                    299 	.area HOME    (CODE)
                                    300 	.area HOME    (CODE)
                                    301 ;--------------------------------------------------------
                                    302 ; code
                                    303 ;--------------------------------------------------------
                                    304 	.area CSEG    (CODE)
                                    305 ;------------------------------------------------------------
                                    306 ;Allocation info for local variables in function 'Bootstrap'
                                    307 ;------------------------------------------------------------
                                    308 ;	preemptive.c:72: void Bootstrap(void) {
                                    309 ;	-----------------------------------------
                                    310 ;	 function Bootstrap
                                    311 ;	-----------------------------------------
      0000F3                        312 _Bootstrap:
                           000007   313 	ar7 = 0x07
                           000006   314 	ar6 = 0x06
                           000005   315 	ar5 = 0x05
                           000004   316 	ar4 = 0x04
                           000003   317 	ar3 = 0x03
                           000002   318 	ar2 = 0x02
                           000001   319 	ar1 = 0x01
                           000000   320 	ar0 = 0x00
                                    321 ;	preemptive.c:73: threadMask = 0;
      0000F3 75 35 00         [24]  322 	mov	_threadMask,#0x00
                                    323 ;	preemptive.c:74: TMOD = 0;      /* Timer 0: mode 0 (13-bit timer) */
      0000F6 75 89 00         [24]  324 	mov	_TMOD,#0x00
                                    325 ;	preemptive.c:75: IE   = 0x82;   /* EA=1, ET0=1 */
      0000F9 75 A8 82         [24]  326 	mov	_IE,#0x82
                                    327 ;	preemptive.c:76: TR0  = 1;      /* start Timer 0 */
                                    328 ;	assignBit
      0000FC D2 8C            [12]  329 	setb	_TR0
                                    330 ;	preemptive.c:77: currentThread = ThreadCreate(main);
      0000FE 90 00 DA         [24]  331 	mov	dptr,#_main
      000101 12 01 6E         [24]  332 	lcall	_ThreadCreate
      000104 85 82 34         [24]  333 	mov	_currentThread,dpl
                                    334 ;	preemptive.c:78: RESTORESTATE;
      000107 E5 34            [12]  335 	mov	a,_currentThread
      000109 24 30            [12]  336 	add	a, #_savedSP
      00010B F9               [12]  337 	mov	r1,a
      00010C 87 81            [24]  338 	mov	_SP,@r1
      00010E D0 D0            [24]  339 	POP PSW 
      000110 D0 83            [24]  340 	POP DPH 
      000112 D0 82            [24]  341 	POP DPL 
      000114 D0 F0            [24]  342 	POP B 
      000116 D0 E0            [24]  343 	POP ACC 
                                    344 ;	preemptive.c:79: }
      000118 22               [24]  345 	ret
                                    346 ;------------------------------------------------------------
                                    347 ;Allocation info for local variables in function 'myTimer0Handler'
                                    348 ;------------------------------------------------------------
                                    349 ;	preemptive.c:90: void myTimer0Handler(void) {
                                    350 ;	-----------------------------------------
                                    351 ;	 function myTimer0Handler
                                    352 ;	-----------------------------------------
      000119                        353 _myTimer0Handler:
                                    354 ;	preemptive.c:91: EA = 0;
                                    355 ;	assignBit
      000119 C2 AF            [12]  356 	clr	_EA
                                    357 ;	preemptive.c:92: SAVESTATE;
      00011B C0 E0            [24]  358 	PUSH ACC 
      00011D C0 F0            [24]  359 	PUSH B 
      00011F C0 82            [24]  360 	PUSH DPL 
      000121 C0 83            [24]  361 	PUSH DPH 
      000123 C0 D0            [24]  362 	PUSH PSW 
      000125 E5 34            [12]  363 	mov	a,_currentThread
      000127 24 30            [12]  364 	add	a, #_savedSP
      000129 F8               [12]  365 	mov	r0,a
      00012A A6 81            [24]  366 	mov	@r0,_SP
                                    367 ;	preemptive.c:94: do {
      00012C                        368 00101$:
                                    369 ;	preemptive.c:95: currentThread = (currentThread + 1) % MAXTHREADS;
      00012C AE 34            [24]  370 	mov	r6,_currentThread
      00012E 7F 00            [12]  371 	mov	r7,#0x00
      000130 8E 82            [24]  372 	mov	dpl,r6
      000132 8F 83            [24]  373 	mov	dph,r7
      000134 A3               [24]  374 	inc	dptr
      000135 75 08 04         [24]  375 	mov	__modsint_PARM_2,#0x04
      000138 8F 09            [24]  376 	mov	(__modsint_PARM_2 + 1),r7
      00013A 12 02 EA         [24]  377 	lcall	__modsint
      00013D AE 82            [24]  378 	mov	r6, dpl
      00013F AF 83            [24]  379 	mov	r7, dph
      000141 8E 34            [24]  380 	mov	_currentThread,r6
                                    381 ;	preemptive.c:96: mask = 1 << currentThread;
      000143 85 34 F0         [24]  382 	mov	b,_currentThread
      000146 05 F0            [12]  383 	inc	b
      000148 74 01            [12]  384 	mov	a,#0x01
      00014A 80 02            [24]  385 	sjmp	00119$
      00014C                        386 00118$:
      00014C 25 E0            [12]  387 	add	a,acc
      00014E                        388 00119$:
      00014E D5 F0 FB         [24]  389 	djnz	b,00118$
      000151 F5 39            [12]  390 	mov	_mask,a
                                    391 ;	preemptive.c:97: } while (!(threadMask & mask));
      000153 E5 39            [12]  392 	mov	a,_mask
      000155 55 35            [12]  393 	anl	a,_threadMask
      000157 60 D3            [24]  394 	jz	00101$
                                    395 ;	preemptive.c:98: RESTORESTATE;
      000159 E5 34            [12]  396 	mov	a,_currentThread
      00015B 24 30            [12]  397 	add	a, #_savedSP
      00015D F9               [12]  398 	mov	r1,a
      00015E 87 81            [24]  399 	mov	_SP,@r1
      000160 D0 D0            [24]  400 	POP PSW 
      000162 D0 83            [24]  401 	POP DPH 
      000164 D0 82            [24]  402 	POP DPL 
      000166 D0 F0            [24]  403 	POP B 
      000168 D0 E0            [24]  404 	POP ACC 
                                    405 ;	preemptive.c:99: EA = 1;
                                    406 ;	assignBit
      00016A D2 AF            [12]  407 	setb	_EA
                                    408 ;	preemptive.c:102: __endasm;
      00016C 32               [24]  409 	RETI
                                    410 ;	preemptive.c:103: }
      00016D 22               [24]  411 	ret
                                    412 ;------------------------------------------------------------
                                    413 ;Allocation info for local variables in function 'ThreadCreate'
                                    414 ;------------------------------------------------------------
                                    415 ;fp            Allocated to registers 
                                    416 ;------------------------------------------------------------
                                    417 ;	preemptive.c:106: ThreadID ThreadCreate(FunctionPtr fp) {
                                    418 ;	-----------------------------------------
                                    419 ;	 function ThreadCreate
                                    420 ;	-----------------------------------------
      00016E                        421 _ThreadCreate:
                                    422 ;	preemptive.c:108: if (threadMask == 0x0F) {
      00016E 74 0F            [12]  423 	mov	a,#0x0f
      000170 B5 35 04         [24]  424 	cjne	a,_threadMask,00102$
                                    425 ;	preemptive.c:109: return -1;
      000173 75 82 FF         [24]  426 	mov	dpl, #0xff
      000176 22               [24]  427 	ret
      000177                        428 00102$:
                                    429 ;	preemptive.c:153: }
      000177 D2 02            [12]  430 	setb	_ThreadCreate_sloc0_1_0
      000179 10 AF 02         [24]  431 	jbc	ea,00136$
      00017C C2 02            [12]  432 	clr	_ThreadCreate_sloc0_1_0
      00017E                        433 00136$:
                                    434 ;	preemptive.c:114: loopIdx = 0;
      00017E 75 36 00         [24]  435 	mov	_loopIdx,#0x00
                                    436 ;	preemptive.c:115: while (loopIdx != MAXTHREADS) {
      000181                        437 00105$:
      000181 74 04            [12]  438 	mov	a,#0x04
      000183 B5 36 02         [24]  439 	cjne	a,_loopIdx,00137$
      000186 80 26            [24]  440 	sjmp	00107$
      000188                        441 00137$:
                                    442 ;	preemptive.c:116: mask = 1 << loopIdx;
      000188 85 36 F0         [24]  443 	mov	b,_loopIdx
      00018B 05 F0            [12]  444 	inc	b
      00018D 74 01            [12]  445 	mov	a,#0x01
      00018F 80 02            [24]  446 	sjmp	00139$
      000191                        447 00138$:
      000191 25 E0            [12]  448 	add	a,acc
      000193                        449 00139$:
      000193 D5 F0 FB         [24]  450 	djnz	b,00138$
      000196 F5 39            [12]  451 	mov	_mask,a
                                    452 ;	preemptive.c:117: if (!(threadMask & mask)) {
      000198 E5 39            [12]  453 	mov	a,_mask
      00019A 55 35            [12]  454 	anl	a,_threadMask
      00019C 70 09            [24]  455 	jnz	00104$
                                    456 ;	preemptive.c:118: threadMask |= mask;   /* mark slot as occupied */
      00019E E5 39            [12]  457 	mov	a,_mask
      0001A0 42 35            [12]  458 	orl	_threadMask,a
                                    459 ;	preemptive.c:119: nextID = loopIdx;
      0001A2 85 36 38         [24]  460 	mov	_nextID,_loopIdx
                                    461 ;	preemptive.c:120: break;
      0001A5 80 07            [24]  462 	sjmp	00107$
      0001A7                        463 00104$:
                                    464 ;	preemptive.c:122: loopIdx++;
      0001A7 E5 36            [12]  465 	mov	a,_loopIdx
      0001A9 04               [12]  466 	inc	a
      0001AA F5 36            [12]  467 	mov	_loopIdx,a
      0001AC 80 D3            [24]  468 	sjmp	00105$
      0001AE                        469 00107$:
                                    470 ;	preemptive.c:126: savedCurrentSP = SP;
      0001AE 85 81 37         [24]  471 	mov	_savedCurrentSP,_SP
                                    472 ;	preemptive.c:127: SP = 0x3F + (nextID << 4);   /* equivalent to nextID * 0x10 */
      0001B1 E5 38            [12]  473 	mov	a,_nextID
      0001B3 C4               [12]  474 	swap	a
      0001B4 54 F0            [12]  475 	anl	a,#0xf0
      0001B6 FF               [12]  476 	mov	r7,a
      0001B7 24 3F            [12]  477 	add	a,#0x3f
      0001B9 F5 81            [12]  478 	mov	_SP,a
                                    479 ;	preemptive.c:133: __endasm;
      0001BB C0 82            [24]  480 	PUSH	DPL
      0001BD C0 83            [24]  481 	PUSH	DPH
                                    482 ;	preemptive.c:142: __endasm;
      0001BF 54 00            [12]  483 	ANL	A, #0
      0001C1 C0 E0            [24]  484 	PUSH	ACC
      0001C3 C0 E0            [24]  485 	PUSH	ACC
      0001C5 C0 E0            [24]  486 	PUSH	ACC
      0001C7 C0 E0            [24]  487 	PUSH	ACC
                                    488 ;	preemptive.c:145: PSW = (nextID << 3);
      0001C9 E5 38            [12]  489 	mov	a,_nextID
      0001CB C4               [12]  490 	swap	a
      0001CC 03               [12]  491 	rr	a
      0001CD 54 F8            [12]  492 	anl	a,#0xf8
      0001CF F5 D0            [12]  493 	mov	_PSW,a
                                    494 ;	preemptive.c:148: __endasm;
      0001D1 C0 D0            [24]  495 	PUSH	PSW
                                    496 ;	preemptive.c:151: savedSP[nextID] = SP;
      0001D3 E5 38            [12]  497 	mov	a,_nextID
      0001D5 24 30            [12]  498 	add	a, #_savedSP
      0001D7 F8               [12]  499 	mov	r0,a
      0001D8 A6 81            [24]  500 	mov	@r0,_SP
                                    501 ;	preemptive.c:152: SP = savedCurrentSP;
      0001DA 85 37 81         [24]  502 	mov	_SP,_savedCurrentSP
      0001DD A2 02            [12]  503 	mov	c,_ThreadCreate_sloc0_1_0
      0001DF 92 AF            [24]  504 	mov	ea,c
                                    505 ;	preemptive.c:155: return nextID;
      0001E1 85 38 82         [24]  506 	mov	dpl, _nextID
                                    507 ;	preemptive.c:156: }
      0001E4 22               [24]  508 	ret
                                    509 ;------------------------------------------------------------
                                    510 ;Allocation info for local variables in function 'ThreadYield'
                                    511 ;------------------------------------------------------------
                                    512 ;	preemptive.c:163: void ThreadYield(void) {
                                    513 ;	-----------------------------------------
                                    514 ;	 function ThreadYield
                                    515 ;	-----------------------------------------
      0001E5                        516 _ThreadYield:
                                    517 ;	preemptive.c:171: }
      0001E5 D2 03            [12]  518 	setb	_ThreadYield_sloc0_1_0
      0001E7 10 AF 02         [24]  519 	jbc	ea,00118$
      0001EA C2 03            [12]  520 	clr	_ThreadYield_sloc0_1_0
      0001EC                        521 00118$:
                                    522 ;	preemptive.c:165: SAVESTATE;
      0001EC C0 E0            [24]  523 	PUSH ACC 
      0001EE C0 F0            [24]  524 	PUSH B 
      0001F0 C0 82            [24]  525 	PUSH DPL 
      0001F2 C0 83            [24]  526 	PUSH DPH 
      0001F4 C0 D0            [24]  527 	PUSH PSW 
      0001F6 E5 34            [12]  528 	mov	a,_currentThread
      0001F8 24 30            [12]  529 	add	a, #_savedSP
      0001FA F8               [12]  530 	mov	r0,a
      0001FB A6 81            [24]  531 	mov	@r0,_SP
                                    532 ;	preemptive.c:166: do {
      0001FD                        533 00101$:
                                    534 ;	preemptive.c:167: currentThread = (currentThread + 1) % MAXTHREADS;
      0001FD AE 34            [24]  535 	mov	r6,_currentThread
      0001FF 7F 00            [12]  536 	mov	r7,#0x00
      000201 8E 82            [24]  537 	mov	dpl,r6
      000203 8F 83            [24]  538 	mov	dph,r7
      000205 A3               [24]  539 	inc	dptr
      000206 75 08 04         [24]  540 	mov	__modsint_PARM_2,#0x04
      000209 8F 09            [24]  541 	mov	(__modsint_PARM_2 + 1),r7
      00020B 12 02 EA         [24]  542 	lcall	__modsint
      00020E AE 82            [24]  543 	mov	r6, dpl
      000210 AF 83            [24]  544 	mov	r7, dph
      000212 8E 34            [24]  545 	mov	_currentThread,r6
                                    546 ;	preemptive.c:168: mask = 1 << currentThread;
      000214 85 34 F0         [24]  547 	mov	b,_currentThread
      000217 05 F0            [12]  548 	inc	b
      000219 74 01            [12]  549 	mov	a,#0x01
      00021B 80 02            [24]  550 	sjmp	00120$
      00021D                        551 00119$:
      00021D 25 E0            [12]  552 	add	a,acc
      00021F                        553 00120$:
      00021F D5 F0 FB         [24]  554 	djnz	b,00119$
      000222 F5 39            [12]  555 	mov	_mask,a
                                    556 ;	preemptive.c:169: } while (!(threadMask & mask));
      000224 E5 39            [12]  557 	mov	a,_mask
      000226 55 35            [12]  558 	anl	a,_threadMask
      000228 60 D3            [24]  559 	jz	00101$
                                    560 ;	preemptive.c:170: RESTORESTATE;
      00022A E5 34            [12]  561 	mov	a,_currentThread
      00022C 24 30            [12]  562 	add	a, #_savedSP
      00022E F9               [12]  563 	mov	r1,a
      00022F 87 81            [24]  564 	mov	_SP,@r1
      000231 D0 D0            [24]  565 	POP PSW 
      000233 D0 83            [24]  566 	POP DPH 
      000235 D0 82            [24]  567 	POP DPL 
      000237 D0 F0            [24]  568 	POP B 
      000239 D0 E0            [24]  569 	POP ACC 
      00023B A2 03            [12]  570 	mov	c,_ThreadYield_sloc0_1_0
      00023D 92 AF            [24]  571 	mov	ea,c
                                    572 ;	preemptive.c:172: }
      00023F 22               [24]  573 	ret
                                    574 ;------------------------------------------------------------
                                    575 ;Allocation info for local variables in function 'ThreadExit'
                                    576 ;------------------------------------------------------------
                                    577 ;	preemptive.c:181: void ThreadExit(void) {
                                    578 ;	-----------------------------------------
                                    579 ;	 function ThreadExit
                                    580 ;	-----------------------------------------
      000240                        581 _ThreadExit:
                                    582 ;	preemptive.c:182: EA = 0;
                                    583 ;	assignBit
      000240 C2 AF            [12]  584 	clr	_EA
                                    585 ;	preemptive.c:185: mask = 1 << currentThread;
      000242 85 34 F0         [24]  586 	mov	b,_currentThread
      000245 05 F0            [12]  587 	inc	b
      000247 74 01            [12]  588 	mov	a,#0x01
      000249 80 02            [24]  589 	sjmp	00135$
      00024B                        590 00134$:
      00024B 25 E0            [12]  591 	add	a,acc
      00024D                        592 00135$:
      00024D D5 F0 FB         [24]  593 	djnz	b,00134$
      000250 F5 39            [12]  594 	mov	_mask,a
                                    595 ;	preemptive.c:186: threadMask ^= mask;
      000252 E5 39            [12]  596 	mov	a,_mask
      000254 62 35            [12]  597 	xrl	_threadMask,a
                                    598 ;	preemptive.c:189: loopIdx = 0;
      000256 75 36 00         [24]  599 	mov	_loopIdx,#0x00
                                    600 ;	preemptive.c:190: while (loopIdx < MAXTHREADS) {
      000259                        601 00103$:
      000259 74 FC            [12]  602 	mov	a,#0x100 - 0x04
      00025B 25 36            [12]  603 	add	a,_loopIdx
      00025D 40 22            [24]  604 	jc	00105$
                                    605 ;	preemptive.c:191: mask = 1 << loopIdx;
      00025F 85 36 F0         [24]  606 	mov	b,_loopIdx
      000262 05 F0            [12]  607 	inc	b
      000264 74 01            [12]  608 	mov	a,#0x01
      000266 80 02            [24]  609 	sjmp	00138$
      000268                        610 00137$:
      000268 25 E0            [12]  611 	add	a,acc
      00026A                        612 00138$:
      00026A D5 F0 FB         [24]  613 	djnz	b,00137$
      00026D F5 39            [12]  614 	mov	_mask,a
                                    615 ;	preemptive.c:192: if (mask & threadMask) {
      00026F E5 35            [12]  616 	mov	a,_threadMask
      000271 55 39            [12]  617 	anl	a,_mask
      000273 60 05            [24]  618 	jz	00102$
                                    619 ;	preemptive.c:193: currentThread = loopIdx;
      000275 85 36 34         [24]  620 	mov	_currentThread,_loopIdx
                                    621 ;	preemptive.c:194: break;
      000278 80 07            [24]  622 	sjmp	00105$
      00027A                        623 00102$:
                                    624 ;	preemptive.c:196: loopIdx++;
      00027A E5 36            [12]  625 	mov	a,_loopIdx
      00027C 04               [12]  626 	inc	a
      00027D F5 36            [12]  627 	mov	_loopIdx,a
      00027F 80 D8            [24]  628 	sjmp	00103$
      000281                        629 00105$:
                                    630 ;	preemptive.c:199: if (loopIdx == MAXTHREADS) {
      000281 74 04            [12]  631 	mov	a,#0x04
      000283 B5 36 03         [24]  632 	cjne	a,_loopIdx,00107$
                                    633 ;	preemptive.c:200: currentThread = -1;
      000286 75 34 FF         [24]  634 	mov	_currentThread,#0xff
      000289                        635 00107$:
                                    636 ;	preemptive.c:203: RESTORESTATE;
      000289 E5 34            [12]  637 	mov	a,_currentThread
      00028B 24 30            [12]  638 	add	a, #_savedSP
      00028D F9               [12]  639 	mov	r1,a
      00028E 87 81            [24]  640 	mov	_SP,@r1
      000290 D0 D0            [24]  641 	POP PSW 
      000292 D0 83            [24]  642 	POP DPH 
      000294 D0 82            [24]  643 	POP DPL 
      000296 D0 F0            [24]  644 	POP B 
      000298 D0 E0            [24]  645 	POP ACC 
                                    646 ;	preemptive.c:204: EA = 1;
                                    647 ;	assignBit
      00029A D2 AF            [12]  648 	setb	_EA
                                    649 ;	preemptive.c:205: }
      00029C 22               [24]  650 	ret
                                    651 	.area CSEG    (CODE)
                                    652 	.area CONST   (CODE)
                                    653 	.area XINIT   (CODE)
                                    654 	.area CABS    (ABS,CODE)
