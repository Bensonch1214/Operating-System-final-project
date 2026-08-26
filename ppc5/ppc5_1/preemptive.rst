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
                                    110 	.globl _clockwise
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
                                    121 ;--------------------------------------------------------
                                    122 ; special function registers
                                    123 ;--------------------------------------------------------
                                    124 	.area RSEG    (ABS,DATA)
      000000                        125 	.org 0x0000
                           000080   126 _P0	=	0x0080
                           000081   127 _SP	=	0x0081
                           000082   128 _DPL	=	0x0082
                           000083   129 _DPH	=	0x0083
                           000087   130 _PCON	=	0x0087
                           000088   131 _TCON	=	0x0088
                           000089   132 _TMOD	=	0x0089
                           00008A   133 _TL0	=	0x008a
                           00008B   134 _TL1	=	0x008b
                           00008C   135 _TH0	=	0x008c
                           00008D   136 _TH1	=	0x008d
                           000090   137 _P1	=	0x0090
                           000098   138 _SCON	=	0x0098
                           000099   139 _SBUF	=	0x0099
                           0000A0   140 _P2	=	0x00a0
                           0000A8   141 _IE	=	0x00a8
                           0000B0   142 _P3	=	0x00b0
                           0000B8   143 _IP	=	0x00b8
                           0000D0   144 _PSW	=	0x00d0
                           0000E0   145 _ACC	=	0x00e0
                           0000F0   146 _B	=	0x00f0
                                    147 ;--------------------------------------------------------
                                    148 ; special function bits
                                    149 ;--------------------------------------------------------
                                    150 	.area RSEG    (ABS,DATA)
      000000                        151 	.org 0x0000
                           000080   152 _P0_0	=	0x0080
                           000081   153 _P0_1	=	0x0081
                           000082   154 _P0_2	=	0x0082
                           000083   155 _P0_3	=	0x0083
                           000084   156 _P0_4	=	0x0084
                           000085   157 _P0_5	=	0x0085
                           000086   158 _P0_6	=	0x0086
                           000087   159 _P0_7	=	0x0087
                           000088   160 _IT0	=	0x0088
                           000089   161 _IE0	=	0x0089
                           00008A   162 _IT1	=	0x008a
                           00008B   163 _IE1	=	0x008b
                           00008C   164 _TR0	=	0x008c
                           00008D   165 _TF0	=	0x008d
                           00008E   166 _TR1	=	0x008e
                           00008F   167 _TF1	=	0x008f
                           000090   168 _P1_0	=	0x0090
                           000091   169 _P1_1	=	0x0091
                           000092   170 _P1_2	=	0x0092
                           000093   171 _P1_3	=	0x0093
                           000094   172 _P1_4	=	0x0094
                           000095   173 _P1_5	=	0x0095
                           000096   174 _P1_6	=	0x0096
                           000097   175 _P1_7	=	0x0097
                           000098   176 _RI	=	0x0098
                           000099   177 _TI	=	0x0099
                           00009A   178 _RB8	=	0x009a
                           00009B   179 _TB8	=	0x009b
                           00009C   180 _REN	=	0x009c
                           00009D   181 _SM2	=	0x009d
                           00009E   182 _SM1	=	0x009e
                           00009F   183 _SM0	=	0x009f
                           0000A0   184 _P2_0	=	0x00a0
                           0000A1   185 _P2_1	=	0x00a1
                           0000A2   186 _P2_2	=	0x00a2
                           0000A3   187 _P2_3	=	0x00a3
                           0000A4   188 _P2_4	=	0x00a4
                           0000A5   189 _P2_5	=	0x00a5
                           0000A6   190 _P2_6	=	0x00a6
                           0000A7   191 _P2_7	=	0x00a7
                           0000A8   192 _EX0	=	0x00a8
                           0000A9   193 _ET0	=	0x00a9
                           0000AA   194 _EX1	=	0x00aa
                           0000AB   195 _ET1	=	0x00ab
                           0000AC   196 _ES	=	0x00ac
                           0000AF   197 _EA	=	0x00af
                           0000B0   198 _P3_0	=	0x00b0
                           0000B1   199 _P3_1	=	0x00b1
                           0000B2   200 _P3_2	=	0x00b2
                           0000B3   201 _P3_3	=	0x00b3
                           0000B4   202 _P3_4	=	0x00b4
                           0000B5   203 _P3_5	=	0x00b5
                           0000B6   204 _P3_6	=	0x00b6
                           0000B7   205 _P3_7	=	0x00b7
                           0000B0   206 _RXD	=	0x00b0
                           0000B1   207 _TXD	=	0x00b1
                           0000B2   208 _INT0	=	0x00b2
                           0000B3   209 _INT1	=	0x00b3
                           0000B4   210 _T0	=	0x00b4
                           0000B5   211 _T1	=	0x00b5
                           0000B6   212 _WR	=	0x00b6
                           0000B7   213 _RD	=	0x00b7
                           0000B8   214 _PX0	=	0x00b8
                           0000B9   215 _PT0	=	0x00b9
                           0000BA   216 _PX1	=	0x00ba
                           0000BB   217 _PT1	=	0x00bb
                           0000BC   218 _PS	=	0x00bc
                           0000D0   219 _P	=	0x00d0
                           0000D1   220 _F1	=	0x00d1
                           0000D2   221 _OV	=	0x00d2
                           0000D3   222 _RS0	=	0x00d3
                           0000D4   223 _RS1	=	0x00d4
                           0000D5   224 _F0	=	0x00d5
                           0000D6   225 _AC	=	0x00d6
                           0000D7   226 _CY	=	0x00d7
                                    227 ;--------------------------------------------------------
                                    228 ; overlayable register banks
                                    229 ;--------------------------------------------------------
                                    230 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        231 	.ds 8
                                    232 ;--------------------------------------------------------
                                    233 ; internal ram data
                                    234 ;--------------------------------------------------------
                                    235 	.area DSEG    (DATA)
                           000025   236 _savedSP	=	0x0025
                           000029   237 _currentThread	=	0x0029
                           00002A   238 _threadMask	=	0x002a
                           00002B   239 _i	=	0x002b
                           00002C   240 _tempSP	=	0x002c
                           00002D   241 _newThread	=	0x002d
                           00002E   242 _temp	=	0x002e
                           00002F   243 _clockwise	=	0x002f
                                    244 ;--------------------------------------------------------
                                    245 ; overlayable items in internal ram
                                    246 ;--------------------------------------------------------
                                    247 	.area	OSEG    (OVR,DATA)
                                    248 ;--------------------------------------------------------
                                    249 ; indirectly addressable internal ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area ISEG    (DATA)
                                    252 ;--------------------------------------------------------
                                    253 ; absolute internal ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area IABS    (ABS,DATA)
                                    256 	.area IABS    (ABS,DATA)
                                    257 ;--------------------------------------------------------
                                    258 ; bit data
                                    259 ;--------------------------------------------------------
                                    260 	.area BSEG    (BIT)
      000002                        261 _myTimer0Handler_sloc0_1_0:
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
                                    308 ;	preemptive.c:62: void Bootstrap(void) {
                                    309 ;	-----------------------------------------
                                    310 ;	 function Bootstrap
                                    311 ;	-----------------------------------------
      000199                        312 _Bootstrap:
                           000007   313 	ar7 = 0x07
                           000006   314 	ar6 = 0x06
                           000005   315 	ar5 = 0x05
                           000004   316 	ar4 = 0x04
                           000003   317 	ar3 = 0x03
                           000002   318 	ar2 = 0x02
                           000001   319 	ar1 = 0x01
                           000000   320 	ar0 = 0x00
                                    321 ;	preemptive.c:63: threadMask = 0;
      000199 75 2A 00         [24]  322 	mov	_threadMask,#0x00
                                    323 ;	preemptive.c:64: clockwise = 1;
      00019C 75 2F 01         [24]  324 	mov	_clockwise,#0x01
                                    325 ;	preemptive.c:65: TMOD = 0; // timer 0 mode 0
      00019F 75 89 00         [24]  326 	mov	_TMOD,#0x00
                                    327 ;	preemptive.c:68: IE = 0x82; // enable timer 0 interrupt,
      0001A2 75 A8 82         [24]  328 	mov	_IE,#0x82
                                    329 ;	preemptive.c:69: TR0 = 1; // start running timer0
                                    330 ;	assignBit
      0001A5 D2 8C            [12]  331 	setb	_TR0
                                    332 ;	preemptive.c:70: currentThread = ThreadCreate(main);
      0001A7 90 01 6B         [24]  333 	mov	dptr,#_main
      0001AA 12 02 4B         [24]  334 	lcall	_ThreadCreate
      0001AD 85 82 29         [24]  335 	mov	_currentThread,dpl
                                    336 ;	preemptive.c:71: RESTORESTATE;
      0001B0 E5 29            [12]  337 	mov	a,_currentThread
      0001B2 24 25            [12]  338 	add	a, #_savedSP
      0001B4 F9               [12]  339 	mov	r1,a
      0001B5 87 81            [24]  340 	mov	_SP,@r1
      0001B7 D0 D0            [24]  341 	POP PSW 
      0001B9 D0 83            [24]  342 	POP DPH 
      0001BB D0 82            [24]  343 	POP DPL 
      0001BD D0 F0            [24]  344 	POP B 
      0001BF D0 E0            [24]  345 	POP ACC 
                                    346 ;	preemptive.c:72: }
      0001C1 22               [24]  347 	ret
                                    348 ;------------------------------------------------------------
                                    349 ;Allocation info for local variables in function 'myTimer0Handler'
                                    350 ;------------------------------------------------------------
                                    351 ;	preemptive.c:80: void myTimer0Handler(void) {
                                    352 ;	-----------------------------------------
                                    353 ;	 function myTimer0Handler
                                    354 ;	-----------------------------------------
      0001C2                        355 _myTimer0Handler:
                                    356 ;	preemptive.c:81: EA = 0; // don't do __critial
                                    357 ;	assignBit
      0001C2 C2 AF            [12]  358 	clr	_EA
                                    359 ;	preemptive.c:82: SAVESTATE;
      0001C4 C0 E0            [24]  360 	PUSH ACC 
      0001C6 C0 F0            [24]  361 	PUSH B 
      0001C8 C0 82            [24]  362 	PUSH DPL 
      0001CA C0 83            [24]  363 	PUSH DPH 
      0001CC C0 D0            [24]  364 	PUSH PSW 
      0001CE E5 29            [12]  365 	mov	a,_currentThread
      0001D0 24 25            [12]  366 	add	a, #_savedSP
      0001D2 F8               [12]  367 	mov	r0,a
      0001D3 A6 81            [24]  368 	mov	@r0,_SP
                                    369 ;	preemptive.c:83: do{
      0001D5                        370 00106$:
                                    371 ;	preemptive.c:84: if(clockwise){
      0001D5 E5 2F            [12]  372 	mov	a,_clockwise
      0001D7 60 28            [24]  373 	jz	00102$
                                    374 ;	preemptive.c:85: clockwise = !(currentThread == 3);
      0001D9 74 03            [12]  375 	mov	a,#0x03
      0001DB B5 29 03         [24]  376 	cjne	a,_currentThread,00146$
      0001DE D3               [12]  377 	setb	c
      0001DF 80 01            [24]  378 	sjmp	00147$
      0001E1                        379 00146$:
      0001E1 C3               [12]  380 	clr	c
      0001E2                        381 00147$:
      0001E2 B3               [12]  382 	cpl	c
      0001E3 92 02            [24]  383 	mov	_myTimer0Handler_sloc0_1_0,c
      0001E5 E4               [12]  384 	clr	a
      0001E6 33               [12]  385 	rlc	a
      0001E7 F5 2F            [12]  386 	mov	_clockwise,a
                                    387 ;	preemptive.c:86: currentThread = (currentThread == 3) ? 2 : currentThread + 1;
      0001E9 74 03            [12]  388 	mov	a,#0x03
      0001EB B5 29 06         [24]  389 	cjne	a,_currentThread,00111$
      0001EE 7E 02            [12]  390 	mov	r6,#0x02
      0001F0 7F 00            [12]  391 	mov	r7,#0x00
      0001F2 80 09            [24]  392 	sjmp	00112$
      0001F4                        393 00111$:
      0001F4 AD 29            [24]  394 	mov	r5,_currentThread
      0001F6 0D               [12]  395 	inc	r5
      0001F7 ED               [12]  396 	mov	a,r5
      0001F8 FE               [12]  397 	mov	r6,a
      0001F9 33               [12]  398 	rlc	a
      0001FA 95 E0            [12]  399 	subb	a,acc
      0001FC FF               [12]  400 	mov	r7,a
      0001FD                        401 00112$:
      0001FD 8E 29            [24]  402 	mov	_currentThread,r6
      0001FF 80 1F            [24]  403 	sjmp	00103$
      000201                        404 00102$:
                                    405 ;	preemptive.c:89: clockwise = (currentThread == 0);
      000201 E4               [12]  406 	clr	a
      000202 B5 29 04         [24]  407 	cjne	a,_currentThread,00150$
      000205 74 01            [12]  408 	mov	a,#0x01
      000207 80 01            [24]  409 	sjmp	00151$
      000209                        410 00150$:
      000209 E4               [12]  411 	clr	a
      00020A                        412 00151$:
      00020A F5 2F            [12]  413 	mov	_clockwise,a
                                    414 ;	preemptive.c:90: currentThread = (currentThread == 0) ? 1 : currentThread - 1;
      00020C E5 29            [12]  415 	mov	a,_currentThread
      00020E 70 05            [24]  416 	jnz	00113$
      000210 7E 01            [12]  417 	mov	r6,#0x01
      000212 FF               [12]  418 	mov	r7,a
      000213 80 09            [24]  419 	sjmp	00114$
      000215                        420 00113$:
      000215 AD 29            [24]  421 	mov	r5,_currentThread
      000217 1D               [12]  422 	dec	r5
      000218 ED               [12]  423 	mov	a,r5
      000219 FE               [12]  424 	mov	r6,a
      00021A 33               [12]  425 	rlc	a
      00021B 95 E0            [12]  426 	subb	a,acc
      00021D FF               [12]  427 	mov	r7,a
      00021E                        428 00114$:
      00021E 8E 29            [24]  429 	mov	_currentThread,r6
      000220                        430 00103$:
                                    431 ;	preemptive.c:92: temp = 1 << currentThread;
      000220 85 29 F0         [24]  432 	mov	b,_currentThread
      000223 05 F0            [12]  433 	inc	b
      000225 74 01            [12]  434 	mov	a,#0x01
      000227 80 02            [24]  435 	sjmp	00154$
      000229                        436 00153$:
      000229 25 E0            [12]  437 	add	a,acc
      00022B                        438 00154$:
      00022B D5 F0 FB         [24]  439 	djnz	b,00153$
      00022E F5 2E            [12]  440 	mov	_temp,a
                                    441 ;	preemptive.c:93: if (threadMask & temp){
      000230 E5 2E            [12]  442 	mov	a,_temp
      000232 55 2A            [12]  443 	anl	a,_threadMask
      000234 60 9F            [24]  444 	jz	00106$
                                    445 ;	preemptive.c:97: RESTORESTATE;
      000236 E5 29            [12]  446 	mov	a,_currentThread
      000238 24 25            [12]  447 	add	a, #_savedSP
      00023A F9               [12]  448 	mov	r1,a
      00023B 87 81            [24]  449 	mov	_SP,@r1
      00023D D0 D0            [24]  450 	POP PSW 
      00023F D0 83            [24]  451 	POP DPH 
      000241 D0 82            [24]  452 	POP DPL 
      000243 D0 F0            [24]  453 	POP B 
      000245 D0 E0            [24]  454 	POP ACC 
                                    455 ;	preemptive.c:100: EA = 1;
                                    456 ;	assignBit
      000247 D2 AF            [12]  457 	setb	_EA
                                    458 ;	preemptive.c:103: __endasm;
      000249 32               [24]  459 	RETI
                                    460 ;	preemptive.c:104: }
      00024A 22               [24]  461 	ret
                                    462 ;------------------------------------------------------------
                                    463 ;Allocation info for local variables in function 'ThreadCreate'
                                    464 ;------------------------------------------------------------
                                    465 ;fp            Allocated to registers 
                                    466 ;------------------------------------------------------------
                                    467 ;	preemptive.c:106: ThreadID ThreadCreate(FunctionPtr fp){
                                    468 ;	-----------------------------------------
                                    469 ;	 function ThreadCreate
                                    470 ;	-----------------------------------------
      00024B                        471 _ThreadCreate:
                                    472 ;	preemptive.c:107: EA = 0;
                                    473 ;	assignBit
      00024B C2 AF            [12]  474 	clr	_EA
                                    475 ;	preemptive.c:108: if(threadMask == 0x0F){
      00024D 74 0F            [12]  476 	mov	a,#0x0f
      00024F B5 2A 04         [24]  477 	cjne	a,_threadMask,00102$
                                    478 ;	preemptive.c:109: return -1;
      000252 75 82 FF         [24]  479 	mov	dpl, #0xff
      000255 22               [24]  480 	ret
      000256                        481 00102$:
                                    482 ;	preemptive.c:111: for(i = 0; i != MAXTHREADS; i++){
      000256 75 2B 00         [24]  483 	mov	_i,#0x00
      000259                        484 00107$:
      000259 74 04            [12]  485 	mov	a,#0x04
      00025B B5 2B 02         [24]  486 	cjne	a,_i,00137$
      00025E 80 29            [24]  487 	sjmp	00105$
      000260                        488 00137$:
                                    489 ;	preemptive.c:113: temp = 1;
      000260 75 2E 01         [24]  490 	mov	_temp,#0x01
                                    491 ;	preemptive.c:114: temp <<= i;
      000263 85 2B F0         [24]  492 	mov	b,_i
      000266 05 F0            [12]  493 	inc	b
      000268 E5 2E            [12]  494 	mov	a,_temp
      00026A 80 02            [24]  495 	sjmp	00139$
      00026C                        496 00138$:
      00026C 25 E0            [12]  497 	add	a,acc
      00026E                        498 00139$:
      00026E D5 F0 FB         [24]  499 	djnz	b,00138$
      000271 F5 2E            [12]  500 	mov	_temp,a
                                    501 ;	preemptive.c:115: if(!(threadMask & temp)){
      000273 E5 2E            [12]  502 	mov	a,_temp
      000275 55 2A            [12]  503 	anl	a,_threadMask
      000277 70 09            [24]  504 	jnz	00108$
                                    505 ;	preemptive.c:117: threadMask |= temp;
      000279 E5 2E            [12]  506 	mov	a,_temp
      00027B 42 2A            [12]  507 	orl	_threadMask,a
                                    508 ;	preemptive.c:118: newThread = i;
      00027D 85 2B 2D         [24]  509 	mov	_newThread,_i
                                    510 ;	preemptive.c:119: break;
      000280 80 07            [24]  511 	sjmp	00105$
      000282                        512 00108$:
                                    513 ;	preemptive.c:111: for(i = 0; i != MAXTHREADS; i++){
      000282 E5 2B            [12]  514 	mov	a,_i
      000284 04               [12]  515 	inc	a
      000285 F5 2B            [12]  516 	mov	_i,a
      000287 80 D0            [24]  517 	sjmp	00107$
      000289                        518 00105$:
                                    519 ;	preemptive.c:123: tempSP = SP;
      000289 85 81 2C         [24]  520 	mov	_tempSP,_SP
                                    521 ;	preemptive.c:126: SP = (0x3F) + newThread * (0x10);
      00028C E5 2D            [12]  522 	mov	a,_newThread
      00028E C4               [12]  523 	swap	a
      00028F 54 F0            [12]  524 	anl	a,#0xf0
      000291 FF               [12]  525 	mov	r7,a
      000292 24 3F            [12]  526 	add	a,#0x3f
      000294 F5 81            [12]  527 	mov	_SP,a
                                    528 ;	preemptive.c:131: __endasm;
      000296 C0 82            [24]  529 	PUSH	DPL
      000298 C0 83            [24]  530 	PUSH	DPH
                                    531 ;	preemptive.c:139: __endasm;
      00029A 54 00            [12]  532 	ANL	A, #0
      00029C C0 E0            [24]  533 	PUSH	ACC
      00029E C0 E0            [24]  534 	PUSH	ACC
      0002A0 C0 E0            [24]  535 	PUSH	ACC
      0002A2 C0 E0            [24]  536 	PUSH	ACC
                                    537 ;	preemptive.c:141: PSW = (newThread << 3);
      0002A4 E5 2D            [12]  538 	mov	a,_newThread
      0002A6 C4               [12]  539 	swap	a
      0002A7 03               [12]  540 	rr	a
      0002A8 54 F8            [12]  541 	anl	a,#0xf8
      0002AA F5 D0            [12]  542 	mov	_PSW,a
                                    543 ;	preemptive.c:144: __endasm;
      0002AC C0 D0            [24]  544 	PUSH	PSW
                                    545 ;	preemptive.c:146: savedSP[newThread] = SP;
      0002AE E5 2D            [12]  546 	mov	a,_newThread
      0002B0 24 25            [12]  547 	add	a, #_savedSP
      0002B2 F8               [12]  548 	mov	r0,a
      0002B3 A6 81            [24]  549 	mov	@r0,_SP
                                    550 ;	preemptive.c:147: SP = tempSP;
      0002B5 85 2C 81         [24]  551 	mov	_SP,_tempSP
                                    552 ;	preemptive.c:148: EA = 1;
                                    553 ;	assignBit
      0002B8 D2 AF            [12]  554 	setb	_EA
                                    555 ;	preemptive.c:149: return newThread;
      0002BA 85 2D 82         [24]  556 	mov	dpl, _newThread
                                    557 ;	preemptive.c:150: }
      0002BD 22               [24]  558 	ret
                                    559 ;------------------------------------------------------------
                                    560 ;Allocation info for local variables in function 'ThreadYield'
                                    561 ;------------------------------------------------------------
                                    562 ;	preemptive.c:159: void ThreadYield(void){
                                    563 ;	-----------------------------------------
                                    564 ;	 function ThreadYield
                                    565 ;	-----------------------------------------
      0002BE                        566 _ThreadYield:
                                    567 ;	preemptive.c:160: EA = 0;
                                    568 ;	assignBit
      0002BE C2 AF            [12]  569 	clr	_EA
                                    570 ;	preemptive.c:161: SAVESTATE;
      0002C0 C0 E0            [24]  571 	PUSH ACC 
      0002C2 C0 F0            [24]  572 	PUSH B 
      0002C4 C0 82            [24]  573 	PUSH DPL 
      0002C6 C0 83            [24]  574 	PUSH DPH 
      0002C8 C0 D0            [24]  575 	PUSH PSW 
      0002CA E5 29            [12]  576 	mov	a,_currentThread
      0002CC 24 25            [12]  577 	add	a, #_savedSP
      0002CE F8               [12]  578 	mov	r0,a
      0002CF A6 81            [24]  579 	mov	@r0,_SP
                                    580 ;	preemptive.c:162: do{
      0002D1                        581 00103$:
                                    582 ;	preemptive.c:163: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      0002D1 74 FD            [12]  583 	mov	a,#0x100 - 0x03
      0002D3 25 29            [12]  584 	add	a,_currentThread
      0002D5 40 0B            [24]  585 	jc	00108$
      0002D7 AF 29            [24]  586 	mov	r7,_currentThread
      0002D9 0F               [12]  587 	inc	r7
      0002DA EF               [12]  588 	mov	a,r7
      0002DB FE               [12]  589 	mov	r6,a
      0002DC 33               [12]  590 	rlc	a
      0002DD 95 E0            [12]  591 	subb	a,acc
      0002DF FF               [12]  592 	mov	r7,a
      0002E0 80 04            [24]  593 	sjmp	00109$
      0002E2                        594 00108$:
      0002E2 7E 00            [12]  595 	mov	r6,#0x00
      0002E4 7F 00            [12]  596 	mov	r7,#0x00
      0002E6                        597 00109$:
      0002E6 8E 29            [24]  598 	mov	_currentThread,r6
                                    599 ;	preemptive.c:164: temp = 1 << currentThread;
      0002E8 85 29 F0         [24]  600 	mov	b,_currentThread
      0002EB 05 F0            [12]  601 	inc	b
      0002ED 74 01            [12]  602 	mov	a,#0x01
      0002EF 80 02            [24]  603 	sjmp	00130$
      0002F1                        604 00129$:
      0002F1 25 E0            [12]  605 	add	a,acc
      0002F3                        606 00130$:
      0002F3 D5 F0 FB         [24]  607 	djnz	b,00129$
      0002F6 F5 2E            [12]  608 	mov	_temp,a
                                    609 ;	preemptive.c:165: if (threadMask & temp){
      0002F8 E5 2E            [12]  610 	mov	a,_temp
      0002FA 55 2A            [12]  611 	anl	a,_threadMask
      0002FC 60 D3            [24]  612 	jz	00103$
                                    613 ;	preemptive.c:169: EA = 1;
                                    614 ;	assignBit
      0002FE D2 AF            [12]  615 	setb	_EA
                                    616 ;	preemptive.c:170: RESTORESTATE;
      000300 E5 29            [12]  617 	mov	a,_currentThread
      000302 24 25            [12]  618 	add	a, #_savedSP
      000304 F9               [12]  619 	mov	r1,a
      000305 87 81            [24]  620 	mov	_SP,@r1
      000307 D0 D0            [24]  621 	POP PSW 
      000309 D0 83            [24]  622 	POP DPH 
      00030B D0 82            [24]  623 	POP DPL 
      00030D D0 F0            [24]  624 	POP B 
      00030F D0 E0            [24]  625 	POP ACC 
                                    626 ;	preemptive.c:171: }
      000311 22               [24]  627 	ret
                                    628 ;------------------------------------------------------------
                                    629 ;Allocation info for local variables in function 'ThreadExit'
                                    630 ;------------------------------------------------------------
                                    631 ;	preemptive.c:177: void ThreadExit(void)
                                    632 ;	-----------------------------------------
                                    633 ;	 function ThreadExit
                                    634 ;	-----------------------------------------
      000312                        635 _ThreadExit:
                                    636 ;	preemptive.c:179: EA = 0;
                                    637 ;	assignBit
      000312 C2 AF            [12]  638 	clr	_EA
                                    639 ;	preemptive.c:180: temp = 1 << currentThread;
      000314 85 29 F0         [24]  640 	mov	b,_currentThread
      000317 05 F0            [12]  641 	inc	b
      000319 74 01            [12]  642 	mov	a,#0x01
      00031B 80 02            [24]  643 	sjmp	00136$
      00031D                        644 00135$:
      00031D 25 E0            [12]  645 	add	a,acc
      00031F                        646 00136$:
      00031F D5 F0 FB         [24]  647 	djnz	b,00135$
      000322 F5 2E            [12]  648 	mov	_temp,a
                                    649 ;	preemptive.c:181: threadMask ^= temp;
      000324 E5 2E            [12]  650 	mov	a,_temp
      000326 62 2A            [12]  651 	xrl	_threadMask,a
                                    652 ;	preemptive.c:182: for(i = 0; i < MAXTHREADS; i++){
      000328 75 2B 00         [24]  653 	mov	_i,#0x00
      00032B                        654 00107$:
      00032B 74 FC            [12]  655 	mov	a,#0x100 - 0x04
      00032D 25 2B            [12]  656 	add	a,_i
      00032F 40 22            [24]  657 	jc	00103$
                                    658 ;	preemptive.c:183: temp = 1 << i;
      000331 85 2B F0         [24]  659 	mov	b,_i
      000334 05 F0            [12]  660 	inc	b
      000336 74 01            [12]  661 	mov	a,#0x01
      000338 80 02            [24]  662 	sjmp	00139$
      00033A                        663 00138$:
      00033A 25 E0            [12]  664 	add	a,acc
      00033C                        665 00139$:
      00033C D5 F0 FB         [24]  666 	djnz	b,00138$
      00033F F5 2E            [12]  667 	mov	_temp,a
                                    668 ;	preemptive.c:184: if(temp & threadMask){
      000341 E5 2A            [12]  669 	mov	a,_threadMask
      000343 55 2E            [12]  670 	anl	a,_temp
      000345 60 05            [24]  671 	jz	00108$
                                    672 ;	preemptive.c:185: currentThread = i;
      000347 85 2B 29         [24]  673 	mov	_currentThread,_i
                                    674 ;	preemptive.c:186: break;
      00034A 80 07            [24]  675 	sjmp	00103$
      00034C                        676 00108$:
                                    677 ;	preemptive.c:182: for(i = 0; i < MAXTHREADS; i++){
      00034C E5 2B            [12]  678 	mov	a,_i
      00034E 04               [12]  679 	inc	a
      00034F F5 2B            [12]  680 	mov	_i,a
      000351 80 D8            [24]  681 	sjmp	00107$
      000353                        682 00103$:
                                    683 ;	preemptive.c:189: if (i == MAXTHREADS){
      000353 74 04            [12]  684 	mov	a,#0x04
      000355 B5 2B 03         [24]  685 	cjne	a,_i,00105$
                                    686 ;	preemptive.c:190: currentThread = -1;
      000358 75 29 FF         [24]  687 	mov	_currentThread,#0xff
      00035B                        688 00105$:
                                    689 ;	preemptive.c:192: RESTORESTATE;
      00035B E5 29            [12]  690 	mov	a,_currentThread
      00035D 24 25            [12]  691 	add	a, #_savedSP
      00035F F9               [12]  692 	mov	r1,a
      000360 87 81            [24]  693 	mov	_SP,@r1
      000362 D0 D0            [24]  694 	POP PSW 
      000364 D0 83            [24]  695 	POP DPH 
      000366 D0 82            [24]  696 	POP DPL 
      000368 D0 F0            [24]  697 	POP B 
      00036A D0 E0            [24]  698 	POP ACC 
                                    699 ;	preemptive.c:193: EA = 1;
                                    700 ;	assignBit
      00036C D2 AF            [12]  701 	setb	_EA
                                    702 ;	preemptive.c:194: }
      00036E 22               [24]  703 	ret
                                    704 	.area CSEG    (CODE)
                                    705 	.area CONST   (CODE)
                                    706 	.area XINIT   (CODE)
                                    707 	.area CABS    (ABS,CODE)
