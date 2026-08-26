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
                                    110 	.globl _my_time
                                    111 	.globl _temp
                                    112 	.globl _newThread
                                    113 	.globl _tempSP
                                    114 	.globl _i
                                    115 	.globl _threadMask
                                    116 	.globl _currentThread
                                    117 	.globl _savedSP
                                    118 	.globl _ThreadCreate
                                    119 	.globl _ThreadYield
                                    120 	.globl _ThreadExit
                                    121 	.globl _ThreadReset
                                    122 ;--------------------------------------------------------
                                    123 ; special function registers
                                    124 ;--------------------------------------------------------
                                    125 	.area RSEG    (ABS,DATA)
      000000                        126 	.org 0x0000
                           000080   127 _P0	=	0x0080
                           000081   128 _SP	=	0x0081
                           000082   129 _DPL	=	0x0082
                           000083   130 _DPH	=	0x0083
                           000087   131 _PCON	=	0x0087
                           000088   132 _TCON	=	0x0088
                           000089   133 _TMOD	=	0x0089
                           00008A   134 _TL0	=	0x008a
                           00008B   135 _TL1	=	0x008b
                           00008C   136 _TH0	=	0x008c
                           00008D   137 _TH1	=	0x008d
                           000090   138 _P1	=	0x0090
                           000098   139 _SCON	=	0x0098
                           000099   140 _SBUF	=	0x0099
                           0000A0   141 _P2	=	0x00a0
                           0000A8   142 _IE	=	0x00a8
                           0000B0   143 _P3	=	0x00b0
                           0000B8   144 _IP	=	0x00b8
                           0000D0   145 _PSW	=	0x00d0
                           0000E0   146 _ACC	=	0x00e0
                           0000F0   147 _B	=	0x00f0
                                    148 ;--------------------------------------------------------
                                    149 ; special function bits
                                    150 ;--------------------------------------------------------
                                    151 	.area RSEG    (ABS,DATA)
      000000                        152 	.org 0x0000
                           000080   153 _P0_0	=	0x0080
                           000081   154 _P0_1	=	0x0081
                           000082   155 _P0_2	=	0x0082
                           000083   156 _P0_3	=	0x0083
                           000084   157 _P0_4	=	0x0084
                           000085   158 _P0_5	=	0x0085
                           000086   159 _P0_6	=	0x0086
                           000087   160 _P0_7	=	0x0087
                           000088   161 _IT0	=	0x0088
                           000089   162 _IE0	=	0x0089
                           00008A   163 _IT1	=	0x008a
                           00008B   164 _IE1	=	0x008b
                           00008C   165 _TR0	=	0x008c
                           00008D   166 _TF0	=	0x008d
                           00008E   167 _TR1	=	0x008e
                           00008F   168 _TF1	=	0x008f
                           000090   169 _P1_0	=	0x0090
                           000091   170 _P1_1	=	0x0091
                           000092   171 _P1_2	=	0x0092
                           000093   172 _P1_3	=	0x0093
                           000094   173 _P1_4	=	0x0094
                           000095   174 _P1_5	=	0x0095
                           000096   175 _P1_6	=	0x0096
                           000097   176 _P1_7	=	0x0097
                           000098   177 _RI	=	0x0098
                           000099   178 _TI	=	0x0099
                           00009A   179 _RB8	=	0x009a
                           00009B   180 _TB8	=	0x009b
                           00009C   181 _REN	=	0x009c
                           00009D   182 _SM2	=	0x009d
                           00009E   183 _SM1	=	0x009e
                           00009F   184 _SM0	=	0x009f
                           0000A0   185 _P2_0	=	0x00a0
                           0000A1   186 _P2_1	=	0x00a1
                           0000A2   187 _P2_2	=	0x00a2
                           0000A3   188 _P2_3	=	0x00a3
                           0000A4   189 _P2_4	=	0x00a4
                           0000A5   190 _P2_5	=	0x00a5
                           0000A6   191 _P2_6	=	0x00a6
                           0000A7   192 _P2_7	=	0x00a7
                           0000A8   193 _EX0	=	0x00a8
                           0000A9   194 _ET0	=	0x00a9
                           0000AA   195 _EX1	=	0x00aa
                           0000AB   196 _ET1	=	0x00ab
                           0000AC   197 _ES	=	0x00ac
                           0000AF   198 _EA	=	0x00af
                           0000B0   199 _P3_0	=	0x00b0
                           0000B1   200 _P3_1	=	0x00b1
                           0000B2   201 _P3_2	=	0x00b2
                           0000B3   202 _P3_3	=	0x00b3
                           0000B4   203 _P3_4	=	0x00b4
                           0000B5   204 _P3_5	=	0x00b5
                           0000B6   205 _P3_6	=	0x00b6
                           0000B7   206 _P3_7	=	0x00b7
                           0000B0   207 _RXD	=	0x00b0
                           0000B1   208 _TXD	=	0x00b1
                           0000B2   209 _INT0	=	0x00b2
                           0000B3   210 _INT1	=	0x00b3
                           0000B4   211 _T0	=	0x00b4
                           0000B5   212 _T1	=	0x00b5
                           0000B6   213 _WR	=	0x00b6
                           0000B7   214 _RD	=	0x00b7
                           0000B8   215 _PX0	=	0x00b8
                           0000B9   216 _PT0	=	0x00b9
                           0000BA   217 _PX1	=	0x00ba
                           0000BB   218 _PT1	=	0x00bb
                           0000BC   219 _PS	=	0x00bc
                           0000D0   220 _P	=	0x00d0
                           0000D1   221 _F1	=	0x00d1
                           0000D2   222 _OV	=	0x00d2
                           0000D3   223 _RS0	=	0x00d3
                           0000D4   224 _RS1	=	0x00d4
                           0000D5   225 _F0	=	0x00d5
                           0000D6   226 _AC	=	0x00d6
                           0000D7   227 _CY	=	0x00d7
                                    228 ;--------------------------------------------------------
                                    229 ; overlayable register banks
                                    230 ;--------------------------------------------------------
                                    231 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        232 	.ds 8
                                    233 ;--------------------------------------------------------
                                    234 ; internal ram data
                                    235 ;--------------------------------------------------------
                                    236 	.area DSEG    (DATA)
                           000025   237 _savedSP	=	0x0025
                           000029   238 _currentThread	=	0x0029
                           00002A   239 _threadMask	=	0x002a
                           00002B   240 _i	=	0x002b
                           00002C   241 _tempSP	=	0x002c
                           00002D   242 _newThread	=	0x002d
                           00002E   243 _temp	=	0x002e
                           000034   244 _my_time	=	0x0034
                                    245 ;--------------------------------------------------------
                                    246 ; overlayable items in internal ram
                                    247 ;--------------------------------------------------------
                                    248 	.area	OSEG    (OVR,DATA)
                                    249 ;--------------------------------------------------------
                                    250 ; indirectly addressable internal ram data
                                    251 ;--------------------------------------------------------
                                    252 	.area ISEG    (DATA)
                                    253 ;--------------------------------------------------------
                                    254 ; absolute internal ram data
                                    255 ;--------------------------------------------------------
                                    256 	.area IABS    (ABS,DATA)
                                    257 	.area IABS    (ABS,DATA)
                                    258 ;--------------------------------------------------------
                                    259 ; bit data
                                    260 ;--------------------------------------------------------
                                    261 	.area BSEG    (BIT)
      000001                        262 _ThreadCreate_sloc0_1_0:
      000001                        263 	.ds 1
      000002                        264 _ThreadExit_sloc0_1_0:
      000002                        265 	.ds 1
                                    266 ;--------------------------------------------------------
                                    267 ; paged external ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area PSEG    (PAG,XDATA)
                                    270 ;--------------------------------------------------------
                                    271 ; uninitialized external ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area XSEG    (XDATA)
                                    274 ;--------------------------------------------------------
                                    275 ; absolute external ram data
                                    276 ;--------------------------------------------------------
                                    277 	.area XABS    (ABS,XDATA)
                                    278 ;--------------------------------------------------------
                                    279 ; initialized external ram data
                                    280 ;--------------------------------------------------------
                                    281 	.area XISEG   (XDATA)
                                    282 	.area HOME    (CODE)
                                    283 	.area GSINIT0 (CODE)
                                    284 	.area GSINIT1 (CODE)
                                    285 	.area GSINIT2 (CODE)
                                    286 	.area GSINIT3 (CODE)
                                    287 	.area GSINIT4 (CODE)
                                    288 	.area GSINIT5 (CODE)
                                    289 	.area GSINIT  (CODE)
                                    290 	.area GSFINAL (CODE)
                                    291 	.area CSEG    (CODE)
                                    292 ;--------------------------------------------------------
                                    293 ; global & static initialisations
                                    294 ;--------------------------------------------------------
                                    295 	.area HOME    (CODE)
                                    296 	.area GSINIT  (CODE)
                                    297 	.area GSFINAL (CODE)
                                    298 	.area GSINIT  (CODE)
                                    299 ;--------------------------------------------------------
                                    300 ; Home
                                    301 ;--------------------------------------------------------
                                    302 	.area HOME    (CODE)
                                    303 	.area HOME    (CODE)
                                    304 ;--------------------------------------------------------
                                    305 ; code
                                    306 ;--------------------------------------------------------
                                    307 	.area CSEG    (CODE)
                                    308 ;------------------------------------------------------------
                                    309 ;Allocation info for local variables in function 'Bootstrap'
                                    310 ;------------------------------------------------------------
                                    311 ;	preemptive.c:81: void Bootstrap(void) {
                                    312 ;	-----------------------------------------
                                    313 ;	 function Bootstrap
                                    314 ;	-----------------------------------------
      0003A8                        315 _Bootstrap:
                           000007   316 	ar7 = 0x07
                           000006   317 	ar6 = 0x06
                           000005   318 	ar5 = 0x05
                           000004   319 	ar4 = 0x04
                           000003   320 	ar3 = 0x03
                           000002   321 	ar2 = 0x02
                           000001   322 	ar1 = 0x01
                           000000   323 	ar0 = 0x00
                                    324 ;	preemptive.c:82: threadMask = 0;
      0003A8 75 2A 00         [24]  325 	mov	_threadMask,#0x00
                                    326 ;	preemptive.c:83: currentThread = ThreadCreate(main);
      0003AB 90 03 19         [24]  327 	mov	dptr,#_main
      0003AE 12 04 22         [24]  328 	lcall	_ThreadCreate
      0003B1 85 82 29         [24]  329 	mov	_currentThread,dpl
                                    330 ;	preemptive.c:84: RESTORESTATE;
      0003B4 E5 29            [12]  331 	mov	a,_currentThread
      0003B6 24 25            [12]  332 	add	a, #_savedSP
      0003B8 F9               [12]  333 	mov	r1,a
      0003B9 87 81            [24]  334 	mov	_SP,@r1
      0003BB D0 D0            [24]  335 	POP PSW 
      0003BD D0 83            [24]  336 	POP DPH 
      0003BF D0 82            [24]  337 	POP DPL 
      0003C1 D0 F0            [24]  338 	POP B 
      0003C3 D0 E0            [24]  339 	POP ACC 
                                    340 ;	preemptive.c:85: }
      0003C5 22               [24]  341 	ret
                                    342 ;------------------------------------------------------------
                                    343 ;Allocation info for local variables in function 'myTimer0Handler'
                                    344 ;------------------------------------------------------------
                                    345 ;	preemptive.c:93: void myTimer0Handler(void) {
                                    346 ;	-----------------------------------------
                                    347 ;	 function myTimer0Handler
                                    348 ;	-----------------------------------------
      0003C6                        349 _myTimer0Handler:
                                    350 ;	preemptive.c:94: EA = 0; // don't do __critial
                                    351 ;	assignBit
      0003C6 C2 AF            [12]  352 	clr	_EA
                                    353 ;	preemptive.c:95: SAVESTATE;
      0003C8 C0 E0            [24]  354 	PUSH ACC 
      0003CA C0 F0            [24]  355 	PUSH B 
      0003CC C0 82            [24]  356 	PUSH DPL 
      0003CE C0 83            [24]  357 	PUSH DPH 
      0003D0 C0 D0            [24]  358 	PUSH PSW 
      0003D2 E5 29            [12]  359 	mov	a,_currentThread
      0003D4 24 25            [12]  360 	add	a, #_savedSP
      0003D6 F8               [12]  361 	mov	r0,a
      0003D7 A6 81            [24]  362 	mov	@r0,_SP
                                    363 ;	preemptive.c:115: do{
      0003D9                        364 00103$:
                                    365 ;	preemptive.c:116: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      0003D9 74 FD            [12]  366 	mov	a,#0x100 - 0x03
      0003DB 25 29            [12]  367 	add	a,_currentThread
      0003DD 40 0B            [24]  368 	jc	00108$
      0003DF AF 29            [24]  369 	mov	r7,_currentThread
      0003E1 0F               [12]  370 	inc	r7
      0003E2 EF               [12]  371 	mov	a,r7
      0003E3 FE               [12]  372 	mov	r6,a
      0003E4 33               [12]  373 	rlc	a
      0003E5 95 E0            [12]  374 	subb	a,acc
      0003E7 FF               [12]  375 	mov	r7,a
      0003E8 80 04            [24]  376 	sjmp	00109$
      0003EA                        377 00108$:
      0003EA 7E 00            [12]  378 	mov	r6,#0x00
      0003EC 7F 00            [12]  379 	mov	r7,#0x00
      0003EE                        380 00109$:
      0003EE 8E 29            [24]  381 	mov	_currentThread,r6
                                    382 ;	preemptive.c:117: temp = 1 << currentThread;
      0003F0 85 29 F0         [24]  383 	mov	b,_currentThread
      0003F3 05 F0            [12]  384 	inc	b
      0003F5 74 01            [12]  385 	mov	a,#0x01
      0003F7 80 02            [24]  386 	sjmp	00130$
      0003F9                        387 00129$:
      0003F9 25 E0            [12]  388 	add	a,acc
      0003FB                        389 00130$:
      0003FB D5 F0 FB         [24]  390 	djnz	b,00129$
      0003FE F5 2E            [12]  391 	mov	_temp,a
                                    392 ;	preemptive.c:118: if (threadMask & temp){
      000400 E5 2E            [12]  393 	mov	a,_temp
      000402 55 2A            [12]  394 	anl	a,_threadMask
      000404 60 D3            [24]  395 	jz	00103$
                                    396 ;	preemptive.c:140: TH0 = (my_time << 4);
      000406 E5 34            [12]  397 	mov	a,_my_time
      000408 C4               [12]  398 	swap	a
      000409 54 F0            [12]  399 	anl	a,#0xf0
      00040B F5 8C            [12]  400 	mov	_TH0,a
                                    401 ;	preemptive.c:141: EA = 1;
                                    402 ;	assignBit
      00040D D2 AF            [12]  403 	setb	_EA
                                    404 ;	preemptive.c:142: RESTORESTATE;
      00040F E5 29            [12]  405 	mov	a,_currentThread
      000411 24 25            [12]  406 	add	a, #_savedSP
      000413 F9               [12]  407 	mov	r1,a
      000414 87 81            [24]  408 	mov	_SP,@r1
      000416 D0 D0            [24]  409 	POP PSW 
      000418 D0 83            [24]  410 	POP DPH 
      00041A D0 82            [24]  411 	POP DPL 
      00041C D0 F0            [24]  412 	POP B 
      00041E D0 E0            [24]  413 	POP ACC 
                                    414 ;	preemptive.c:148: __endasm;
      000420 32               [24]  415 	RETI
                                    416 ;	preemptive.c:149: }
      000421 22               [24]  417 	ret
                                    418 ;------------------------------------------------------------
                                    419 ;Allocation info for local variables in function 'ThreadCreate'
                                    420 ;------------------------------------------------------------
                                    421 ;fp            Allocated to registers 
                                    422 ;------------------------------------------------------------
                                    423 ;	preemptive.c:151: ThreadID ThreadCreate(FunctionPtr fp){
                                    424 ;	-----------------------------------------
                                    425 ;	 function ThreadCreate
                                    426 ;	-----------------------------------------
      000422                        427 _ThreadCreate:
                                    428 ;	preemptive.c:157: if(threadMask == 0x0F){
      000422 74 0F            [12]  429 	mov	a,#0x0f
      000424 B5 2A 04         [24]  430 	cjne	a,_threadMask,00102$
                                    431 ;	preemptive.c:158: return -1;
      000427 75 82 FF         [24]  432 	mov	dpl, #0xff
      00042A 22               [24]  433 	ret
      00042B                        434 00102$:
                                    435 ;	preemptive.c:238: }
      00042B D2 01            [12]  436 	setb	_ThreadCreate_sloc0_1_0
      00042D 10 AF 02         [24]  437 	jbc	ea,00137$
      000430 C2 01            [12]  438 	clr	_ThreadCreate_sloc0_1_0
      000432                        439 00137$:
                                    440 ;	preemptive.c:200: for(i = 0; i != MAXTHREADS; i++){
      000432 75 2B 00         [24]  441 	mov	_i,#0x00
      000435                        442 00107$:
      000435 74 04            [12]  443 	mov	a,#0x04
      000437 B5 2B 02         [24]  444 	cjne	a,_i,00138$
      00043A 80 29            [24]  445 	sjmp	00105$
      00043C                        446 00138$:
                                    447 ;	preemptive.c:202: temp = 1;
      00043C 75 2E 01         [24]  448 	mov	_temp,#0x01
                                    449 ;	preemptive.c:203: temp <<= i;
      00043F 85 2B F0         [24]  450 	mov	b,_i
      000442 05 F0            [12]  451 	inc	b
      000444 E5 2E            [12]  452 	mov	a,_temp
      000446 80 02            [24]  453 	sjmp	00140$
      000448                        454 00139$:
      000448 25 E0            [12]  455 	add	a,acc
      00044A                        456 00140$:
      00044A D5 F0 FB         [24]  457 	djnz	b,00139$
      00044D F5 2E            [12]  458 	mov	_temp,a
                                    459 ;	preemptive.c:204: if(!(threadMask & temp)){
      00044F E5 2E            [12]  460 	mov	a,_temp
      000451 55 2A            [12]  461 	anl	a,_threadMask
      000453 70 09            [24]  462 	jnz	00108$
                                    463 ;	preemptive.c:206: threadMask |= temp;
      000455 E5 2E            [12]  464 	mov	a,_temp
      000457 42 2A            [12]  465 	orl	_threadMask,a
                                    466 ;	preemptive.c:207: newThread = i;
      000459 85 2B 2D         [24]  467 	mov	_newThread,_i
                                    468 ;	preemptive.c:208: break;
      00045C 80 07            [24]  469 	sjmp	00105$
      00045E                        470 00108$:
                                    471 ;	preemptive.c:200: for(i = 0; i != MAXTHREADS; i++){
      00045E E5 2B            [12]  472 	mov	a,_i
      000460 04               [12]  473 	inc	a
      000461 F5 2B            [12]  474 	mov	_i,a
      000463 80 D0            [24]  475 	sjmp	00107$
      000465                        476 00105$:
                                    477 ;	preemptive.c:212: tempSP = SP;
      000465 85 81 2C         [24]  478 	mov	_tempSP,_SP
                                    479 ;	preemptive.c:215: SP = (0x3F) + newThread * (0x10);
      000468 E5 2D            [12]  480 	mov	a,_newThread
      00046A C4               [12]  481 	swap	a
      00046B 54 F0            [12]  482 	anl	a,#0xf0
      00046D FF               [12]  483 	mov	r7,a
      00046E 24 3F            [12]  484 	add	a,#0x3f
      000470 F5 81            [12]  485 	mov	_SP,a
                                    486 ;	preemptive.c:220: __endasm;
      000472 C0 82            [24]  487 	PUSH	DPL
      000474 C0 83            [24]  488 	PUSH	DPH
                                    489 ;	preemptive.c:228: __endasm;
      000476 54 00            [12]  490 	ANL	A, #0
      000478 C0 E0            [24]  491 	PUSH	ACC
      00047A C0 E0            [24]  492 	PUSH	ACC
      00047C C0 E0            [24]  493 	PUSH	ACC
      00047E C0 E0            [24]  494 	PUSH	ACC
                                    495 ;	preemptive.c:230: PSW = (newThread << 3);
      000480 E5 2D            [12]  496 	mov	a,_newThread
      000482 C4               [12]  497 	swap	a
      000483 03               [12]  498 	rr	a
      000484 54 F8            [12]  499 	anl	a,#0xf8
      000486 F5 D0            [12]  500 	mov	_PSW,a
                                    501 ;	preemptive.c:233: __endasm;
      000488 C0 D0            [24]  502 	PUSH	PSW
                                    503 ;	preemptive.c:235: savedSP[newThread] = SP;
      00048A E5 2D            [12]  504 	mov	a,_newThread
      00048C 24 25            [12]  505 	add	a, #_savedSP
      00048E F8               [12]  506 	mov	r0,a
      00048F A6 81            [24]  507 	mov	@r0,_SP
                                    508 ;	preemptive.c:237: SP = tempSP;
      000491 85 2C 81         [24]  509 	mov	_SP,_tempSP
      000494 A2 01            [12]  510 	mov	c,_ThreadCreate_sloc0_1_0
      000496 92 AF            [24]  511 	mov	ea,c
                                    512 ;	preemptive.c:240: return newThread;
      000498 85 2D 82         [24]  513 	mov	dpl, _newThread
                                    514 ;	preemptive.c:241: }
      00049B 22               [24]  515 	ret
                                    516 ;------------------------------------------------------------
                                    517 ;Allocation info for local variables in function 'ThreadYield'
                                    518 ;------------------------------------------------------------
                                    519 ;	preemptive.c:250: void ThreadYield(void){
                                    520 ;	-----------------------------------------
                                    521 ;	 function ThreadYield
                                    522 ;	-----------------------------------------
      00049C                        523 _ThreadYield:
                                    524 ;	preemptive.c:251: EA = 0;
                                    525 ;	assignBit
      00049C C2 AF            [12]  526 	clr	_EA
                                    527 ;	preemptive.c:252: SAVESTATE;
      00049E C0 E0            [24]  528 	PUSH ACC 
      0004A0 C0 F0            [24]  529 	PUSH B 
      0004A2 C0 82            [24]  530 	PUSH DPL 
      0004A4 C0 83            [24]  531 	PUSH DPH 
      0004A6 C0 D0            [24]  532 	PUSH PSW 
      0004A8 E5 29            [12]  533 	mov	a,_currentThread
      0004AA 24 25            [12]  534 	add	a, #_savedSP
      0004AC F8               [12]  535 	mov	r0,a
      0004AD A6 81            [24]  536 	mov	@r0,_SP
                                    537 ;	preemptive.c:271: do{
      0004AF                        538 00103$:
                                    539 ;	preemptive.c:282: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      0004AF 74 FD            [12]  540 	mov	a,#0x100 - 0x03
      0004B1 25 29            [12]  541 	add	a,_currentThread
      0004B3 40 0B            [24]  542 	jc	00108$
      0004B5 AF 29            [24]  543 	mov	r7,_currentThread
      0004B7 0F               [12]  544 	inc	r7
      0004B8 EF               [12]  545 	mov	a,r7
      0004B9 FE               [12]  546 	mov	r6,a
      0004BA 33               [12]  547 	rlc	a
      0004BB 95 E0            [12]  548 	subb	a,acc
      0004BD FF               [12]  549 	mov	r7,a
      0004BE 80 04            [24]  550 	sjmp	00109$
      0004C0                        551 00108$:
      0004C0 7E 00            [12]  552 	mov	r6,#0x00
      0004C2 7F 00            [12]  553 	mov	r7,#0x00
      0004C4                        554 00109$:
      0004C4 8E 29            [24]  555 	mov	_currentThread,r6
                                    556 ;	preemptive.c:283: temp = 1 << currentThread;
      0004C6 85 29 F0         [24]  557 	mov	b,_currentThread
      0004C9 05 F0            [12]  558 	inc	b
      0004CB 74 01            [12]  559 	mov	a,#0x01
      0004CD 80 02            [24]  560 	sjmp	00130$
      0004CF                        561 00129$:
      0004CF 25 E0            [12]  562 	add	a,acc
      0004D1                        563 00130$:
      0004D1 D5 F0 FB         [24]  564 	djnz	b,00129$
      0004D4 F5 2E            [12]  565 	mov	_temp,a
                                    566 ;	preemptive.c:284: if (threadMask & temp){
      0004D6 E5 2E            [12]  567 	mov	a,_temp
      0004D8 55 2A            [12]  568 	anl	a,_threadMask
      0004DA 60 D3            [24]  569 	jz	00103$
                                    570 ;	preemptive.c:307: TH0 = (my_time << 4);
      0004DC E5 34            [12]  571 	mov	a,_my_time
      0004DE C4               [12]  572 	swap	a
      0004DF 54 F0            [12]  573 	anl	a,#0xf0
      0004E1 F5 8C            [12]  574 	mov	_TH0,a
                                    575 ;	preemptive.c:308: EA = 1;
                                    576 ;	assignBit
      0004E3 D2 AF            [12]  577 	setb	_EA
                                    578 ;	preemptive.c:309: RESTORESTATE;
      0004E5 E5 29            [12]  579 	mov	a,_currentThread
      0004E7 24 25            [12]  580 	add	a, #_savedSP
      0004E9 F9               [12]  581 	mov	r1,a
      0004EA 87 81            [24]  582 	mov	_SP,@r1
      0004EC D0 D0            [24]  583 	POP PSW 
      0004EE D0 83            [24]  584 	POP DPH 
      0004F0 D0 82            [24]  585 	POP DPL 
      0004F2 D0 F0            [24]  586 	POP B 
      0004F4 D0 E0            [24]  587 	POP ACC 
                                    588 ;	preemptive.c:310: }
      0004F6 22               [24]  589 	ret
                                    590 ;------------------------------------------------------------
                                    591 ;Allocation info for local variables in function 'ThreadExit'
                                    592 ;------------------------------------------------------------
                                    593 ;	preemptive.c:316: void ThreadExit(void)
                                    594 ;	-----------------------------------------
                                    595 ;	 function ThreadExit
                                    596 ;	-----------------------------------------
      0004F7                        597 _ThreadExit:
                                    598 ;	preemptive.c:337: }
      0004F7 D2 02            [12]  599 	setb	_ThreadExit_sloc0_1_0
      0004F9 10 AF 02         [24]  600 	jbc	ea,00135$
      0004FC C2 02            [12]  601 	clr	_ThreadExit_sloc0_1_0
      0004FE                        602 00135$:
                                    603 ;	preemptive.c:325: threadMask ^= (1 << currentThread);
      0004FE 85 29 F0         [24]  604 	mov	b,_currentThread
      000501 05 F0            [12]  605 	inc	b
      000503 74 01            [12]  606 	mov	a,#0x01
      000505 80 02            [24]  607 	sjmp	00137$
      000507                        608 00136$:
      000507 25 E0            [12]  609 	add	a,acc
      000509                        610 00137$:
      000509 D5 F0 FB         [24]  611 	djnz	b,00136$
      00050C FF               [12]  612 	mov	r7,a
      00050D 62 2A            [12]  613 	xrl	_threadMask,a
                                    614 ;	preemptive.c:326: for(i = 0; i < MAXTHREADS; i++){
      00050F 75 2B 00         [24]  615 	mov	_i,#0x00
      000512                        616 00107$:
      000512 74 FC            [12]  617 	mov	a,#0x100 - 0x04
      000514 25 2B            [12]  618 	add	a,_i
      000516 40 2E            [24]  619 	jc	00103$
                                    620 ;	preemptive.c:327: if(threadMask & (1 << i)){
      000518 85 2B F0         [24]  621 	mov	b,_i
      00051B 05 F0            [12]  622 	inc	b
      00051D 7E 01            [12]  623 	mov	r6,#0x01
      00051F 7F 00            [12]  624 	mov	r7,#0x00
      000521 80 06            [24]  625 	sjmp	00140$
      000523                        626 00139$:
      000523 EE               [12]  627 	mov	a,r6
      000524 2E               [12]  628 	add	a,r6
      000525 FE               [12]  629 	mov	r6,a
      000526 EF               [12]  630 	mov	a,r7
      000527 33               [12]  631 	rlc	a
      000528 FF               [12]  632 	mov	r7,a
      000529                        633 00140$:
      000529 D5 F0 F7         [24]  634 	djnz	b,00139$
      00052C AC 2A            [24]  635 	mov	r4,_threadMask
      00052E 7D 00            [12]  636 	mov	r5,#0x00
      000530 EC               [12]  637 	mov	a,r4
      000531 52 06            [12]  638 	anl	ar6,a
      000533 ED               [12]  639 	mov	a,r5
      000534 52 07            [12]  640 	anl	ar7,a
      000536 EE               [12]  641 	mov	a,r6
      000537 4F               [12]  642 	orl	a,r7
      000538 60 05            [24]  643 	jz	00108$
                                    644 ;	preemptive.c:328: currentThread = i;
      00053A 85 2B 29         [24]  645 	mov	_currentThread,_i
                                    646 ;	preemptive.c:329: break;
      00053D 80 07            [24]  647 	sjmp	00103$
      00053F                        648 00108$:
                                    649 ;	preemptive.c:326: for(i = 0; i < MAXTHREADS; i++){
      00053F E5 2B            [12]  650 	mov	a,_i
      000541 04               [12]  651 	inc	a
      000542 F5 2B            [12]  652 	mov	_i,a
      000544 80 CC            [24]  653 	sjmp	00107$
      000546                        654 00103$:
                                    655 ;	preemptive.c:332: if (i == MAXTHREADS){
      000546 74 04            [12]  656 	mov	a,#0x04
      000548 B5 2B 03         [24]  657 	cjne	a,_i,00105$
                                    658 ;	preemptive.c:333: currentThread = -1;
      00054B 75 29 FF         [24]  659 	mov	_currentThread,#0xff
      00054E                        660 00105$:
                                    661 ;	preemptive.c:335: RESTORESTATE;
      00054E E5 29            [12]  662 	mov	a,_currentThread
      000550 24 25            [12]  663 	add	a, #_savedSP
      000552 F9               [12]  664 	mov	r1,a
      000553 87 81            [24]  665 	mov	_SP,@r1
      000555 D0 D0            [24]  666 	POP PSW 
      000557 D0 83            [24]  667 	POP DPH 
      000559 D0 82            [24]  668 	POP DPL 
      00055B D0 F0            [24]  669 	POP B 
      00055D D0 E0            [24]  670 	POP ACC 
                                    671 ;	preemptive.c:336: EA = 1;
                                    672 ;	assignBit
      00055F D2 AF            [12]  673 	setb	_EA
      000561 A2 02            [12]  674 	mov	c,_ThreadExit_sloc0_1_0
      000563 92 AF            [24]  675 	mov	ea,c
                                    676 ;	preemptive.c:338: }
      000565 22               [24]  677 	ret
                                    678 ;------------------------------------------------------------
                                    679 ;Allocation info for local variables in function 'ThreadReset'
                                    680 ;------------------------------------------------------------
                                    681 ;	preemptive.c:340: void ThreadReset(void){
                                    682 ;	-----------------------------------------
                                    683 ;	 function ThreadReset
                                    684 ;	-----------------------------------------
      000566                        685 _ThreadReset:
                                    686 ;	preemptive.c:341: threadMask = 1;
      000566 75 2A 01         [24]  687 	mov	_threadMask,#0x01
                                    688 ;	preemptive.c:342: }
      000569 22               [24]  689 	ret
                                    690 	.area CSEG    (CODE)
                                    691 	.area CONST   (CODE)
                                    692 	.area XINIT   (CODE)
                                    693 	.area CABS    (ABS,CODE)
