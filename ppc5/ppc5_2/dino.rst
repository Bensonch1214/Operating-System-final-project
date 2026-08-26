                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module dino
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
                                     17 	.globl _game_ctrl
                                     18 	.globl _keypad_ctrl
                                     19 	.globl _render_task
                                     20 	.globl _LCD_write_char
                                     21 	.globl _LCD_IRWrite
                                     22 	.globl _LCD_Init
                                     23 	.globl _AnyKeyPressed
                                     24 	.globl _KeyToChar
                                     25 	.globl _Init_Keypad
                                     26 	.globl _ThreadReset
                                     27 	.globl _ThreadYield
                                     28 	.globl _ThreadCreate
                                     29 	.globl _CY
                                     30 	.globl _AC
                                     31 	.globl _F0
                                     32 	.globl _RS1
                                     33 	.globl _RS0
                                     34 	.globl _OV
                                     35 	.globl _F1
                                     36 	.globl _P
                                     37 	.globl _PS
                                     38 	.globl _PT1
                                     39 	.globl _PX1
                                     40 	.globl _PT0
                                     41 	.globl _PX0
                                     42 	.globl _RD
                                     43 	.globl _WR
                                     44 	.globl _T1
                                     45 	.globl _T0
                                     46 	.globl _INT1
                                     47 	.globl _INT0
                                     48 	.globl _TXD
                                     49 	.globl _RXD
                                     50 	.globl _P3_7
                                     51 	.globl _P3_6
                                     52 	.globl _P3_5
                                     53 	.globl _P3_4
                                     54 	.globl _P3_3
                                     55 	.globl _P3_2
                                     56 	.globl _P3_1
                                     57 	.globl _P3_0
                                     58 	.globl _EA
                                     59 	.globl _ES
                                     60 	.globl _ET1
                                     61 	.globl _EX1
                                     62 	.globl _ET0
                                     63 	.globl _EX0
                                     64 	.globl _P2_7
                                     65 	.globl _P2_6
                                     66 	.globl _P2_5
                                     67 	.globl _P2_4
                                     68 	.globl _P2_3
                                     69 	.globl _P2_2
                                     70 	.globl _P2_1
                                     71 	.globl _P2_0
                                     72 	.globl _SM0
                                     73 	.globl _SM1
                                     74 	.globl _SM2
                                     75 	.globl _REN
                                     76 	.globl _TB8
                                     77 	.globl _RB8
                                     78 	.globl _TI
                                     79 	.globl _RI
                                     80 	.globl _P1_7
                                     81 	.globl _P1_6
                                     82 	.globl _P1_5
                                     83 	.globl _P1_4
                                     84 	.globl _P1_3
                                     85 	.globl _P1_2
                                     86 	.globl _P1_1
                                     87 	.globl _P1_0
                                     88 	.globl _TF1
                                     89 	.globl _TR1
                                     90 	.globl _TF0
                                     91 	.globl _TR0
                                     92 	.globl _IE1
                                     93 	.globl _IT1
                                     94 	.globl _IE0
                                     95 	.globl _IT0
                                     96 	.globl _P0_7
                                     97 	.globl _P0_6
                                     98 	.globl _P0_5
                                     99 	.globl _P0_4
                                    100 	.globl _P0_3
                                    101 	.globl _P0_2
                                    102 	.globl _P0_1
                                    103 	.globl _P0_0
                                    104 	.globl _B
                                    105 	.globl _ACC
                                    106 	.globl _PSW
                                    107 	.globl _IP
                                    108 	.globl _P3
                                    109 	.globl _IE
                                    110 	.globl _P2
                                    111 	.globl _SBUF
                                    112 	.globl _SCON
                                    113 	.globl _P1
                                    114 	.globl _TH1
                                    115 	.globl _TH0
                                    116 	.globl _TL1
                                    117 	.globl _TL0
                                    118 	.globl _TMOD
                                    119 	.globl _TCON
                                    120 	.globl _PCON
                                    121 	.globl _DPH
                                    122 	.globl _DPL
                                    123 	.globl _SP
                                    124 	.globl _P0
                                    125 	.globl _mask
                                    126 	.globl _carry
                                    127 	.globl _gameover
                                    128 	.globl _score
                                    129 	.globl _dino_row
                                    130 	.globl _spare
                                    131 	.globl _key_ch
                                    132 	.globl _level
                                    133 	.globl _row_bot
                                    134 	.globl _row_top
                                    135 ;--------------------------------------------------------
                                    136 ; special function registers
                                    137 ;--------------------------------------------------------
                                    138 	.area RSEG    (ABS,DATA)
      000000                        139 	.org 0x0000
                           000080   140 _P0	=	0x0080
                           000081   141 _SP	=	0x0081
                           000082   142 _DPL	=	0x0082
                           000083   143 _DPH	=	0x0083
                           000087   144 _PCON	=	0x0087
                           000088   145 _TCON	=	0x0088
                           000089   146 _TMOD	=	0x0089
                           00008A   147 _TL0	=	0x008a
                           00008B   148 _TL1	=	0x008b
                           00008C   149 _TH0	=	0x008c
                           00008D   150 _TH1	=	0x008d
                           000090   151 _P1	=	0x0090
                           000098   152 _SCON	=	0x0098
                           000099   153 _SBUF	=	0x0099
                           0000A0   154 _P2	=	0x00a0
                           0000A8   155 _IE	=	0x00a8
                           0000B0   156 _P3	=	0x00b0
                           0000B8   157 _IP	=	0x00b8
                           0000D0   158 _PSW	=	0x00d0
                           0000E0   159 _ACC	=	0x00e0
                           0000F0   160 _B	=	0x00f0
                                    161 ;--------------------------------------------------------
                                    162 ; special function bits
                                    163 ;--------------------------------------------------------
                                    164 	.area RSEG    (ABS,DATA)
      000000                        165 	.org 0x0000
                           000080   166 _P0_0	=	0x0080
                           000081   167 _P0_1	=	0x0081
                           000082   168 _P0_2	=	0x0082
                           000083   169 _P0_3	=	0x0083
                           000084   170 _P0_4	=	0x0084
                           000085   171 _P0_5	=	0x0085
                           000086   172 _P0_6	=	0x0086
                           000087   173 _P0_7	=	0x0087
                           000088   174 _IT0	=	0x0088
                           000089   175 _IE0	=	0x0089
                           00008A   176 _IT1	=	0x008a
                           00008B   177 _IE1	=	0x008b
                           00008C   178 _TR0	=	0x008c
                           00008D   179 _TF0	=	0x008d
                           00008E   180 _TR1	=	0x008e
                           00008F   181 _TF1	=	0x008f
                           000090   182 _P1_0	=	0x0090
                           000091   183 _P1_1	=	0x0091
                           000092   184 _P1_2	=	0x0092
                           000093   185 _P1_3	=	0x0093
                           000094   186 _P1_4	=	0x0094
                           000095   187 _P1_5	=	0x0095
                           000096   188 _P1_6	=	0x0096
                           000097   189 _P1_7	=	0x0097
                           000098   190 _RI	=	0x0098
                           000099   191 _TI	=	0x0099
                           00009A   192 _RB8	=	0x009a
                           00009B   193 _TB8	=	0x009b
                           00009C   194 _REN	=	0x009c
                           00009D   195 _SM2	=	0x009d
                           00009E   196 _SM1	=	0x009e
                           00009F   197 _SM0	=	0x009f
                           0000A0   198 _P2_0	=	0x00a0
                           0000A1   199 _P2_1	=	0x00a1
                           0000A2   200 _P2_2	=	0x00a2
                           0000A3   201 _P2_3	=	0x00a3
                           0000A4   202 _P2_4	=	0x00a4
                           0000A5   203 _P2_5	=	0x00a5
                           0000A6   204 _P2_6	=	0x00a6
                           0000A7   205 _P2_7	=	0x00a7
                           0000A8   206 _EX0	=	0x00a8
                           0000A9   207 _ET0	=	0x00a9
                           0000AA   208 _EX1	=	0x00aa
                           0000AB   209 _ET1	=	0x00ab
                           0000AC   210 _ES	=	0x00ac
                           0000AF   211 _EA	=	0x00af
                           0000B0   212 _P3_0	=	0x00b0
                           0000B1   213 _P3_1	=	0x00b1
                           0000B2   214 _P3_2	=	0x00b2
                           0000B3   215 _P3_3	=	0x00b3
                           0000B4   216 _P3_4	=	0x00b4
                           0000B5   217 _P3_5	=	0x00b5
                           0000B6   218 _P3_6	=	0x00b6
                           0000B7   219 _P3_7	=	0x00b7
                           0000B0   220 _RXD	=	0x00b0
                           0000B1   221 _TXD	=	0x00b1
                           0000B2   222 _INT0	=	0x00b2
                           0000B3   223 _INT1	=	0x00b3
                           0000B4   224 _T0	=	0x00b4
                           0000B5   225 _T1	=	0x00b5
                           0000B6   226 _WR	=	0x00b6
                           0000B7   227 _RD	=	0x00b7
                           0000B8   228 _PX0	=	0x00b8
                           0000B9   229 _PT0	=	0x00b9
                           0000BA   230 _PX1	=	0x00ba
                           0000BB   231 _PT1	=	0x00bb
                           0000BC   232 _PS	=	0x00bc
                           0000D0   233 _P	=	0x00d0
                           0000D1   234 _F1	=	0x00d1
                           0000D2   235 _OV	=	0x00d2
                           0000D3   236 _RS0	=	0x00d3
                           0000D4   237 _RS1	=	0x00d4
                           0000D5   238 _F0	=	0x00d5
                           0000D6   239 _AC	=	0x00d6
                           0000D7   240 _CY	=	0x00d7
                                    241 ;--------------------------------------------------------
                                    242 ; overlayable register banks
                                    243 ;--------------------------------------------------------
                                    244 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        245 	.ds 8
                                    246 ;--------------------------------------------------------
                                    247 ; internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area DSEG    (DATA)
                           000030   250 _row_top	=	0x0030
                           000032   251 _row_bot	=	0x0032
                           000034   252 _level	=	0x0034
                           000035   253 _key_ch	=	0x0035
                           000036   254 _spare	=	0x0036
                           000037   255 _dino_row	=	0x0037
                           000038   256 _score	=	0x0038
                           000039   257 _gameover	=	0x0039
                           00003A   258 _carry	=	0x003a
                           00003B   259 _mask	=	0x003b
                                    260 ;--------------------------------------------------------
                                    261 ; overlayable items in internal ram
                                    262 ;--------------------------------------------------------
                                    263 ;--------------------------------------------------------
                                    264 ; Stack segment in internal ram
                                    265 ;--------------------------------------------------------
                                    266 	.area SSEG
      000021                        267 __start__stack:
      000021                        268 	.ds	1
                                    269 
                                    270 ;--------------------------------------------------------
                                    271 ; indirectly addressable internal ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area ISEG    (DATA)
                                    274 ;--------------------------------------------------------
                                    275 ; absolute internal ram data
                                    276 ;--------------------------------------------------------
                                    277 	.area IABS    (ABS,DATA)
                                    278 	.area IABS    (ABS,DATA)
                                    279 ;--------------------------------------------------------
                                    280 ; bit data
                                    281 ;--------------------------------------------------------
                                    282 	.area BSEG    (BIT)
      000000                        283 _keypad_ctrl_sloc0_1_0:
      000000                        284 	.ds 1
                                    285 ;--------------------------------------------------------
                                    286 ; paged external ram data
                                    287 ;--------------------------------------------------------
                                    288 	.area PSEG    (PAG,XDATA)
                                    289 ;--------------------------------------------------------
                                    290 ; uninitialized external ram data
                                    291 ;--------------------------------------------------------
                                    292 	.area XSEG    (XDATA)
                                    293 ;--------------------------------------------------------
                                    294 ; absolute external ram data
                                    295 ;--------------------------------------------------------
                                    296 	.area XABS    (ABS,XDATA)
                                    297 ;--------------------------------------------------------
                                    298 ; initialized external ram data
                                    299 ;--------------------------------------------------------
                                    300 	.area XISEG   (XDATA)
                                    301 	.area HOME    (CODE)
                                    302 	.area GSINIT0 (CODE)
                                    303 	.area GSINIT1 (CODE)
                                    304 	.area GSINIT2 (CODE)
                                    305 	.area GSINIT3 (CODE)
                                    306 	.area GSINIT4 (CODE)
                                    307 	.area GSINIT5 (CODE)
                                    308 	.area GSINIT  (CODE)
                                    309 	.area GSFINAL (CODE)
                                    310 	.area CSEG    (CODE)
                                    311 ;--------------------------------------------------------
                                    312 ; interrupt vector
                                    313 ;--------------------------------------------------------
                                    314 	.area HOME    (CODE)
      000000                        315 __interrupt_vect:
      000000 02 03 9B         [24]  316 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  317 	reti
      000004                        318 	.ds	7
      00000B 02 03 A2         [24]  319 	ljmp	_timer0_ISR
                                    320 ; restartable atomic support routines
      00000E                        321 	.ds	2
      000010                        322 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  323 	nop
      000011 00               [12]  324 	nop
      000012                        325 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  326 	movx	a, @r0
      000013 FB               [12]  327 	mov	r3, a
      000014 EA               [12]  328 	mov	a, r2
      000015 F2               [24]  329 	movx	@r0, a
      000016 80 2C            [24]  330 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  331 	nop
      000019 00               [12]  332 	nop
      00001A                        333 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  334 	movx	a, @dptr
      00001B FB               [12]  335 	mov	r3, a
      00001C EA               [12]  336 	mov	a, r2
      00001D F0               [24]  337 	movx	@dptr, a
      00001E 80 24            [24]  338 	sjmp	sdcc_atomic_exchange_exit
      000020                        339 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  340 	mov	a, @r0
      000021 B5 02 02         [24]  341 	cjne	a, ar2, .+#5
      000024 EB               [12]  342 	mov	a, r3
      000025 F6               [12]  343 	mov	@r0, a
      000026 22               [24]  344 	ret
      000027 00               [12]  345 	nop
      000028                        346 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  347 	movx	a, @r0
      000029 B5 02 02         [24]  348 	cjne	a, ar2, .+#5
      00002C EB               [12]  349 	mov	a, r3
      00002D F2               [24]  350 	movx	@r0, a
      00002E 22               [24]  351 	ret
      00002F 00               [12]  352 	nop
      000030                        353 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  354 	movx	a, @dptr
      000031 B5 02 02         [24]  355 	cjne	a, ar2, .+#5
      000034 EB               [12]  356 	mov	a, r3
      000035 F0               [24]  357 	movx	@dptr, a
      000036 22               [24]  358 	ret
      000037                        359 sdcc_atomic_exchange_rollback_end::
                                    360 
      000037                        361 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  362 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  363 	mov	r0, dpl
      00003C 20 F5 D3         [24]  364 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        365 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  366 	mov	a, r2
      000040 C6               [12]  367 	xch	a, @r0
      000041 F5 82            [12]  368 	mov	dpl, a
      000043 22               [24]  369 	ret
      000044                        370 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  371 	mov	dpl, r3
      000046 22               [24]  372 	ret
      000047                        373 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  374 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  375 	mov	r0, dpl
      00004C 20 F5 D9         [24]  376 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  377 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    378 ;--------------------------------------------------------
                                    379 ; global & static initialisations
                                    380 ;--------------------------------------------------------
                                    381 	.area HOME    (CODE)
                                    382 	.area GSINIT  (CODE)
                                    383 	.area GSFINAL (CODE)
                                    384 	.area GSINIT  (CODE)
                                    385 	.globl __sdcc_gsinit_startup
                                    386 	.globl __sdcc_program_startup
                                    387 	.globl __start__stack
                                    388 	.globl __mcs51_genXINIT
                                    389 	.globl __mcs51_genXRAMCLEAR
                                    390 	.globl __mcs51_genRAMCLEAR
                                    391 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  392 	ljmp	__sdcc_program_startup
                                    393 ;--------------------------------------------------------
                                    394 ; Home
                                    395 ;--------------------------------------------------------
                                    396 	.area HOME    (CODE)
                                    397 	.area HOME    (CODE)
      000051                        398 __sdcc_program_startup:
      000051 02 03 19         [24]  399 	ljmp	_main
                                    400 ;	return from main will return to caller
                                    401 ;--------------------------------------------------------
                                    402 ; code
                                    403 ;--------------------------------------------------------
                                    404 	.area CSEG    (CODE)
                                    405 ;------------------------------------------------------------
                                    406 ;Allocation info for local variables in function 'render_task'
                                    407 ;------------------------------------------------------------
                                    408 ;	dino.c:38: void render_task(void)
                                    409 ;	-----------------------------------------
                                    410 ;	 function render_task
                                    411 ;	-----------------------------------------
      000081                        412 _render_task:
                           000007   413 	ar7 = 0x07
                           000006   414 	ar6 = 0x06
                           000005   415 	ar5 = 0x05
                           000004   416 	ar4 = 0x04
                           000003   417 	ar3 = 0x03
                           000002   418 	ar2 = 0x02
                           000001   419 	ar1 = 0x01
                           000000   420 	ar0 = 0x00
                                    421 ;	dino.c:40: while (1) {
      000081                        422 00134$:
                                    423 ;	dino.c:41: EA = 0;
                                    424 ;	assignBit
      000081 C2 AF            [12]  425 	clr	_EA
                                    426 ;	dino.c:43: if (gameover) ThreadYield();
      000083 E5 39            [12]  427 	mov	a,_gameover
      000085 60 03            [24]  428 	jz	00102$
      000087 12 04 9C         [24]  429 	lcall	_ThreadYield
      00008A                        430 00102$:
                                    431 ;	dino.c:46: if (dino_row == 0 && (row_top[0] & 0x40)) { gameover = 1; ThreadYield(); }
      00008A E5 37            [12]  432 	mov	a,_dino_row
      00008C 70 0B            [24]  433 	jnz	00104$
      00008E E5 30            [12]  434 	mov	a,_row_top
      000090 30 E6 06         [24]  435 	jnb	acc.6,00104$
      000093 75 39 01         [24]  436 	mov	_gameover,#0x01
      000096 12 04 9C         [24]  437 	lcall	_ThreadYield
      000099                        438 00104$:
                                    439 ;	dino.c:47: if (dino_row == 1 && (row_bot[0] & 0x40)) { gameover = 1; ThreadYield(); }
      000099 74 01            [12]  440 	mov	a,#0x01
      00009B B5 37 0B         [24]  441 	cjne	a,_dino_row,00107$
      00009E E5 32            [12]  442 	mov	a,_row_bot
      0000A0 30 E6 06         [24]  443 	jnb	acc.6,00107$
      0000A3 75 39 01         [24]  444 	mov	_gameover,#0x01
      0000A6 12 04 9C         [24]  445 	lcall	_ThreadYield
      0000A9                        446 00107$:
                                    447 ;	dino.c:50: carry = 0;
      0000A9 75 3A 00         [24]  448 	mov	_carry,#0x00
                                    449 ;	dino.c:51: if (row_top[0] & 0x80) carry = 1;
      0000AC E5 30            [12]  450 	mov	a,_row_top
      0000AE 30 E7 03         [24]  451 	jnb	acc.7,00110$
      0000B1 75 3A 01         [24]  452 	mov	_carry,#0x01
      0000B4                        453 00110$:
                                    454 ;	dino.c:52: row_top[0] <<= 1;
      0000B4 E5 30            [12]  455 	mov	a,_row_top
      0000B6 25 30            [12]  456 	add	a,_row_top
      0000B8 F5 30            [12]  457 	mov	_row_top, a
                                    458 ;	dino.c:53: if (row_top[1] & 0x80) row_top[0]++;
      0000BA E5 31            [12]  459 	mov	a,(_row_top + 0x0001)
      0000BC 30 E7 05         [24]  460 	jnb	acc.7,00112$
      0000BF E5 30            [12]  461 	mov	a,_row_top
      0000C1 04               [12]  462 	inc	a
      0000C2 F5 30            [12]  463 	mov	_row_top,a
      0000C4                        464 00112$:
                                    465 ;	dino.c:54: row_top[1] <<= 1;
      0000C4 E5 31            [12]  466 	mov	a,(_row_top + 0x0001)
      0000C6 25 E0            [12]  467 	add	a,acc
      0000C8 F5 31            [12]  468 	mov	(_row_top + 0x0001), a
                                    469 ;	dino.c:55: if (carry) { score++; row_top[1]++; }
      0000CA E5 3A            [12]  470 	mov	a,_carry
      0000CC 60 0A            [24]  471 	jz	00114$
      0000CE E5 38            [12]  472 	mov	a,_score
      0000D0 04               [12]  473 	inc	a
      0000D1 F5 38            [12]  474 	mov	_score,a
      0000D3 E5 31            [12]  475 	mov	a,(_row_top + 0x0001)
      0000D5 04               [12]  476 	inc	a
      0000D6 F5 31            [12]  477 	mov	(_row_top + 0x0001),a
      0000D8                        478 00114$:
                                    479 ;	dino.c:58: carry = 0;
      0000D8 75 3A 00         [24]  480 	mov	_carry,#0x00
                                    481 ;	dino.c:59: if (row_bot[0] & 0x80) carry = 1;
      0000DB E5 32            [12]  482 	mov	a,_row_bot
      0000DD 30 E7 03         [24]  483 	jnb	acc.7,00116$
      0000E0 75 3A 01         [24]  484 	mov	_carry,#0x01
      0000E3                        485 00116$:
                                    486 ;	dino.c:60: row_bot[0] <<= 1;
      0000E3 E5 32            [12]  487 	mov	a,_row_bot
      0000E5 25 32            [12]  488 	add	a,_row_bot
      0000E7 F5 32            [12]  489 	mov	_row_bot, a
                                    490 ;	dino.c:61: if (row_bot[1] & 0x80) row_bot[0]++;
      0000E9 E5 33            [12]  491 	mov	a,(_row_bot + 0x0001)
      0000EB 30 E7 05         [24]  492 	jnb	acc.7,00118$
      0000EE E5 32            [12]  493 	mov	a,_row_bot
      0000F0 04               [12]  494 	inc	a
      0000F1 F5 32            [12]  495 	mov	_row_bot,a
      0000F3                        496 00118$:
                                    497 ;	dino.c:62: row_bot[1] <<= 1;
      0000F3 E5 33            [12]  498 	mov	a,(_row_bot + 0x0001)
      0000F5 25 E0            [12]  499 	add	a,acc
      0000F7 F5 33            [12]  500 	mov	(_row_bot + 0x0001), a
                                    501 ;	dino.c:63: if (carry) { score++; row_bot[1]++; }
      0000F9 E5 3A            [12]  502 	mov	a,_carry
      0000FB 60 0A            [24]  503 	jz	00120$
      0000FD E5 38            [12]  504 	mov	a,_score
      0000FF 04               [12]  505 	inc	a
      000100 F5 38            [12]  506 	mov	_score,a
      000102 E5 33            [12]  507 	mov	a,(_row_bot + 0x0001)
      000104 04               [12]  508 	inc	a
      000105 F5 33            [12]  509 	mov	(_row_bot + 0x0001),a
      000107                        510 00120$:
                                    511 ;	dino.c:66: LCD_cursorGoTo(0, 0);
      000107 75 82 80         [24]  512 	mov	dpl, #0x80
      00010A 12 05 CF         [24]  513 	lcall	_LCD_IRWrite
                                    514 ;	dino.c:67: mask = 0x80;
      00010D 75 3B 80         [24]  515 	mov	_mask,#0x80
                                    516 ;	dino.c:68: while (mask) {
      000110                        517 00121$:
      000110 E5 3B            [12]  518 	mov	a,_mask
      000112 60 19            [24]  519 	jz	00123$
                                    520 ;	dino.c:69: LCD_write_char((row_top[0] & mask) ? '\2' : ' ');
      000114 E5 3B            [12]  521 	mov	a,_mask
      000116 55 30            [12]  522 	anl	a,_row_top
      000118 60 04            [24]  523 	jz	00138$
      00011A 7F 02            [12]  524 	mov	r7,#0x02
      00011C 80 02            [24]  525 	sjmp	00139$
      00011E                        526 00138$:
      00011E 7F 20            [12]  527 	mov	r7,#0x20
      000120                        528 00139$:
      000120 8F 82            [24]  529 	mov	dpl,r7
      000122 12 06 1B         [24]  530 	lcall	_LCD_write_char
                                    531 ;	dino.c:70: mask >>= 1;
      000125 E5 3B            [12]  532 	mov	a,_mask
      000127 C3               [12]  533 	clr	c
      000128 13               [12]  534 	rrc	a
      000129 F5 3B            [12]  535 	mov	_mask,a
      00012B 80 E3            [24]  536 	sjmp	00121$
      00012D                        537 00123$:
                                    538 ;	dino.c:72: mask = 0x80;
      00012D 75 3B 80         [24]  539 	mov	_mask,#0x80
                                    540 ;	dino.c:73: while (mask != 1) {
      000130                        541 00124$:
      000130 74 01            [12]  542 	mov	a,#0x01
      000132 B5 3B 02         [24]  543 	cjne	a,_mask,00304$
      000135 80 19            [24]  544 	sjmp	00126$
      000137                        545 00304$:
                                    546 ;	dino.c:74: LCD_write_char((row_top[1] & mask) ? '\2' : ' ');
      000137 E5 3B            [12]  547 	mov	a,_mask
      000139 55 31            [12]  548 	anl	a,(_row_top + 0x0001)
      00013B 60 04            [24]  549 	jz	00140$
      00013D 7F 02            [12]  550 	mov	r7,#0x02
      00013F 80 02            [24]  551 	sjmp	00141$
      000141                        552 00140$:
      000141 7F 20            [12]  553 	mov	r7,#0x20
      000143                        554 00141$:
      000143 8F 82            [24]  555 	mov	dpl,r7
      000145 12 06 1B         [24]  556 	lcall	_LCD_write_char
                                    557 ;	dino.c:75: mask >>= 1;
      000148 E5 3B            [12]  558 	mov	a,_mask
      00014A C3               [12]  559 	clr	c
      00014B 13               [12]  560 	rrc	a
      00014C F5 3B            [12]  561 	mov	_mask,a
      00014E 80 E0            [24]  562 	sjmp	00124$
      000150                        563 00126$:
                                    564 ;	dino.c:79: LCD_cursorGoTo(1, 0);
      000150 75 82 C0         [24]  565 	mov	dpl, #0xc0
      000153 12 05 CF         [24]  566 	lcall	_LCD_IRWrite
                                    567 ;	dino.c:80: mask = 0x80;
      000156 75 3B 80         [24]  568 	mov	_mask,#0x80
                                    569 ;	dino.c:81: while (mask) {
      000159                        570 00127$:
      000159 E5 3B            [12]  571 	mov	a,_mask
      00015B 60 19            [24]  572 	jz	00129$
                                    573 ;	dino.c:82: LCD_write_char((row_bot[0] & mask) ? '\2' : ' ');
      00015D E5 3B            [12]  574 	mov	a,_mask
      00015F 55 32            [12]  575 	anl	a,_row_bot
      000161 60 04            [24]  576 	jz	00142$
      000163 7F 02            [12]  577 	mov	r7,#0x02
      000165 80 02            [24]  578 	sjmp	00143$
      000167                        579 00142$:
      000167 7F 20            [12]  580 	mov	r7,#0x20
      000169                        581 00143$:
      000169 8F 82            [24]  582 	mov	dpl,r7
      00016B 12 06 1B         [24]  583 	lcall	_LCD_write_char
                                    584 ;	dino.c:83: mask >>= 1;
      00016E E5 3B            [12]  585 	mov	a,_mask
      000170 C3               [12]  586 	clr	c
      000171 13               [12]  587 	rrc	a
      000172 F5 3B            [12]  588 	mov	_mask,a
      000174 80 E3            [24]  589 	sjmp	00127$
      000176                        590 00129$:
                                    591 ;	dino.c:85: mask = 0x80;
      000176 75 3B 80         [24]  592 	mov	_mask,#0x80
                                    593 ;	dino.c:86: while (mask != 1) {
      000179                        594 00130$:
      000179 74 01            [12]  595 	mov	a,#0x01
      00017B B5 3B 02         [24]  596 	cjne	a,_mask,00308$
      00017E 80 19            [24]  597 	sjmp	00132$
      000180                        598 00308$:
                                    599 ;	dino.c:87: LCD_write_char((row_bot[1] & mask) ? '\2' : ' ');
      000180 E5 3B            [12]  600 	mov	a,_mask
      000182 55 33            [12]  601 	anl	a,(_row_bot + 0x0001)
      000184 60 04            [24]  602 	jz	00144$
      000186 7F 02            [12]  603 	mov	r7,#0x02
      000188 80 02            [24]  604 	sjmp	00145$
      00018A                        605 00144$:
      00018A 7F 20            [12]  606 	mov	r7,#0x20
      00018C                        607 00145$:
      00018C 8F 82            [24]  608 	mov	dpl,r7
      00018E 12 06 1B         [24]  609 	lcall	_LCD_write_char
                                    610 ;	dino.c:88: mask >>= 1;
      000191 E5 3B            [12]  611 	mov	a,_mask
      000193 C3               [12]  612 	clr	c
      000194 13               [12]  613 	rrc	a
      000195 F5 3B            [12]  614 	mov	_mask,a
      000197 80 E0            [24]  615 	sjmp	00130$
      000199                        616 00132$:
                                    617 ;	dino.c:92: LCD_cursorGoTo(dino_row, 0);
      000199 E5 37            [12]  618 	mov	a,_dino_row
      00019B 03               [12]  619 	rr	a
      00019C 03               [12]  620 	rr	a
      00019D 54 C0            [12]  621 	anl	a,#0xc0
      00019F FF               [12]  622 	mov	r7,a
      0001A0 74 80            [12]  623 	mov	a,#0x80
      0001A2 4F               [12]  624 	orl	a,r7
      0001A3 F5 82            [12]  625 	mov	dpl,a
      0001A5 12 05 CF         [24]  626 	lcall	_LCD_IRWrite
                                    627 ;	dino.c:93: LCD_write_char('\1');
      0001A8 75 82 01         [24]  628 	mov	dpl, #0x01
      0001AB 12 06 1B         [24]  629 	lcall	_LCD_write_char
                                    630 ;	dino.c:95: EA = 1;
                                    631 ;	assignBit
      0001AE D2 AF            [12]  632 	setb	_EA
                                    633 ;	dino.c:96: ThreadYield();
      0001B0 12 04 9C         [24]  634 	lcall	_ThreadYield
                                    635 ;	dino.c:98: }
      0001B3 02 00 81         [24]  636 	ljmp	00134$
                                    637 ;------------------------------------------------------------
                                    638 ;Allocation info for local variables in function 'keypad_ctrl'
                                    639 ;------------------------------------------------------------
                                    640 ;	dino.c:105: void keypad_ctrl(void)
                                    641 ;	-----------------------------------------
                                    642 ;	 function keypad_ctrl
                                    643 ;	-----------------------------------------
      0001B6                        644 _keypad_ctrl:
                                    645 ;	dino.c:108: while (!AnyKeyPressed());
      0001B6                        646 00101$:
      0001B6 12 07 95         [24]  647 	lcall	_AnyKeyPressed
      0001B9 E5 82            [12]  648 	mov	a, dpl
      0001BB 60 F9            [24]  649 	jz	00101$
                                    650 ;	dino.c:109: key_ch = KeyToChar();
      0001BD 12 07 A2         [24]  651 	lcall	_KeyToChar
      0001C0 85 82 35         [24]  652 	mov	_key_ch,dpl
                                    653 ;	dino.c:124: }
      0001C3 D2 00            [12]  654 	setb	_keypad_ctrl_sloc0_1_0
      0001C5 10 AF 02         [24]  655 	jbc	ea,00183$
      0001C8 C2 00            [12]  656 	clr	_keypad_ctrl_sloc0_1_0
      0001CA                        657 00183$:
                                    658 ;	dino.c:112: if (key_ch == '2' && dino_row == 1) {
      0001CA 74 32            [12]  659 	mov	a,#0x32
      0001CC B5 35 2B         [24]  660 	cjne	a,_key_ch,00107$
      0001CF 74 01            [12]  661 	mov	a,#0x01
      0001D1 B5 37 26         [24]  662 	cjne	a,_dino_row,00107$
                                    663 ;	dino.c:113: if (row_top[0] & 0x80) { gameover = 1; ThreadYield(); }
      0001D4 E5 30            [12]  664 	mov	a,_row_top
      0001D6 30 E7 06         [24]  665 	jnb	acc.7,00105$
      0001D9 75 39 01         [24]  666 	mov	_gameover,#0x01
      0001DC 12 04 9C         [24]  667 	lcall	_ThreadYield
      0001DF                        668 00105$:
                                    669 ;	dino.c:114: dino_row = 0;
      0001DF 75 37 00         [24]  670 	mov	_dino_row,#0x00
                                    671 ;	dino.c:115: LCD_cursorGoTo(1, 0); LCD_write_char(' ');
      0001E2 75 82 C0         [24]  672 	mov	dpl, #0xc0
      0001E5 12 05 CF         [24]  673 	lcall	_LCD_IRWrite
      0001E8 75 82 20         [24]  674 	mov	dpl, #0x20
      0001EB 12 06 1B         [24]  675 	lcall	_LCD_write_char
                                    676 ;	dino.c:116: LCD_cursorGoTo(0, 0); LCD_write_char('\1');
      0001EE 75 82 80         [24]  677 	mov	dpl, #0x80
      0001F1 12 05 CF         [24]  678 	lcall	_LCD_IRWrite
      0001F4 75 82 01         [24]  679 	mov	dpl, #0x01
      0001F7 12 06 1B         [24]  680 	lcall	_LCD_write_char
      0001FA                        681 00107$:
                                    682 ;	dino.c:118: if (key_ch == '8' && dino_row == 0) {
      0001FA 74 38            [12]  683 	mov	a,#0x38
      0001FC B5 35 2A         [24]  684 	cjne	a,_key_ch,00112$
      0001FF E5 37            [12]  685 	mov	a,_dino_row
      000201 70 26            [24]  686 	jnz	00112$
                                    687 ;	dino.c:119: if (row_bot[0] & 0x80) { gameover = 1; ThreadYield(); }
      000203 E5 32            [12]  688 	mov	a,_row_bot
      000205 30 E7 06         [24]  689 	jnb	acc.7,00110$
      000208 75 39 01         [24]  690 	mov	_gameover,#0x01
      00020B 12 04 9C         [24]  691 	lcall	_ThreadYield
      00020E                        692 00110$:
                                    693 ;	dino.c:120: dino_row = 1;
      00020E 75 37 01         [24]  694 	mov	_dino_row,#0x01
                                    695 ;	dino.c:121: LCD_cursorGoTo(0, 0); LCD_write_char(' ');
      000211 75 82 80         [24]  696 	mov	dpl, #0x80
      000214 12 05 CF         [24]  697 	lcall	_LCD_IRWrite
      000217 75 82 20         [24]  698 	mov	dpl, #0x20
      00021A 12 06 1B         [24]  699 	lcall	_LCD_write_char
                                    700 ;	dino.c:122: LCD_cursorGoTo(1, 0); LCD_write_char('\1');
      00021D 75 82 C0         [24]  701 	mov	dpl, #0xc0
      000220 12 05 CF         [24]  702 	lcall	_LCD_IRWrite
      000223 75 82 01         [24]  703 	mov	dpl, #0x01
      000226 12 06 1B         [24]  704 	lcall	_LCD_write_char
      000229                        705 00112$:
      000229 A2 00            [12]  706 	mov	c,_keypad_ctrl_sloc0_1_0
      00022B 92 AF            [24]  707 	mov	ea,c
                                    708 ;	dino.c:126: while (AnyKeyPressed());
      00022D                        709 00114$:
      00022D 12 07 95         [24]  710 	lcall	_AnyKeyPressed
      000230 E5 82            [12]  711 	mov	a, dpl
      000232 70 F9            [24]  712 	jnz	00114$
                                    713 ;	dino.c:128: }
      000234 02 01 B6         [24]  714 	ljmp	00101$
                                    715 ;------------------------------------------------------------
                                    716 ;Allocation info for local variables in function 'game_ctrl'
                                    717 ;------------------------------------------------------------
                                    718 ;	dino.c:134: void game_ctrl(void)
                                    719 ;	-----------------------------------------
                                    720 ;	 function game_ctrl
                                    721 ;	-----------------------------------------
      000237                        722 _game_ctrl:
                                    723 ;	dino.c:136: while (1){
      000237                        724 00104$:
                                    725 ;	dino.c:137: if(gameover){
      000237 E5 39            [12]  726 	mov	a,_gameover
      000239 70 03            [24]  727 	jnz	00120$
      00023B 02 03 13         [24]  728 	ljmp	00102$
      00023E                        729 00120$:
                                    730 ;	dino.c:138: EA = 0;
                                    731 ;	assignBit
      00023E C2 AF            [12]  732 	clr	_EA
                                    733 ;	dino.c:139: LCD_cursorGoTo(0, 0);
      000240 75 82 80         [24]  734 	mov	dpl, #0x80
      000243 12 05 CF         [24]  735 	lcall	_LCD_IRWrite
                                    736 ;	dino.c:140: LCD_write_char('G');
      000246 75 82 47         [24]  737 	mov	dpl, #0x47
      000249 12 06 1B         [24]  738 	lcall	_LCD_write_char
                                    739 ;	dino.c:141: LCD_write_char('A');
      00024C 75 82 41         [24]  740 	mov	dpl, #0x41
      00024F 12 06 1B         [24]  741 	lcall	_LCD_write_char
                                    742 ;	dino.c:142: LCD_write_char('M');
      000252 75 82 4D         [24]  743 	mov	dpl, #0x4d
      000255 12 06 1B         [24]  744 	lcall	_LCD_write_char
                                    745 ;	dino.c:143: LCD_write_char('E');
      000258 75 82 45         [24]  746 	mov	dpl, #0x45
      00025B 12 06 1B         [24]  747 	lcall	_LCD_write_char
                                    748 ;	dino.c:144: LCD_write_char(' ');
      00025E 75 82 20         [24]  749 	mov	dpl, #0x20
      000261 12 06 1B         [24]  750 	lcall	_LCD_write_char
                                    751 ;	dino.c:145: LCD_write_char('O');
      000264 75 82 4F         [24]  752 	mov	dpl, #0x4f
      000267 12 06 1B         [24]  753 	lcall	_LCD_write_char
                                    754 ;	dino.c:146: LCD_write_char('V');
      00026A 75 82 56         [24]  755 	mov	dpl, #0x56
      00026D 12 06 1B         [24]  756 	lcall	_LCD_write_char
                                    757 ;	dino.c:147: LCD_write_char('E');
      000270 75 82 45         [24]  758 	mov	dpl, #0x45
      000273 12 06 1B         [24]  759 	lcall	_LCD_write_char
                                    760 ;	dino.c:148: LCD_write_char('R');
      000276 75 82 52         [24]  761 	mov	dpl, #0x52
      000279 12 06 1B         [24]  762 	lcall	_LCD_write_char
                                    763 ;	dino.c:149: LCD_write_char(' ');
      00027C 75 82 20         [24]  764 	mov	dpl, #0x20
      00027F 12 06 1B         [24]  765 	lcall	_LCD_write_char
                                    766 ;	dino.c:150: LCD_write_char(' ');
      000282 75 82 20         [24]  767 	mov	dpl, #0x20
      000285 12 06 1B         [24]  768 	lcall	_LCD_write_char
                                    769 ;	dino.c:151: LCD_write_char(' ');
      000288 75 82 20         [24]  770 	mov	dpl, #0x20
      00028B 12 06 1B         [24]  771 	lcall	_LCD_write_char
                                    772 ;	dino.c:152: LCD_write_char(' ');
      00028E 75 82 20         [24]  773 	mov	dpl, #0x20
      000291 12 06 1B         [24]  774 	lcall	_LCD_write_char
                                    775 ;	dino.c:153: LCD_write_char(' ');
      000294 75 82 20         [24]  776 	mov	dpl, #0x20
      000297 12 06 1B         [24]  777 	lcall	_LCD_write_char
                                    778 ;	dino.c:154: LCD_write_char(' ');
      00029A 75 82 20         [24]  779 	mov	dpl, #0x20
      00029D 12 06 1B         [24]  780 	lcall	_LCD_write_char
                                    781 ;	dino.c:155: LCD_cursorGoTo(1, 0);
      0002A0 75 82 C0         [24]  782 	mov	dpl, #0xc0
      0002A3 12 05 CF         [24]  783 	lcall	_LCD_IRWrite
                                    784 ;	dino.c:156: LCD_write_char('S');
      0002A6 75 82 53         [24]  785 	mov	dpl, #0x53
      0002A9 12 06 1B         [24]  786 	lcall	_LCD_write_char
                                    787 ;	dino.c:157: LCD_write_char('c');
      0002AC 75 82 63         [24]  788 	mov	dpl, #0x63
      0002AF 12 06 1B         [24]  789 	lcall	_LCD_write_char
                                    790 ;	dino.c:158: LCD_write_char('o');
      0002B2 75 82 6F         [24]  791 	mov	dpl, #0x6f
      0002B5 12 06 1B         [24]  792 	lcall	_LCD_write_char
                                    793 ;	dino.c:159: LCD_write_char('r');
      0002B8 75 82 72         [24]  794 	mov	dpl, #0x72
      0002BB 12 06 1B         [24]  795 	lcall	_LCD_write_char
                                    796 ;	dino.c:160: LCD_write_char('e');
      0002BE 75 82 65         [24]  797 	mov	dpl, #0x65
      0002C1 12 06 1B         [24]  798 	lcall	_LCD_write_char
                                    799 ;	dino.c:161: LCD_write_char(' ');
      0002C4 75 82 20         [24]  800 	mov	dpl, #0x20
      0002C7 12 06 1B         [24]  801 	lcall	_LCD_write_char
                                    802 ;	dino.c:162: LCD_write_char(':');
      0002CA 75 82 3A         [24]  803 	mov	dpl, #0x3a
      0002CD 12 06 1B         [24]  804 	lcall	_LCD_write_char
                                    805 ;	dino.c:163: LCD_write_char(score/10 + '0');
      0002D0 AF 38            [24]  806 	mov	r7,_score
      0002D2 75 F0 0A         [24]  807 	mov	b,#0x0a
      0002D5 EF               [12]  808 	mov	a,r7
      0002D6 84               [48]  809 	div	ab
      0002D7 24 30            [12]  810 	add	a,#0x30
      0002D9 F5 82            [12]  811 	mov	dpl,a
      0002DB 12 06 1B         [24]  812 	lcall	_LCD_write_char
                                    813 ;	dino.c:164: LCD_write_char(score%10 + '0');
      0002DE AF 38            [24]  814 	mov	r7,_score
      0002E0 75 F0 0A         [24]  815 	mov	b,#0x0a
      0002E3 EF               [12]  816 	mov	a,r7
      0002E4 84               [48]  817 	div	ab
      0002E5 AF F0            [24]  818 	mov	r7,b
      0002E7 74 30            [12]  819 	mov	a,#0x30
      0002E9 2F               [12]  820 	add	a, r7
      0002EA F5 82            [12]  821 	mov	dpl,a
      0002EC 12 06 1B         [24]  822 	lcall	_LCD_write_char
                                    823 ;	dino.c:165: LCD_write_char(' ');
      0002EF 75 82 20         [24]  824 	mov	dpl, #0x20
      0002F2 12 06 1B         [24]  825 	lcall	_LCD_write_char
                                    826 ;	dino.c:166: LCD_write_char(' ');
      0002F5 75 82 20         [24]  827 	mov	dpl, #0x20
      0002F8 12 06 1B         [24]  828 	lcall	_LCD_write_char
                                    829 ;	dino.c:167: LCD_write_char(' ');
      0002FB 75 82 20         [24]  830 	mov	dpl, #0x20
      0002FE 12 06 1B         [24]  831 	lcall	_LCD_write_char
                                    832 ;	dino.c:168: LCD_write_char(' ');
      000301 75 82 20         [24]  833 	mov	dpl, #0x20
      000304 12 06 1B         [24]  834 	lcall	_LCD_write_char
                                    835 ;	dino.c:169: LCD_write_char(' ');
      000307 75 82 20         [24]  836 	mov	dpl, #0x20
      00030A 12 06 1B         [24]  837 	lcall	_LCD_write_char
                                    838 ;	dino.c:170: LCD_write_char(' ');
      00030D 75 82 20         [24]  839 	mov	dpl, #0x20
                                    840 ;	dino.c:171: return;
      000310 02 06 1B         [24]  841 	ljmp	_LCD_write_char
      000313                        842 00102$:
                                    843 ;	dino.c:173: ThreadYield();
      000313 12 04 9C         [24]  844 	lcall	_ThreadYield
                                    845 ;	dino.c:175: }
      000316 02 02 37         [24]  846 	ljmp	00104$
                                    847 ;------------------------------------------------------------
                                    848 ;Allocation info for local variables in function 'main'
                                    849 ;------------------------------------------------------------
                                    850 ;	dino.c:183: void main(void)
                                    851 ;	-----------------------------------------
                                    852 ;	 function main
                                    853 ;	-----------------------------------------
      000319                        854 _main:
                                    855 ;	dino.c:185: Init_Keypad();
      000319 12 07 8F         [24]  856 	lcall	_Init_Keypad
                                    857 ;	dino.c:186: LCD_Init();
      00031C 12 05 6E         [24]  858 	lcall	_LCD_Init
                                    859 ;	dino.c:187: LCD_entryModeSet(1, 1);
      00031F 75 82 07         [24]  860 	mov	dpl, #0x07
      000322 12 05 CF         [24]  861 	lcall	_LCD_IRWrite
                                    862 ;	dino.c:188: LCD_displayOnOffControl(1, 0, 0);
      000325 75 82 0C         [24]  863 	mov	dpl, #0x0c
      000328 12 05 CF         [24]  864 	lcall	_LCD_IRWrite
                                    865 ;	dino.c:190: do {
      00032B                        866 00117$:
                                    867 ;	dino.c:192: row_top[0] = 0x21;  row_top[1] = 0xC4;
      00032B 75 30 21         [24]  868 	mov	_row_top,#0x21
      00032E 75 31 C4         [24]  869 	mov	(_row_top + 0x0001),#0xc4
                                    870 ;	dino.c:193: row_bot[0] = 0x08;  row_bot[1] = 0x11;
      000331 75 32 08         [24]  871 	mov	_row_bot,#0x08
      000334 75 33 11         [24]  872 	mov	(_row_bot + 0x0001),#0x11
                                    873 ;	dino.c:195: EA       = 0;
                                    874 ;	assignBit
      000337 C2 AF            [12]  875 	clr	_EA
                                    876 ;	dino.c:196: level    = 0;
      000339 75 34 00         [24]  877 	mov	_level,#0x00
                                    878 ;	dino.c:197: gameover = 0;
      00033C 75 39 00         [24]  879 	mov	_gameover,#0x00
                                    880 ;	dino.c:198: score    = 0;
      00033F 75 38 00         [24]  881 	mov	_score,#0x00
                                    882 ;	dino.c:199: dino_row = 0;
      000342 75 37 00         [24]  883 	mov	_dino_row,#0x00
                                    884 ;	dino.c:203: while (!AnyKeyPressed());
      000345                        885 00101$:
      000345 12 07 95         [24]  886 	lcall	_AnyKeyPressed
      000348 E5 82            [12]  887 	mov	a, dpl
      00034A 60 F9            [24]  888 	jz	00101$
                                    889 ;	dino.c:204: key_ch = KeyToChar();
      00034C 12 07 A2         [24]  890 	lcall	_KeyToChar
      00034F 85 82 35         [24]  891 	mov	_key_ch,dpl
                                    892 ;	dino.c:205: while (AnyKeyPressed());
      000352                        893 00104$:
      000352 12 07 95         [24]  894 	lcall	_AnyKeyPressed
      000355 E5 82            [12]  895 	mov	a, dpl
      000357 70 F9            [24]  896 	jnz	00104$
                                    897 ;	dino.c:206: if (key_ch == '#') {
      000359 74 23            [12]  898 	mov	a,#0x23
      00035B B5 35 06         [24]  899 	cjne	a,_key_ch,00111$
                                    900 ;	dino.c:207: if (level == 0) continue;
      00035E E5 34            [12]  901 	mov	a,_level
      000360 70 11            [24]  902 	jnz	00116$
                                    903 ;	dino.c:208: else            break;
      000362 80 E1            [24]  904 	sjmp	00101$
      000364                        905 00111$:
                                    906 ;	dino.c:210: if (key_ch == '*') continue;
      000364 74 2A            [12]  907 	mov	a,#0x2a
      000366 B5 35 02         [24]  908 	cjne	a,_key_ch,00175$
      000369 80 DA            [24]  909 	sjmp	00101$
      00036B                        910 00175$:
                                    911 ;	dino.c:211: level = key_ch - '0';
      00036B E5 35            [12]  912 	mov	a,_key_ch
      00036D 24 D0            [12]  913 	add	a,#0xd0
      00036F F5 34            [12]  914 	mov	_level,a
      000371 80 D2            [24]  915 	sjmp	00101$
      000373                        916 00116$:
                                    917 ;	dino.c:214: ThreadCreate(render_task);
      000373 90 00 81         [24]  918 	mov	dptr,#_render_task
      000376 12 04 22         [24]  919 	lcall	_ThreadCreate
                                    920 ;	dino.c:215: ThreadCreate(keypad_ctrl);
      000379 90 01 B6         [24]  921 	mov	dptr,#_keypad_ctrl
      00037C 12 04 22         [24]  922 	lcall	_ThreadCreate
                                    923 ;	dino.c:217: TMOD = 0;            /* Timer 0 mode 0 (13-bit) */
      00037F 75 89 00         [24]  924 	mov	_TMOD,#0x00
                                    925 ;	dino.c:218: TH0  = (level << 4);
      000382 E5 34            [12]  926 	mov	a,_level
      000384 C4               [12]  927 	swap	a
      000385 54 F0            [12]  928 	anl	a,#0xf0
      000387 F5 8C            [12]  929 	mov	_TH0,a
                                    930 ;	dino.c:219: TL0  = 0x00;
      000389 75 8A 00         [24]  931 	mov	_TL0,#0x00
                                    932 ;	dino.c:220: IE   = 0x82;         /* enable Timer 0 interrupt */
      00038C 75 A8 82         [24]  933 	mov	_IE,#0x82
                                    934 ;	dino.c:221: TR0  = 1;
                                    935 ;	assignBit
      00038F D2 8C            [12]  936 	setb	_TR0
                                    937 ;	dino.c:223: game_ctrl();
      000391 12 02 37         [24]  938 	lcall	_game_ctrl
                                    939 ;	dino.c:225: EA = 0;
                                    940 ;	assignBit
      000394 C2 AF            [12]  941 	clr	_EA
                                    942 ;	dino.c:226: ThreadReset();
      000396 12 05 66         [24]  943 	lcall	_ThreadReset
                                    944 ;	dino.c:227: } while (1);
                                    945 ;	dino.c:228: }
      000399 80 90            [24]  946 	sjmp	00117$
                                    947 ;------------------------------------------------------------
                                    948 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    949 ;------------------------------------------------------------
                                    950 ;	dino.c:230: void _sdcc_gsinit_startup(void) { __asm LJMP _Bootstrap __endasm; }
                                    951 ;	-----------------------------------------
                                    952 ;	 function _sdcc_gsinit_startup
                                    953 ;	-----------------------------------------
      00039B                        954 __sdcc_gsinit_startup:
      00039B 02 03 A8         [24]  955 	LJMP	_Bootstrap 
      00039E 22               [24]  956 	ret
                                    957 ;------------------------------------------------------------
                                    958 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    959 ;------------------------------------------------------------
                                    960 ;	dino.c:231: void _mcs51_genRAMCLEAR(void)   {}
                                    961 ;	-----------------------------------------
                                    962 ;	 function _mcs51_genRAMCLEAR
                                    963 ;	-----------------------------------------
      00039F                        964 __mcs51_genRAMCLEAR:
      00039F 22               [24]  965 	ret
                                    966 ;------------------------------------------------------------
                                    967 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    968 ;------------------------------------------------------------
                                    969 ;	dino.c:232: void _mcs51_genXINIT(void)      {}
                                    970 ;	-----------------------------------------
                                    971 ;	 function _mcs51_genXINIT
                                    972 ;	-----------------------------------------
      0003A0                        973 __mcs51_genXINIT:
      0003A0 22               [24]  974 	ret
                                    975 ;------------------------------------------------------------
                                    976 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    977 ;------------------------------------------------------------
                                    978 ;	dino.c:233: void _mcs51_genXRAMCLEAR(void)  {}
                                    979 ;	-----------------------------------------
                                    980 ;	 function _mcs51_genXRAMCLEAR
                                    981 ;	-----------------------------------------
      0003A1                        982 __mcs51_genXRAMCLEAR:
      0003A1 22               [24]  983 	ret
                                    984 ;------------------------------------------------------------
                                    985 ;Allocation info for local variables in function 'timer0_ISR'
                                    986 ;------------------------------------------------------------
                                    987 ;	dino.c:234: void timer0_ISR(void) __interrupt(1) { __asm ljmp _myTimer0Handler __endasm; }
                                    988 ;	-----------------------------------------
                                    989 ;	 function timer0_ISR
                                    990 ;	-----------------------------------------
      0003A2                        991 _timer0_ISR:
      0003A2 02 03 C6         [24]  992 	ljmp	_myTimer0Handler 
      0003A5 02 00 54         [24]  993 	ljmp	sdcc_atomic_maybe_rollback
                                    994 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    995 ;	eliminated unneeded push/pop not_psw
                                    996 ;	eliminated unneeded push/pop dpl
                                    997 ;	eliminated unneeded push/pop dph
                                    998 ;	eliminated unneeded push/pop b
                                    999 ;	eliminated unneeded push/pop acc
                                   1000 	.area CSEG    (CODE)
                                   1001 	.area CONST   (CODE)
                                   1002 	.area XINIT   (CODE)
                                   1003 	.area CABS    (ABS,CODE)
