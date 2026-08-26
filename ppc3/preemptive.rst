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
                           000020   235 _savedSP	=	0x0020
                           000024   236 _currentThread	=	0x0024
                           000025   237 _threadMask	=	0x0025
                           000026   238 _loopIdx	=	0x0026
                           000027   239 _savedCurrentSP	=	0x0027
                           000028   240 _nextID	=	0x0028
                           000029   241 _mask	=	0x0029
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
      000001                        259 _ThreadCreate_sloc0_1_0:
      000001                        260 	.ds 1
      000002                        261 _ThreadYield_sloc0_1_0:
      000002                        262 	.ds 1
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
                                    308 ;	preemptive.c:71: void Bootstrap(void) {
                                    309 ;	-----------------------------------------
                                    310 ;	 function Bootstrap
                                    311 ;	-----------------------------------------
      000142                        312 _Bootstrap:
                           000007   313 	ar7 = 0x07
                           000006   314 	ar6 = 0x06
                           000005   315 	ar5 = 0x05
                           000004   316 	ar4 = 0x04
                           000003   317 	ar3 = 0x03
                           000002   318 	ar2 = 0x02
                           000001   319 	ar1 = 0x01
                           000000   320 	ar0 = 0x00
                                    321 ;	preemptive.c:72: threadMask    = 0;
      000142 75 25 00         [24]  322 	mov	_threadMask,#0x00
                                    323 ;	preemptive.c:73: TMOD          = 0;      /* Timer 0 mode 0 — 13-bit counter */
      000145 75 89 00         [24]  324 	mov	_TMOD,#0x00
                                    325 ;	preemptive.c:74: IE            = 0x82;   /* EA=1, ET0=1                     */
      000148 75 A8 82         [24]  326 	mov	_IE,#0x82
                                    327 ;	preemptive.c:75: TR0           = 1;      /* start Timer 0                   */
                                    328 ;	assignBit
      00014B D2 8C            [12]  329 	setb	_TR0
                                    330 ;	preemptive.c:76: currentThread = ThreadCreate(main);
      00014D 90 01 23         [24]  331 	mov	dptr,#_main
      000150 12 01 BD         [24]  332 	lcall	_ThreadCreate
      000153 85 82 24         [24]  333 	mov	_currentThread,dpl
                                    334 ;	preemptive.c:77: RESTORESTATE;
      000156 E5 24            [12]  335 	mov	a,_currentThread
      000158 24 20            [12]  336 	add	a, #_savedSP
      00015A F9               [12]  337 	mov	r1,a
      00015B 87 81            [24]  338 	mov	_SP,@r1
      00015D D0 D0            [24]  339 	POP PSW 
      00015F D0 83            [24]  340 	POP DPH 
      000161 D0 82            [24]  341 	POP DPL 
      000163 D0 F0            [24]  342 	POP B 
      000165 D0 E0            [24]  343 	POP ACC 
                                    344 ;	preemptive.c:78: }
      000167 22               [24]  345 	ret
                                    346 ;------------------------------------------------------------
                                    347 ;Allocation info for local variables in function 'myTimer0Handler'
                                    348 ;------------------------------------------------------------
                                    349 ;	preemptive.c:86: void myTimer0Handler(void) {
                                    350 ;	-----------------------------------------
                                    351 ;	 function myTimer0Handler
                                    352 ;	-----------------------------------------
      000168                        353 _myTimer0Handler:
                                    354 ;	preemptive.c:87: EA = 0;
                                    355 ;	assignBit
      000168 C2 AF            [12]  356 	clr	_EA
                                    357 ;	preemptive.c:88: SAVESTATE;
      00016A C0 E0            [24]  358 	PUSH ACC 
      00016C C0 F0            [24]  359 	PUSH B 
      00016E C0 82            [24]  360 	PUSH DPL 
      000170 C0 83            [24]  361 	PUSH DPH 
      000172 C0 D0            [24]  362 	PUSH PSW 
      000174 E5 24            [12]  363 	mov	a,_currentThread
      000176 24 20            [12]  364 	add	a, #_savedSP
      000178 F8               [12]  365 	mov	r0,a
      000179 A6 81            [24]  366 	mov	@r0,_SP
                                    367 ;	preemptive.c:89: do {
      00017B                        368 00101$:
                                    369 ;	preemptive.c:90: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      00017B 74 FD            [12]  370 	mov	a,#0x100 - 0x03
      00017D 25 24            [12]  371 	add	a,_currentThread
      00017F 40 0B            [24]  372 	jc	00106$
      000181 AF 24            [24]  373 	mov	r7,_currentThread
      000183 0F               [12]  374 	inc	r7
      000184 EF               [12]  375 	mov	a,r7
      000185 FE               [12]  376 	mov	r6,a
      000186 33               [12]  377 	rlc	a
      000187 95 E0            [12]  378 	subb	a,acc
      000189 FF               [12]  379 	mov	r7,a
      00018A 80 04            [24]  380 	sjmp	00107$
      00018C                        381 00106$:
      00018C 7E 00            [12]  382 	mov	r6,#0x00
      00018E 7F 00            [12]  383 	mov	r7,#0x00
      000190                        384 00107$:
      000190 8E 24            [24]  385 	mov	_currentThread,r6
                                    386 ;	preemptive.c:91: mask = 1 << currentThread;
      000192 85 24 F0         [24]  387 	mov	b,_currentThread
      000195 05 F0            [12]  388 	inc	b
      000197 74 01            [12]  389 	mov	a,#0x01
      000199 80 02            [24]  390 	sjmp	00128$
      00019B                        391 00127$:
      00019B 25 E0            [12]  392 	add	a,acc
      00019D                        393 00128$:
      00019D D5 F0 FB         [24]  394 	djnz	b,00127$
      0001A0 F5 29            [12]  395 	mov	_mask,a
                                    396 ;	preemptive.c:92: } while (!(threadMask & mask));
      0001A2 E5 29            [12]  397 	mov	a,_mask
      0001A4 55 25            [12]  398 	anl	a,_threadMask
      0001A6 60 D3            [24]  399 	jz	00101$
                                    400 ;	preemptive.c:93: RESTORESTATE;
      0001A8 E5 24            [12]  401 	mov	a,_currentThread
      0001AA 24 20            [12]  402 	add	a, #_savedSP
      0001AC F9               [12]  403 	mov	r1,a
      0001AD 87 81            [24]  404 	mov	_SP,@r1
      0001AF D0 D0            [24]  405 	POP PSW 
      0001B1 D0 83            [24]  406 	POP DPH 
      0001B3 D0 82            [24]  407 	POP DPL 
      0001B5 D0 F0            [24]  408 	POP B 
      0001B7 D0 E0            [24]  409 	POP ACC 
                                    410 ;	preemptive.c:94: EA = 1;
                                    411 ;	assignBit
      0001B9 D2 AF            [12]  412 	setb	_EA
                                    413 ;	preemptive.c:97: __endasm;
      0001BB 32               [24]  414 	RETI
                                    415 ;	preemptive.c:98: }
      0001BC 22               [24]  416 	ret
                                    417 ;------------------------------------------------------------
                                    418 ;Allocation info for local variables in function 'ThreadCreate'
                                    419 ;------------------------------------------------------------
                                    420 ;fp            Allocated to registers 
                                    421 ;------------------------------------------------------------
                                    422 ;	preemptive.c:101: ThreadID ThreadCreate(FunctionPtr fp) {
                                    423 ;	-----------------------------------------
                                    424 ;	 function ThreadCreate
                                    425 ;	-----------------------------------------
      0001BD                        426 _ThreadCreate:
                                    427 ;	preemptive.c:102: if (threadMask == 0x0F) {
      0001BD 74 0F            [12]  428 	mov	a,#0x0f
      0001BF B5 25 04         [24]  429 	cjne	a,_threadMask,00102$
                                    430 ;	preemptive.c:103: return -1;
      0001C2 75 82 FF         [24]  431 	mov	dpl, #0xff
      0001C5 22               [24]  432 	ret
      0001C6                        433 00102$:
                                    434 ;	preemptive.c:147: }
      0001C6 D2 01            [12]  435 	setb	_ThreadCreate_sloc0_1_0
      0001C8 10 AF 02         [24]  436 	jbc	ea,00136$
      0001CB C2 01            [12]  437 	clr	_ThreadCreate_sloc0_1_0
      0001CD                        438 00136$:
                                    439 ;	preemptive.c:108: loopIdx = 0;
      0001CD 75 26 00         [24]  440 	mov	_loopIdx,#0x00
                                    441 ;	preemptive.c:109: while (loopIdx != MAXTHREADS) {
      0001D0                        442 00105$:
      0001D0 74 04            [12]  443 	mov	a,#0x04
      0001D2 B5 26 02         [24]  444 	cjne	a,_loopIdx,00137$
      0001D5 80 26            [24]  445 	sjmp	00107$
      0001D7                        446 00137$:
                                    447 ;	preemptive.c:110: mask = 1 << loopIdx;
      0001D7 85 26 F0         [24]  448 	mov	b,_loopIdx
      0001DA 05 F0            [12]  449 	inc	b
      0001DC 74 01            [12]  450 	mov	a,#0x01
      0001DE 80 02            [24]  451 	sjmp	00139$
      0001E0                        452 00138$:
      0001E0 25 E0            [12]  453 	add	a,acc
      0001E2                        454 00139$:
      0001E2 D5 F0 FB         [24]  455 	djnz	b,00138$
      0001E5 F5 29            [12]  456 	mov	_mask,a
                                    457 ;	preemptive.c:111: if (!(threadMask & mask)) {
      0001E7 E5 29            [12]  458 	mov	a,_mask
      0001E9 55 25            [12]  459 	anl	a,_threadMask
      0001EB 70 09            [24]  460 	jnz	00104$
                                    461 ;	preemptive.c:112: threadMask |= mask; /* mark slot as occupied */
      0001ED E5 29            [12]  462 	mov	a,_mask
      0001EF 42 25            [12]  463 	orl	_threadMask,a
                                    464 ;	preemptive.c:113: nextID = loopIdx;
      0001F1 85 26 28         [24]  465 	mov	_nextID,_loopIdx
                                    466 ;	preemptive.c:114: break;
      0001F4 80 07            [24]  467 	sjmp	00107$
      0001F6                        468 00104$:
                                    469 ;	preemptive.c:116: loopIdx++;
      0001F6 E5 26            [12]  470 	mov	a,_loopIdx
      0001F8 04               [12]  471 	inc	a
      0001F9 F5 26            [12]  472 	mov	_loopIdx,a
      0001FB 80 D3            [24]  473 	sjmp	00105$
      0001FD                        474 00107$:
                                    475 ;	preemptive.c:120: savedCurrentSP = SP;
      0001FD 85 81 27         [24]  476 	mov	_savedCurrentSP,_SP
                                    477 ;	preemptive.c:121: SP = 0x3F + (nextID << 4);  
      000200 E5 28            [12]  478 	mov	a,_nextID
      000202 C4               [12]  479 	swap	a
      000203 54 F0            [12]  480 	anl	a,#0xf0
      000205 FF               [12]  481 	mov	r7,a
      000206 24 3F            [12]  482 	add	a,#0x3f
      000208 F5 81            [12]  483 	mov	_SP,a
                                    484 ;	preemptive.c:127: __endasm;
      00020A C0 82            [24]  485 	PUSH	DPL
      00020C C0 83            [24]  486 	PUSH	DPH
                                    487 ;	preemptive.c:136: __endasm;
      00020E 54 00            [12]  488 	ANL	A, #0
      000210 C0 E0            [24]  489 	PUSH	ACC
      000212 C0 E0            [24]  490 	PUSH	ACC
      000214 C0 E0            [24]  491 	PUSH	ACC
      000216 C0 E0            [24]  492 	PUSH	ACC
                                    493 ;	preemptive.c:139: PSW = (nextID << 3);
      000218 E5 28            [12]  494 	mov	a,_nextID
      00021A C4               [12]  495 	swap	a
      00021B 03               [12]  496 	rr	a
      00021C 54 F8            [12]  497 	anl	a,#0xf8
      00021E F5 D0            [12]  498 	mov	_PSW,a
                                    499 ;	preemptive.c:142: __endasm;
      000220 C0 D0            [24]  500 	PUSH	PSW
                                    501 ;	preemptive.c:145: savedSP[nextID] = SP;
      000222 E5 28            [12]  502 	mov	a,_nextID
      000224 24 20            [12]  503 	add	a, #_savedSP
      000226 F8               [12]  504 	mov	r0,a
      000227 A6 81            [24]  505 	mov	@r0,_SP
                                    506 ;	preemptive.c:146: SP = savedCurrentSP;
      000229 85 27 81         [24]  507 	mov	_SP,_savedCurrentSP
      00022C A2 01            [12]  508 	mov	c,_ThreadCreate_sloc0_1_0
      00022E 92 AF            [24]  509 	mov	ea,c
                                    510 ;	preemptive.c:149: return nextID;
      000230 85 28 82         [24]  511 	mov	dpl, _nextID
                                    512 ;	preemptive.c:150: }
      000233 22               [24]  513 	ret
                                    514 ;------------------------------------------------------------
                                    515 ;Allocation info for local variables in function 'ThreadYield'
                                    516 ;------------------------------------------------------------
                                    517 ;	preemptive.c:157: void ThreadYield(void) {
                                    518 ;	-----------------------------------------
                                    519 ;	 function ThreadYield
                                    520 ;	-----------------------------------------
      000234                        521 _ThreadYield:
                                    522 ;	preemptive.c:165: }
      000234 D2 02            [12]  523 	setb	_ThreadYield_sloc0_1_0
      000236 10 AF 02         [24]  524 	jbc	ea,00126$
      000239 C2 02            [12]  525 	clr	_ThreadYield_sloc0_1_0
      00023B                        526 00126$:
                                    527 ;	preemptive.c:159: SAVESTATE;
      00023B C0 E0            [24]  528 	PUSH ACC 
      00023D C0 F0            [24]  529 	PUSH B 
      00023F C0 82            [24]  530 	PUSH DPL 
      000241 C0 83            [24]  531 	PUSH DPH 
      000243 C0 D0            [24]  532 	PUSH PSW 
      000245 E5 24            [12]  533 	mov	a,_currentThread
      000247 24 20            [12]  534 	add	a, #_savedSP
      000249 F8               [12]  535 	mov	r0,a
      00024A A6 81            [24]  536 	mov	@r0,_SP
                                    537 ;	preemptive.c:160: do {
      00024C                        538 00101$:
                                    539 ;	preemptive.c:161: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      00024C 74 FD            [12]  540 	mov	a,#0x100 - 0x03
      00024E 25 24            [12]  541 	add	a,_currentThread
      000250 40 0B            [24]  542 	jc	00106$
      000252 AF 24            [24]  543 	mov	r7,_currentThread
      000254 0F               [12]  544 	inc	r7
      000255 EF               [12]  545 	mov	a,r7
      000256 FE               [12]  546 	mov	r6,a
      000257 33               [12]  547 	rlc	a
      000258 95 E0            [12]  548 	subb	a,acc
      00025A FF               [12]  549 	mov	r7,a
      00025B 80 04            [24]  550 	sjmp	00107$
      00025D                        551 00106$:
      00025D 7E 00            [12]  552 	mov	r6,#0x00
      00025F 7F 00            [12]  553 	mov	r7,#0x00
      000261                        554 00107$:
      000261 8E 24            [24]  555 	mov	_currentThread,r6
                                    556 ;	preemptive.c:162: mask = 1 << currentThread;
      000263 85 24 F0         [24]  557 	mov	b,_currentThread
      000266 05 F0            [12]  558 	inc	b
      000268 74 01            [12]  559 	mov	a,#0x01
      00026A 80 02            [24]  560 	sjmp	00129$
      00026C                        561 00128$:
      00026C 25 E0            [12]  562 	add	a,acc
      00026E                        563 00129$:
      00026E D5 F0 FB         [24]  564 	djnz	b,00128$
      000271 F5 29            [12]  565 	mov	_mask,a
                                    566 ;	preemptive.c:163: } while (!(threadMask & mask));
      000273 E5 29            [12]  567 	mov	a,_mask
      000275 55 25            [12]  568 	anl	a,_threadMask
      000277 60 D3            [24]  569 	jz	00101$
                                    570 ;	preemptive.c:164: RESTORESTATE;
      000279 E5 24            [12]  571 	mov	a,_currentThread
      00027B 24 20            [12]  572 	add	a, #_savedSP
      00027D F9               [12]  573 	mov	r1,a
      00027E 87 81            [24]  574 	mov	_SP,@r1
      000280 D0 D0            [24]  575 	POP PSW 
      000282 D0 83            [24]  576 	POP DPH 
      000284 D0 82            [24]  577 	POP DPL 
      000286 D0 F0            [24]  578 	POP B 
      000288 D0 E0            [24]  579 	POP ACC 
      00028A A2 02            [12]  580 	mov	c,_ThreadYield_sloc0_1_0
      00028C 92 AF            [24]  581 	mov	ea,c
                                    582 ;	preemptive.c:166: }
      00028E 22               [24]  583 	ret
                                    584 ;------------------------------------------------------------
                                    585 ;Allocation info for local variables in function 'ThreadExit'
                                    586 ;------------------------------------------------------------
                                    587 ;	preemptive.c:173: void ThreadExit(void) {
                                    588 ;	-----------------------------------------
                                    589 ;	 function ThreadExit
                                    590 ;	-----------------------------------------
      00028F                        591 _ThreadExit:
                                    592 ;	preemptive.c:174: EA = 0;
                                    593 ;	assignBit
      00028F C2 AF            [12]  594 	clr	_EA
                                    595 ;	preemptive.c:176: mask = 1 << currentThread;
      000291 85 24 F0         [24]  596 	mov	b,_currentThread
      000294 05 F0            [12]  597 	inc	b
      000296 74 01            [12]  598 	mov	a,#0x01
      000298 80 02            [24]  599 	sjmp	00135$
      00029A                        600 00134$:
      00029A 25 E0            [12]  601 	add	a,acc
      00029C                        602 00135$:
      00029C D5 F0 FB         [24]  603 	djnz	b,00134$
      00029F F5 29            [12]  604 	mov	_mask,a
                                    605 ;	preemptive.c:177: threadMask ^= mask;
      0002A1 E5 29            [12]  606 	mov	a,_mask
      0002A3 62 25            [12]  607 	xrl	_threadMask,a
                                    608 ;	preemptive.c:179: loopIdx = 0;
      0002A5 75 26 00         [24]  609 	mov	_loopIdx,#0x00
                                    610 ;	preemptive.c:180: while (loopIdx < MAXTHREADS) {
      0002A8                        611 00103$:
      0002A8 74 FC            [12]  612 	mov	a,#0x100 - 0x04
      0002AA 25 26            [12]  613 	add	a,_loopIdx
      0002AC 40 22            [24]  614 	jc	00105$
                                    615 ;	preemptive.c:181: mask = 1 << loopIdx;
      0002AE 85 26 F0         [24]  616 	mov	b,_loopIdx
      0002B1 05 F0            [12]  617 	inc	b
      0002B3 74 01            [12]  618 	mov	a,#0x01
      0002B5 80 02            [24]  619 	sjmp	00138$
      0002B7                        620 00137$:
      0002B7 25 E0            [12]  621 	add	a,acc
      0002B9                        622 00138$:
      0002B9 D5 F0 FB         [24]  623 	djnz	b,00137$
      0002BC F5 29            [12]  624 	mov	_mask,a
                                    625 ;	preemptive.c:182: if (mask & threadMask) {
      0002BE E5 25            [12]  626 	mov	a,_threadMask
      0002C0 55 29            [12]  627 	anl	a,_mask
      0002C2 60 05            [24]  628 	jz	00102$
                                    629 ;	preemptive.c:183: currentThread = loopIdx;
      0002C4 85 26 24         [24]  630 	mov	_currentThread,_loopIdx
                                    631 ;	preemptive.c:184: break;
      0002C7 80 07            [24]  632 	sjmp	00105$
      0002C9                        633 00102$:
                                    634 ;	preemptive.c:186: loopIdx++;
      0002C9 E5 26            [12]  635 	mov	a,_loopIdx
      0002CB 04               [12]  636 	inc	a
      0002CC F5 26            [12]  637 	mov	_loopIdx,a
      0002CE 80 D8            [24]  638 	sjmp	00103$
      0002D0                        639 00105$:
                                    640 ;	preemptive.c:189: if (loopIdx == MAXTHREADS) {
      0002D0 74 04            [12]  641 	mov	a,#0x04
      0002D2 B5 26 03         [24]  642 	cjne	a,_loopIdx,00107$
                                    643 ;	preemptive.c:190: currentThread = -1;
      0002D5 75 24 FF         [24]  644 	mov	_currentThread,#0xff
      0002D8                        645 00107$:
                                    646 ;	preemptive.c:193: RESTORESTATE;
      0002D8 E5 24            [12]  647 	mov	a,_currentThread
      0002DA 24 20            [12]  648 	add	a, #_savedSP
      0002DC F9               [12]  649 	mov	r1,a
      0002DD 87 81            [24]  650 	mov	_SP,@r1
      0002DF D0 D0            [24]  651 	POP PSW 
      0002E1 D0 83            [24]  652 	POP DPH 
      0002E3 D0 82            [24]  653 	POP DPL 
      0002E5 D0 F0            [24]  654 	POP B 
      0002E7 D0 E0            [24]  655 	POP ACC 
                                    656 ;	preemptive.c:194: EA = 1;
                                    657 ;	assignBit
      0002E9 D2 AF            [12]  658 	setb	_EA
                                    659 ;	preemptive.c:195: }
      0002EB 22               [24]  660 	ret
                                    661 	.area CSEG    (CODE)
                                    662 	.area CONST   (CODE)
                                    663 	.area XINIT   (CODE)
                                    664 	.area CABS    (ABS,CODE)
