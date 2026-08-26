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
      000000                        261 _myTimer0Handler_sloc0_1_0:
      000000                        262 	.ds 1
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
                                    308 ;	preemptive.c:58: void Bootstrap(void) {
                                    309 ;	-----------------------------------------
                                    310 ;	 function Bootstrap
                                    311 ;	-----------------------------------------
      00018F                        312 _Bootstrap:
                           000007   313 	ar7 = 0x07
                           000006   314 	ar6 = 0x06
                           000005   315 	ar5 = 0x05
                           000004   316 	ar4 = 0x04
                           000003   317 	ar3 = 0x03
                           000002   318 	ar2 = 0x02
                           000001   319 	ar1 = 0x01
                           000000   320 	ar0 = 0x00
                                    321 ;	preemptive.c:59: threadMask = 0;
      00018F 75 2A 00         [24]  322 	mov	_threadMask,#0x00
                                    323 ;	preemptive.c:60: clockwise = 1;
      000192 75 2F 01         [24]  324 	mov	_clockwise,#0x01
                                    325 ;	preemptive.c:61: TMOD = 0; // timer 0 mode 0
      000195 75 89 00         [24]  326 	mov	_TMOD,#0x00
                                    327 ;	preemptive.c:64: IE = 0x82; // enable timer 0 interrupt,
      000198 75 A8 82         [24]  328 	mov	_IE,#0x82
                                    329 ;	preemptive.c:65: TR0 = 1; // start running timer0
                                    330 ;	assignBit
      00019B D2 8C            [12]  331 	setb	_TR0
                                    332 ;	preemptive.c:66: currentThread = ThreadCreate(main);
      00019D 90 01 67         [24]  333 	mov	dptr,#_main
      0001A0 12 02 34         [24]  334 	lcall	_ThreadCreate
      0001A3 85 82 29         [24]  335 	mov	_currentThread,dpl
                                    336 ;	preemptive.c:67: RESTORESTATE;
      0001A6 E5 29            [12]  337 	mov	a,_currentThread
      0001A8 24 25            [12]  338 	add	a, #_savedSP
      0001AA F9               [12]  339 	mov	r1,a
      0001AB 87 81            [24]  340 	mov	_SP,@r1
      0001AD D0 D0            [24]  341 	POP PSW 
      0001AF D0 83            [24]  342 	POP DPH 
      0001B1 D0 82            [24]  343 	POP DPL 
      0001B3 D0 F0            [24]  344 	POP B 
      0001B5 D0 E0            [24]  345 	POP ACC 
                                    346 ;	preemptive.c:68: }
      0001B7 22               [24]  347 	ret
                                    348 ;------------------------------------------------------------
                                    349 ;Allocation info for local variables in function 'myTimer0Handler'
                                    350 ;------------------------------------------------------------
                                    351 ;	preemptive.c:89: void myTimer0Handler(void) {
                                    352 ;	-----------------------------------------
                                    353 ;	 function myTimer0Handler
                                    354 ;	-----------------------------------------
      0001B8                        355 _myTimer0Handler:
                                    356 ;	preemptive.c:90: EA = 0; // don't do __critial
                                    357 ;	assignBit
      0001B8 C2 AF            [12]  358 	clr	_EA
                                    359 ;	preemptive.c:91: SAVESTATE;
      0001BA C0 E0            [24]  360 	PUSH ACC 
      0001BC C0 F0            [24]  361 	PUSH B 
      0001BE C0 82            [24]  362 	PUSH DPL 
      0001C0 C0 83            [24]  363 	PUSH DPH 
      0001C2 C0 D0            [24]  364 	PUSH PSW 
      0001C4 E5 29            [12]  365 	mov	a,_currentThread
      0001C6 24 25            [12]  366 	add	a, #_savedSP
      0001C8 F8               [12]  367 	mov	r0,a
      0001C9 A6 81            [24]  368 	mov	@r0,_SP
                                    369 ;	preemptive.c:92: do{
      0001CB                        370 00112$:
                                    371 ;	preemptive.c:93: if(clockwise){
      0001CB E5 2F            [12]  372 	mov	a,_clockwise
      0001CD 60 21            [24]  373 	jz	00108$
                                    374 ;	preemptive.c:94: clockwise = !(currentThread == 3);
      0001CF 74 03            [12]  375 	mov	a,#0x03
      0001D1 B5 29 03         [24]  376 	cjne	a,_currentThread,00148$
      0001D4 D3               [12]  377 	setb	c
      0001D5 80 01            [24]  378 	sjmp	00149$
      0001D7                        379 00148$:
      0001D7 C3               [12]  380 	clr	c
      0001D8                        381 00149$:
      0001D8 B3               [12]  382 	cpl	c
      0001D9 92 00            [24]  383 	mov	_myTimer0Handler_sloc0_1_0,c
      0001DB E4               [12]  384 	clr	a
      0001DC 33               [12]  385 	rlc	a
      0001DD F5 2F            [12]  386 	mov	_clockwise,a
                                    387 ;	preemptive.c:95: if(currentThread == 3) currentThread = 2;
      0001DF 74 03            [12]  388 	mov	a,#0x03
      0001E1 B5 29 05         [24]  389 	cjne	a,_currentThread,00102$
      0001E4 75 29 02         [24]  390 	mov	_currentThread,#0x02
      0001E7 80 20            [24]  391 	sjmp	00109$
      0001E9                        392 00102$:
                                    393 ;	preemptive.c:96: else currentThread++;
      0001E9 E5 29            [12]  394 	mov	a,_currentThread
      0001EB 04               [12]  395 	inc	a
      0001EC F5 29            [12]  396 	mov	_currentThread,a
      0001EE 80 19            [24]  397 	sjmp	00109$
      0001F0                        398 00108$:
                                    399 ;	preemptive.c:99: clockwise = (currentThread == 0);
      0001F0 E4               [12]  400 	clr	a
      0001F1 B5 29 04         [24]  401 	cjne	a,_currentThread,00152$
      0001F4 74 01            [12]  402 	mov	a,#0x01
      0001F6 80 01            [24]  403 	sjmp	00153$
      0001F8                        404 00152$:
      0001F8 E4               [12]  405 	clr	a
      0001F9                        406 00153$:
      0001F9 F5 2F            [12]  407 	mov	_clockwise,a
                                    408 ;	preemptive.c:100: if(currentThread == 0) currentThread = 1;
      0001FB E5 29            [12]  409 	mov	a,_currentThread
      0001FD 70 05            [24]  410 	jnz	00105$
      0001FF 75 29 01         [24]  411 	mov	_currentThread,#0x01
      000202 80 05            [24]  412 	sjmp	00109$
      000204                        413 00105$:
                                    414 ;	preemptive.c:101: else currentThread--;
      000204 E5 29            [12]  415 	mov	a,_currentThread
      000206 14               [12]  416 	dec	a
      000207 F5 29            [12]  417 	mov	_currentThread,a
      000209                        418 00109$:
                                    419 ;	preemptive.c:103: temp = 1 << currentThread;
      000209 85 29 F0         [24]  420 	mov	b,_currentThread
      00020C 05 F0            [12]  421 	inc	b
      00020E 74 01            [12]  422 	mov	a,#0x01
      000210 80 02            [24]  423 	sjmp	00156$
      000212                        424 00155$:
      000212 25 E0            [12]  425 	add	a,acc
      000214                        426 00156$:
      000214 D5 F0 FB         [24]  427 	djnz	b,00155$
      000217 F5 2E            [12]  428 	mov	_temp,a
                                    429 ;	preemptive.c:104: if (threadMask & temp){
      000219 E5 2E            [12]  430 	mov	a,_temp
      00021B 55 2A            [12]  431 	anl	a,_threadMask
      00021D 60 AC            [24]  432 	jz	00112$
                                    433 ;	preemptive.c:108: RESTORESTATE;
      00021F E5 29            [12]  434 	mov	a,_currentThread
      000221 24 25            [12]  435 	add	a, #_savedSP
      000223 F9               [12]  436 	mov	r1,a
      000224 87 81            [24]  437 	mov	_SP,@r1
      000226 D0 D0            [24]  438 	POP PSW 
      000228 D0 83            [24]  439 	POP DPH 
      00022A D0 82            [24]  440 	POP DPL 
      00022C D0 F0            [24]  441 	POP B 
      00022E D0 E0            [24]  442 	POP ACC 
                                    443 ;	preemptive.c:111: EA = 1;
                                    444 ;	assignBit
      000230 D2 AF            [12]  445 	setb	_EA
                                    446 ;	preemptive.c:114: __endasm;
      000232 32               [24]  447 	RETI
                                    448 ;	preemptive.c:115: }
      000233 22               [24]  449 	ret
                                    450 ;------------------------------------------------------------
                                    451 ;Allocation info for local variables in function 'ThreadCreate'
                                    452 ;------------------------------------------------------------
                                    453 ;fp            Allocated to registers 
                                    454 ;------------------------------------------------------------
                                    455 ;	preemptive.c:118: ThreadID ThreadCreate(FunctionPtr fp){
                                    456 ;	-----------------------------------------
                                    457 ;	 function ThreadCreate
                                    458 ;	-----------------------------------------
      000234                        459 _ThreadCreate:
                                    460 ;	preemptive.c:119: EA = 0;
                                    461 ;	assignBit
      000234 C2 AF            [12]  462 	clr	_EA
                                    463 ;	preemptive.c:120: if(threadMask == 0x0F){
      000236 74 0F            [12]  464 	mov	a,#0x0f
      000238 B5 2A 04         [24]  465 	cjne	a,_threadMask,00102$
                                    466 ;	preemptive.c:121: return -1;
      00023B 75 82 FF         [24]  467 	mov	dpl, #0xff
      00023E 22               [24]  468 	ret
      00023F                        469 00102$:
                                    470 ;	preemptive.c:162: for(i = 0; i != MAXTHREADS; i++){
      00023F 75 2B 00         [24]  471 	mov	_i,#0x00
      000242                        472 00107$:
      000242 74 04            [12]  473 	mov	a,#0x04
      000244 B5 2B 02         [24]  474 	cjne	a,_i,00137$
      000247 80 29            [24]  475 	sjmp	00105$
      000249                        476 00137$:
                                    477 ;	preemptive.c:164: temp = 1;
      000249 75 2E 01         [24]  478 	mov	_temp,#0x01
                                    479 ;	preemptive.c:165: temp <<= i;
      00024C 85 2B F0         [24]  480 	mov	b,_i
      00024F 05 F0            [12]  481 	inc	b
      000251 E5 2E            [12]  482 	mov	a,_temp
      000253 80 02            [24]  483 	sjmp	00139$
      000255                        484 00138$:
      000255 25 E0            [12]  485 	add	a,acc
      000257                        486 00139$:
      000257 D5 F0 FB         [24]  487 	djnz	b,00138$
      00025A F5 2E            [12]  488 	mov	_temp,a
                                    489 ;	preemptive.c:166: if(!(threadMask & temp)){
      00025C E5 2E            [12]  490 	mov	a,_temp
      00025E 55 2A            [12]  491 	anl	a,_threadMask
      000260 70 09            [24]  492 	jnz	00108$
                                    493 ;	preemptive.c:167: threadMask |= temp; /* mark slot as occupied */
      000262 E5 2E            [12]  494 	mov	a,_temp
      000264 42 2A            [12]  495 	orl	_threadMask,a
                                    496 ;	preemptive.c:168: newThread = i;
      000266 85 2B 2D         [24]  497 	mov	_newThread,_i
                                    498 ;	preemptive.c:169: break;
      000269 80 07            [24]  499 	sjmp	00105$
      00026B                        500 00108$:
                                    501 ;	preemptive.c:162: for(i = 0; i != MAXTHREADS; i++){
      00026B E5 2B            [12]  502 	mov	a,_i
      00026D 04               [12]  503 	inc	a
      00026E F5 2B            [12]  504 	mov	_i,a
      000270 80 D0            [24]  505 	sjmp	00107$
      000272                        506 00105$:
                                    507 ;	preemptive.c:173: tempSP = SP;
      000272 85 81 2C         [24]  508 	mov	_tempSP,_SP
                                    509 ;	preemptive.c:176: SP = (0x3F) + newThread * (0x10);
      000275 E5 2D            [12]  510 	mov	a,_newThread
      000277 C4               [12]  511 	swap	a
      000278 54 F0            [12]  512 	anl	a,#0xf0
      00027A FF               [12]  513 	mov	r7,a
      00027B 24 3F            [12]  514 	add	a,#0x3f
      00027D F5 81            [12]  515 	mov	_SP,a
                                    516 ;	preemptive.c:181: __endasm;
      00027F C0 82            [24]  517 	PUSH	DPL
      000281 C0 83            [24]  518 	PUSH	DPH
                                    519 ;	preemptive.c:189: __endasm;
      000283 54 00            [12]  520 	ANL	A, #0
      000285 C0 E0            [24]  521 	PUSH	ACC
      000287 C0 E0            [24]  522 	PUSH	ACC
      000289 C0 E0            [24]  523 	PUSH	ACC
      00028B C0 E0            [24]  524 	PUSH	ACC
                                    525 ;	preemptive.c:191: PSW = (newThread << 3);
      00028D E5 2D            [12]  526 	mov	a,_newThread
      00028F C4               [12]  527 	swap	a
      000290 03               [12]  528 	rr	a
      000291 54 F8            [12]  529 	anl	a,#0xf8
      000293 F5 D0            [12]  530 	mov	_PSW,a
                                    531 ;	preemptive.c:194: __endasm;
      000295 C0 D0            [24]  532 	PUSH	PSW
                                    533 ;	preemptive.c:196: savedSP[newThread] = SP;
      000297 E5 2D            [12]  534 	mov	a,_newThread
      000299 24 25            [12]  535 	add	a, #_savedSP
      00029B F8               [12]  536 	mov	r0,a
      00029C A6 81            [24]  537 	mov	@r0,_SP
                                    538 ;	preemptive.c:197: SP = tempSP;
      00029E 85 2C 81         [24]  539 	mov	_SP,_tempSP
                                    540 ;	preemptive.c:198: EA = 1;
                                    541 ;	assignBit
      0002A1 D2 AF            [12]  542 	setb	_EA
                                    543 ;	preemptive.c:199: return newThread;
      0002A3 85 2D 82         [24]  544 	mov	dpl, _newThread
                                    545 ;	preemptive.c:200: }
      0002A6 22               [24]  546 	ret
                                    547 ;------------------------------------------------------------
                                    548 ;Allocation info for local variables in function 'ThreadYield'
                                    549 ;------------------------------------------------------------
                                    550 ;	preemptive.c:203: void ThreadYield(void){
                                    551 ;	-----------------------------------------
                                    552 ;	 function ThreadYield
                                    553 ;	-----------------------------------------
      0002A7                        554 _ThreadYield:
                                    555 ;	preemptive.c:204: EA = 0;
                                    556 ;	assignBit
      0002A7 C2 AF            [12]  557 	clr	_EA
                                    558 ;	preemptive.c:205: SAVESTATE;
      0002A9 C0 E0            [24]  559 	PUSH ACC 
      0002AB C0 F0            [24]  560 	PUSH B 
      0002AD C0 82            [24]  561 	PUSH DPL 
      0002AF C0 83            [24]  562 	PUSH DPH 
      0002B1 C0 D0            [24]  563 	PUSH PSW 
      0002B3 E5 29            [12]  564 	mov	a,_currentThread
      0002B5 24 25            [12]  565 	add	a, #_savedSP
      0002B7 F8               [12]  566 	mov	r0,a
      0002B8 A6 81            [24]  567 	mov	@r0,_SP
                                    568 ;	preemptive.c:206: do{
      0002BA                        569 00103$:
                                    570 ;	preemptive.c:207: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      0002BA 74 FD            [12]  571 	mov	a,#0x100 - 0x03
      0002BC 25 29            [12]  572 	add	a,_currentThread
      0002BE 40 0B            [24]  573 	jc	00108$
      0002C0 AF 29            [24]  574 	mov	r7,_currentThread
      0002C2 0F               [12]  575 	inc	r7
      0002C3 EF               [12]  576 	mov	a,r7
      0002C4 FE               [12]  577 	mov	r6,a
      0002C5 33               [12]  578 	rlc	a
      0002C6 95 E0            [12]  579 	subb	a,acc
      0002C8 FF               [12]  580 	mov	r7,a
      0002C9 80 04            [24]  581 	sjmp	00109$
      0002CB                        582 00108$:
      0002CB 7E 00            [12]  583 	mov	r6,#0x00
      0002CD 7F 00            [12]  584 	mov	r7,#0x00
      0002CF                        585 00109$:
      0002CF 8E 29            [24]  586 	mov	_currentThread,r6
                                    587 ;	preemptive.c:208: temp = 1 << currentThread;
      0002D1 85 29 F0         [24]  588 	mov	b,_currentThread
      0002D4 05 F0            [12]  589 	inc	b
      0002D6 74 01            [12]  590 	mov	a,#0x01
      0002D8 80 02            [24]  591 	sjmp	00130$
      0002DA                        592 00129$:
      0002DA 25 E0            [12]  593 	add	a,acc
      0002DC                        594 00130$:
      0002DC D5 F0 FB         [24]  595 	djnz	b,00129$
      0002DF F5 2E            [12]  596 	mov	_temp,a
                                    597 ;	preemptive.c:209: if (threadMask & temp){
      0002E1 E5 2E            [12]  598 	mov	a,_temp
      0002E3 55 2A            [12]  599 	anl	a,_threadMask
      0002E5 60 D3            [24]  600 	jz	00103$
                                    601 ;	preemptive.c:214: EA = 1;
                                    602 ;	assignBit
      0002E7 D2 AF            [12]  603 	setb	_EA
                                    604 ;	preemptive.c:215: RESTORESTATE;
      0002E9 E5 29            [12]  605 	mov	a,_currentThread
      0002EB 24 25            [12]  606 	add	a, #_savedSP
      0002ED F9               [12]  607 	mov	r1,a
      0002EE 87 81            [24]  608 	mov	_SP,@r1
      0002F0 D0 D0            [24]  609 	POP PSW 
      0002F2 D0 83            [24]  610 	POP DPH 
      0002F4 D0 82            [24]  611 	POP DPL 
      0002F6 D0 F0            [24]  612 	POP B 
      0002F8 D0 E0            [24]  613 	POP ACC 
                                    614 ;	preemptive.c:216: }
      0002FA 22               [24]  615 	ret
                                    616 ;------------------------------------------------------------
                                    617 ;Allocation info for local variables in function 'ThreadExit'
                                    618 ;------------------------------------------------------------
                                    619 ;	preemptive.c:222: void ThreadExit(void)
                                    620 ;	-----------------------------------------
                                    621 ;	 function ThreadExit
                                    622 ;	-----------------------------------------
      0002FB                        623 _ThreadExit:
                                    624 ;	preemptive.c:224: EA = 0;
                                    625 ;	assignBit
      0002FB C2 AF            [12]  626 	clr	_EA
                                    627 ;	preemptive.c:225: temp = 1 << currentThread;
      0002FD 85 29 F0         [24]  628 	mov	b,_currentThread
      000300 05 F0            [12]  629 	inc	b
      000302 74 01            [12]  630 	mov	a,#0x01
      000304 80 02            [24]  631 	sjmp	00136$
      000306                        632 00135$:
      000306 25 E0            [12]  633 	add	a,acc
      000308                        634 00136$:
      000308 D5 F0 FB         [24]  635 	djnz	b,00135$
      00030B F5 2E            [12]  636 	mov	_temp,a
                                    637 ;	preemptive.c:226: threadMask ^= temp;
      00030D E5 2E            [12]  638 	mov	a,_temp
      00030F 62 2A            [12]  639 	xrl	_threadMask,a
                                    640 ;	preemptive.c:227: for(i = 0; i < MAXTHREADS; i++){
      000311 75 2B 00         [24]  641 	mov	_i,#0x00
      000314                        642 00107$:
      000314 74 FC            [12]  643 	mov	a,#0x100 - 0x04
      000316 25 2B            [12]  644 	add	a,_i
      000318 40 22            [24]  645 	jc	00103$
                                    646 ;	preemptive.c:228: temp = 1 << i;
      00031A 85 2B F0         [24]  647 	mov	b,_i
      00031D 05 F0            [12]  648 	inc	b
      00031F 74 01            [12]  649 	mov	a,#0x01
      000321 80 02            [24]  650 	sjmp	00139$
      000323                        651 00138$:
      000323 25 E0            [12]  652 	add	a,acc
      000325                        653 00139$:
      000325 D5 F0 FB         [24]  654 	djnz	b,00138$
      000328 F5 2E            [12]  655 	mov	_temp,a
                                    656 ;	preemptive.c:229: if(temp & threadMask){
      00032A E5 2A            [12]  657 	mov	a,_threadMask
      00032C 55 2E            [12]  658 	anl	a,_temp
      00032E 60 05            [24]  659 	jz	00108$
                                    660 ;	preemptive.c:230: currentThread = i;
      000330 85 2B 29         [24]  661 	mov	_currentThread,_i
                                    662 ;	preemptive.c:231: break;
      000333 80 07            [24]  663 	sjmp	00103$
      000335                        664 00108$:
                                    665 ;	preemptive.c:227: for(i = 0; i < MAXTHREADS; i++){
      000335 E5 2B            [12]  666 	mov	a,_i
      000337 04               [12]  667 	inc	a
      000338 F5 2B            [12]  668 	mov	_i,a
      00033A 80 D8            [24]  669 	sjmp	00107$
      00033C                        670 00103$:
                                    671 ;	preemptive.c:234: if (i == MAXTHREADS){
      00033C 74 04            [12]  672 	mov	a,#0x04
      00033E B5 2B 03         [24]  673 	cjne	a,_i,00105$
                                    674 ;	preemptive.c:235: currentThread = -1;
      000341 75 29 FF         [24]  675 	mov	_currentThread,#0xff
      000344                        676 00105$:
                                    677 ;	preemptive.c:237: RESTORESTATE;
      000344 E5 29            [12]  678 	mov	a,_currentThread
      000346 24 25            [12]  679 	add	a, #_savedSP
      000348 F9               [12]  680 	mov	r1,a
      000349 87 81            [24]  681 	mov	_SP,@r1
      00034B D0 D0            [24]  682 	POP PSW 
      00034D D0 83            [24]  683 	POP DPH 
      00034F D0 82            [24]  684 	POP DPL 
      000351 D0 F0            [24]  685 	POP B 
      000353 D0 E0            [24]  686 	POP ACC 
                                    687 ;	preemptive.c:238: EA = 1;
                                    688 ;	assignBit
      000355 D2 AF            [12]  689 	setb	_EA
                                    690 ;	preemptive.c:239: }
      000357 22               [24]  691 	ret
                                    692 	.area CSEG    (CODE)
                                    693 	.area CONST   (CODE)
                                    694 	.area XINIT   (CODE)
                                    695 	.area CABS    (ABS,CODE)
