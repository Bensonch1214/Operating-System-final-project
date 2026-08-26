                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module cooperative
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _temp
                                    110 	.globl _newThread
                                    111 	.globl _tempSP
                                    112 	.globl _i
                                    113 	.globl _threadMask
                                    114 	.globl _currentThread
                                    115 	.globl _savedSP
                                    116 	.globl _ThreadCreate
                                    117 	.globl _ThreadYield
                                    118 	.globl _ThreadExit
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
                           000030   234 _savedSP	=	0x0030
                           000034   235 _currentThread	=	0x0034
                           000035   236 _threadMask	=	0x0035
                           000036   237 _i	=	0x0036
                           000037   238 _tempSP	=	0x0037
                           000038   239 _newThread	=	0x0038
                           000039   240 _temp	=	0x0039
                                    241 ;--------------------------------------------------------
                                    242 ; overlayable items in internal ram
                                    243 ;--------------------------------------------------------
                                    244 	.area	OSEG    (OVR,DATA)
                                    245 ;--------------------------------------------------------
                                    246 ; indirectly addressable internal ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area ISEG    (DATA)
                                    249 ;--------------------------------------------------------
                                    250 ; absolute internal ram data
                                    251 ;--------------------------------------------------------
                                    252 	.area IABS    (ABS,DATA)
                                    253 	.area IABS    (ABS,DATA)
                                    254 ;--------------------------------------------------------
                                    255 ; bit data
                                    256 ;--------------------------------------------------------
                                    257 	.area BSEG    (BIT)
                                    258 ;--------------------------------------------------------
                                    259 ; paged external ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area PSEG    (PAG,XDATA)
                                    262 ;--------------------------------------------------------
                                    263 ; uninitialized external ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area XSEG    (XDATA)
                                    266 ;--------------------------------------------------------
                                    267 ; absolute external ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area XABS    (ABS,XDATA)
                                    270 ;--------------------------------------------------------
                                    271 ; initialized external ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area XISEG   (XDATA)
                                    274 	.area HOME    (CODE)
                                    275 	.area GSINIT0 (CODE)
                                    276 	.area GSINIT1 (CODE)
                                    277 	.area GSINIT2 (CODE)
                                    278 	.area GSINIT3 (CODE)
                                    279 	.area GSINIT4 (CODE)
                                    280 	.area GSINIT5 (CODE)
                                    281 	.area GSINIT  (CODE)
                                    282 	.area GSFINAL (CODE)
                                    283 	.area CSEG    (CODE)
                                    284 ;--------------------------------------------------------
                                    285 ; global & static initialisations
                                    286 ;--------------------------------------------------------
                                    287 	.area HOME    (CODE)
                                    288 	.area GSINIT  (CODE)
                                    289 	.area GSFINAL (CODE)
                                    290 	.area GSINIT  (CODE)
                                    291 ;--------------------------------------------------------
                                    292 ; Home
                                    293 ;--------------------------------------------------------
                                    294 	.area HOME    (CODE)
                                    295 	.area HOME    (CODE)
                                    296 ;--------------------------------------------------------
                                    297 ; code
                                    298 ;--------------------------------------------------------
                                    299 	.area CSEG    (CODE)
                                    300 ;------------------------------------------------------------
                                    301 ;Allocation info for local variables in function 'Bootstrap'
                                    302 ;------------------------------------------------------------
                                    303 ;	cooperative.c:59: void Bootstrap(void){
                                    304 ;	-----------------------------------------
                                    305 ;	 function Bootstrap
                                    306 ;	-----------------------------------------
      0000AF                        307 _Bootstrap:
                           000007   308 	ar7 = 0x07
                           000006   309 	ar6 = 0x06
                           000005   310 	ar5 = 0x05
                           000004   311 	ar4 = 0x04
                           000003   312 	ar3 = 0x03
                           000002   313 	ar2 = 0x02
                           000001   314 	ar1 = 0x01
                           000000   315 	ar0 = 0x00
                                    316 ;	cooperative.c:60: threadMask = 0;
      0000AF 75 35 00         [24]  317 	mov	_threadMask,#0x00
                                    318 ;	cooperative.c:61: currentThread = ThreadCreate(main);
      0000B2 90 00 9C         [24]  319 	mov	dptr,#_main
      0000B5 12 00 CD         [24]  320 	lcall	_ThreadCreate
      0000B8 85 82 34         [24]  321 	mov	_currentThread,dpl
                                    322 ;	cooperative.c:62: RESTORESTATE;
      0000BB E5 34            [12]  323 	mov	a,_currentThread
      0000BD 24 30            [12]  324 	add	a, #_savedSP
      0000BF F9               [12]  325 	mov	r1,a
      0000C0 87 81            [24]  326 	mov	_SP,@r1
      0000C2 D0 D0            [24]  327 	POP PSW 
      0000C4 D0 83            [24]  328 	POP DPH 
      0000C6 D0 82            [24]  329 	POP DPL 
      0000C8 D0 F0            [24]  330 	POP B 
      0000CA D0 E0            [24]  331 	POP ACC 
                                    332 ;	cooperative.c:63: }
      0000CC 22               [24]  333 	ret
                                    334 ;------------------------------------------------------------
                                    335 ;Allocation info for local variables in function 'ThreadCreate'
                                    336 ;------------------------------------------------------------
                                    337 ;fp            Allocated to registers 
                                    338 ;------------------------------------------------------------
                                    339 ;	cooperative.c:71: ThreadID ThreadCreate(FunctionPtr fp){
                                    340 ;	-----------------------------------------
                                    341 ;	 function ThreadCreate
                                    342 ;	-----------------------------------------
      0000CD                        343 _ThreadCreate:
                                    344 ;	cooperative.c:77: if(threadMask == 0x0F){
      0000CD 74 0F            [12]  345 	mov	a,#0x0f
      0000CF B5 35 04         [24]  346 	cjne	a,_threadMask,00102$
                                    347 ;	cooperative.c:78: return -1;
      0000D2 75 82 FF         [24]  348 	mov	dpl, #0xff
      0000D5 22               [24]  349 	ret
      0000D6                        350 00102$:
                                    351 ;	cooperative.c:124: for(i = 0; i != MAXTHREADS; i++){
      0000D6 75 36 00         [24]  352 	mov	_i,#0x00
      0000D9                        353 00107$:
      0000D9 74 04            [12]  354 	mov	a,#0x04
      0000DB B5 36 02         [24]  355 	cjne	a,_i,00137$
      0000DE 80 3E            [24]  356 	sjmp	00105$
      0000E0                        357 00137$:
                                    358 ;	cooperative.c:127: if(!(threadMask & (1 << i))){
      0000E0 85 36 F0         [24]  359 	mov	b,_i
      0000E3 05 F0            [12]  360 	inc	b
      0000E5 7E 01            [12]  361 	mov	r6,#0x01
      0000E7 7F 00            [12]  362 	mov	r7,#0x00
      0000E9 80 06            [24]  363 	sjmp	00139$
      0000EB                        364 00138$:
      0000EB EE               [12]  365 	mov	a,r6
      0000EC 2E               [12]  366 	add	a,r6
      0000ED FE               [12]  367 	mov	r6,a
      0000EE EF               [12]  368 	mov	a,r7
      0000EF 33               [12]  369 	rlc	a
      0000F0 FF               [12]  370 	mov	r7,a
      0000F1                        371 00139$:
      0000F1 D5 F0 F7         [24]  372 	djnz	b,00138$
      0000F4 AC 35            [24]  373 	mov	r4,_threadMask
      0000F6 7D 00            [12]  374 	mov	r5,#0x00
      0000F8 EC               [12]  375 	mov	a,r4
      0000F9 52 06            [12]  376 	anl	ar6,a
      0000FB ED               [12]  377 	mov	a,r5
      0000FC 52 07            [12]  378 	anl	ar7,a
      0000FE EE               [12]  379 	mov	a,r6
      0000FF 4F               [12]  380 	orl	a,r7
      000100 70 15            [24]  381 	jnz	00108$
                                    382 ;	cooperative.c:128: threadMask |= (1 << i); // mark this slot as occupied
      000102 85 36 F0         [24]  383 	mov	b,_i
      000105 05 F0            [12]  384 	inc	b
      000107 74 01            [12]  385 	mov	a,#0x01
      000109 80 02            [24]  386 	sjmp	00142$
      00010B                        387 00141$:
      00010B 25 E0            [12]  388 	add	a,acc
      00010D                        389 00142$:
      00010D D5 F0 FB         [24]  390 	djnz	b,00141$
      000110 42 35            [12]  391 	orl	_threadMask,a
                                    392 ;	cooperative.c:129: newThread = i;
      000112 85 36 38         [24]  393 	mov	_newThread,_i
                                    394 ;	cooperative.c:130: break;
      000115 80 07            [24]  395 	sjmp	00105$
      000117                        396 00108$:
                                    397 ;	cooperative.c:124: for(i = 0; i != MAXTHREADS; i++){
      000117 E5 36            [12]  398 	mov	a,_i
      000119 04               [12]  399 	inc	a
      00011A F5 36            [12]  400 	mov	_i,a
      00011C 80 BB            [24]  401 	sjmp	00107$
      00011E                        402 00105$:
                                    403 ;	cooperative.c:134: tempSP = SP;
      00011E 85 81 37         [24]  404 	mov	_tempSP,_SP
                                    405 ;	cooperative.c:137: SP = (0x3F) + newThread * (0x10);
      000121 E5 38            [12]  406 	mov	a,_newThread
      000123 C4               [12]  407 	swap	a
      000124 54 F0            [12]  408 	anl	a,#0xf0
      000126 FF               [12]  409 	mov	r7,a
      000127 24 3F            [12]  410 	add	a,#0x3f
      000129 F5 81            [12]  411 	mov	_SP,a
                                    412 ;	cooperative.c:142: __endasm;
      00012B C0 82            [24]  413 	PUSH	DPL
      00012D C0 83            [24]  414 	PUSH	DPH
                                    415 ;	cooperative.c:150: __endasm;
      00012F 54 00            [12]  416 	ANL	A, #0
      000131 C0 E0            [24]  417 	PUSH	ACC
      000133 C0 E0            [24]  418 	PUSH	ACC
      000135 C0 E0            [24]  419 	PUSH	ACC
      000137 C0 E0            [24]  420 	PUSH	ACC
                                    421 ;	cooperative.c:153: PSW = (newThread << 3);
      000139 E5 38            [12]  422 	mov	a,_newThread
      00013B C4               [12]  423 	swap	a
      00013C 03               [12]  424 	rr	a
      00013D 54 F8            [12]  425 	anl	a,#0xf8
      00013F F5 D0            [12]  426 	mov	_PSW,a
                                    427 ;	cooperative.c:156: __endasm;
      000141 C0 D0            [24]  428 	PUSH	PSW
                                    429 ;	cooperative.c:158: savedSP[newThread] = SP;
      000143 E5 38            [12]  430 	mov	a,_newThread
      000145 24 30            [12]  431 	add	a, #_savedSP
      000147 F8               [12]  432 	mov	r0,a
      000148 A6 81            [24]  433 	mov	@r0,_SP
                                    434 ;	cooperative.c:159: SP = tempSP;
      00014A 85 37 81         [24]  435 	mov	_SP,_tempSP
                                    436 ;	cooperative.c:160: return newThread;
      00014D 85 38 82         [24]  437 	mov	dpl, _newThread
                                    438 ;	cooperative.c:161: }
      000150 22               [24]  439 	ret
                                    440 ;------------------------------------------------------------
                                    441 ;Allocation info for local variables in function 'ThreadYield'
                                    442 ;------------------------------------------------------------
                                    443 ;	cooperative.c:170: void ThreadYield(void)
                                    444 ;	-----------------------------------------
                                    445 ;	 function ThreadYield
                                    446 ;	-----------------------------------------
      000151                        447 _ThreadYield:
                                    448 ;	cooperative.c:172: SAVESTATE;
      000151 C0 E0            [24]  449 	PUSH ACC 
      000153 C0 F0            [24]  450 	PUSH B 
      000155 C0 82            [24]  451 	PUSH DPL 
      000157 C0 83            [24]  452 	PUSH DPH 
      000159 C0 D0            [24]  453 	PUSH PSW 
      00015B E5 34            [12]  454 	mov	a,_currentThread
      00015D 24 30            [12]  455 	add	a, #_savedSP
      00015F F8               [12]  456 	mov	r0,a
      000160 A6 81            [24]  457 	mov	@r0,_SP
                                    458 ;	cooperative.c:173: do
      000162                        459 00103$:
                                    460 ;	cooperative.c:185: currentThread = (currentThread < 3) ? currentThread + 1 : 0;
      000162 74 FD            [12]  461 	mov	a,#0x100 - 0x03
      000164 25 34            [12]  462 	add	a,_currentThread
      000166 40 0A            [24]  463 	jc	00108$
      000168 AF 34            [24]  464 	mov	r7,_currentThread
      00016A 0F               [12]  465 	inc	r7
      00016B EF               [12]  466 	mov	a,r7
      00016C FE               [12]  467 	mov	r6,a
      00016D 33               [12]  468 	rlc	a
      00016E 95 E0            [12]  469 	subb	a,acc
      000170 80 02            [24]  470 	sjmp	00109$
      000172                        471 00108$:
      000172 7E 00            [12]  472 	mov	r6,#0x00
      000174                        473 00109$:
      000174 8E 34            [24]  474 	mov	_currentThread,r6
                                    475 ;	cooperative.c:186: if (threadMask & (1 << currentThread)){
      000176 85 34 F0         [24]  476 	mov	b,_currentThread
      000179 05 F0            [12]  477 	inc	b
      00017B 7E 01            [12]  478 	mov	r6,#0x01
      00017D 7F 00            [12]  479 	mov	r7,#0x00
      00017F 80 06            [24]  480 	sjmp	00130$
      000181                        481 00129$:
      000181 EE               [12]  482 	mov	a,r6
      000182 2E               [12]  483 	add	a,r6
      000183 FE               [12]  484 	mov	r6,a
      000184 EF               [12]  485 	mov	a,r7
      000185 33               [12]  486 	rlc	a
      000186 FF               [12]  487 	mov	r7,a
      000187                        488 00130$:
      000187 D5 F0 F7         [24]  489 	djnz	b,00129$
      00018A AC 35            [24]  490 	mov	r4,_threadMask
      00018C 7D 00            [12]  491 	mov	r5,#0x00
      00018E EC               [12]  492 	mov	a,r4
      00018F 52 06            [12]  493 	anl	ar6,a
      000191 ED               [12]  494 	mov	a,r5
      000192 52 07            [12]  495 	anl	ar7,a
      000194 EE               [12]  496 	mov	a,r6
      000195 4F               [12]  497 	orl	a,r7
      000196 60 CA            [24]  498 	jz	00103$
                                    499 ;	cooperative.c:190: RESTORESTATE;
      000198 E5 34            [12]  500 	mov	a,_currentThread
      00019A 24 30            [12]  501 	add	a, #_savedSP
      00019C F9               [12]  502 	mov	r1,a
      00019D 87 81            [24]  503 	mov	_SP,@r1
      00019F D0 D0            [24]  504 	POP PSW 
      0001A1 D0 83            [24]  505 	POP DPH 
      0001A3 D0 82            [24]  506 	POP DPL 
      0001A5 D0 F0            [24]  507 	POP B 
      0001A7 D0 E0            [24]  508 	POP ACC 
                                    509 ;	cooperative.c:191: }
      0001A9 22               [24]  510 	ret
                                    511 ;------------------------------------------------------------
                                    512 ;Allocation info for local variables in function 'ThreadExit'
                                    513 ;------------------------------------------------------------
                                    514 ;	cooperative.c:198: void ThreadExit(void)
                                    515 ;	-----------------------------------------
                                    516 ;	 function ThreadExit
                                    517 ;	-----------------------------------------
      0001AA                        518 _ThreadExit:
                                    519 ;	cooperative.c:206: temp = 1 << currentThread;
      0001AA 85 34 F0         [24]  520 	mov	b,_currentThread
      0001AD 05 F0            [12]  521 	inc	b
      0001AF 74 01            [12]  522 	mov	a,#0x01
      0001B1 80 02            [24]  523 	sjmp	00136$
      0001B3                        524 00135$:
      0001B3 25 E0            [12]  525 	add	a,acc
      0001B5                        526 00136$:
      0001B5 D5 F0 FB         [24]  527 	djnz	b,00135$
      0001B8 F5 39            [12]  528 	mov	_temp,a
                                    529 ;	cooperative.c:207: threadMask ^= temp;
      0001BA E5 39            [12]  530 	mov	a,_temp
      0001BC 62 35            [12]  531 	xrl	_threadMask,a
                                    532 ;	cooperative.c:208: for(i = 0; i < MAXTHREADS; i++){
      0001BE 75 36 00         [24]  533 	mov	_i,#0x00
      0001C1                        534 00107$:
      0001C1 74 FC            [12]  535 	mov	a,#0x100 - 0x04
      0001C3 25 36            [12]  536 	add	a,_i
      0001C5 40 22            [24]  537 	jc	00103$
                                    538 ;	cooperative.c:209: temp = 1 << i;
      0001C7 85 36 F0         [24]  539 	mov	b,_i
      0001CA 05 F0            [12]  540 	inc	b
      0001CC 74 01            [12]  541 	mov	a,#0x01
      0001CE 80 02            [24]  542 	sjmp	00139$
      0001D0                        543 00138$:
      0001D0 25 E0            [12]  544 	add	a,acc
      0001D2                        545 00139$:
      0001D2 D5 F0 FB         [24]  546 	djnz	b,00138$
      0001D5 F5 39            [12]  547 	mov	_temp,a
                                    548 ;	cooperative.c:210: if(temp & threadMask){
      0001D7 E5 35            [12]  549 	mov	a,_threadMask
      0001D9 55 39            [12]  550 	anl	a,_temp
      0001DB 60 05            [24]  551 	jz	00108$
                                    552 ;	cooperative.c:211: currentThread = i;
      0001DD 85 36 34         [24]  553 	mov	_currentThread,_i
                                    554 ;	cooperative.c:212: break;
      0001E0 80 07            [24]  555 	sjmp	00103$
      0001E2                        556 00108$:
                                    557 ;	cooperative.c:208: for(i = 0; i < MAXTHREADS; i++){
      0001E2 E5 36            [12]  558 	mov	a,_i
      0001E4 04               [12]  559 	inc	a
      0001E5 F5 36            [12]  560 	mov	_i,a
      0001E7 80 D8            [24]  561 	sjmp	00107$
      0001E9                        562 00103$:
                                    563 ;	cooperative.c:215: if (i == MAXTHREADS){
      0001E9 74 04            [12]  564 	mov	a,#0x04
      0001EB B5 36 03         [24]  565 	cjne	a,_i,00105$
                                    566 ;	cooperative.c:216: currentThread = -1;
      0001EE 75 34 FF         [24]  567 	mov	_currentThread,#0xff
      0001F1                        568 00105$:
                                    569 ;	cooperative.c:218: RESTORESTATE;
      0001F1 E5 34            [12]  570 	mov	a,_currentThread
      0001F3 24 30            [12]  571 	add	a, #_savedSP
      0001F5 F9               [12]  572 	mov	r1,a
      0001F6 87 81            [24]  573 	mov	_SP,@r1
      0001F8 D0 D0            [24]  574 	POP PSW 
      0001FA D0 83            [24]  575 	POP DPH 
      0001FC D0 82            [24]  576 	POP DPL 
      0001FE D0 F0            [24]  577 	POP B 
      000200 D0 E0            [24]  578 	POP ACC 
                                    579 ;	cooperative.c:219: }
      000202 22               [24]  580 	ret
                                    581 	.area CSEG    (CODE)
                                    582 	.area CONST   (CODE)
                                    583 	.area XINIT   (CODE)
                                    584 	.area CABS    (ABS,CODE)
