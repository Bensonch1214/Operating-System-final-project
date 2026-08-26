                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module lcdlib
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CY
                                     12 	.globl _AC
                                     13 	.globl _F0
                                     14 	.globl _RS1
                                     15 	.globl _RS0
                                     16 	.globl _OV
                                     17 	.globl _F1
                                     18 	.globl _P
                                     19 	.globl _PS
                                     20 	.globl _PT1
                                     21 	.globl _PX1
                                     22 	.globl _PT0
                                     23 	.globl _PX0
                                     24 	.globl _RD
                                     25 	.globl _WR
                                     26 	.globl _T1
                                     27 	.globl _T0
                                     28 	.globl _INT1
                                     29 	.globl _INT0
                                     30 	.globl _TXD
                                     31 	.globl _RXD
                                     32 	.globl _P3_7
                                     33 	.globl _P3_6
                                     34 	.globl _P3_5
                                     35 	.globl _P3_4
                                     36 	.globl _P3_3
                                     37 	.globl _P3_2
                                     38 	.globl _P3_1
                                     39 	.globl _P3_0
                                     40 	.globl _EA
                                     41 	.globl _ES
                                     42 	.globl _ET1
                                     43 	.globl _EX1
                                     44 	.globl _ET0
                                     45 	.globl _EX0
                                     46 	.globl _P2_7
                                     47 	.globl _P2_6
                                     48 	.globl _P2_5
                                     49 	.globl _P2_4
                                     50 	.globl _P2_3
                                     51 	.globl _P2_2
                                     52 	.globl _P2_1
                                     53 	.globl _P2_0
                                     54 	.globl _SM0
                                     55 	.globl _SM1
                                     56 	.globl _SM2
                                     57 	.globl _REN
                                     58 	.globl _TB8
                                     59 	.globl _RB8
                                     60 	.globl _TI
                                     61 	.globl _RI
                                     62 	.globl _P1_7
                                     63 	.globl _P1_6
                                     64 	.globl _P1_5
                                     65 	.globl _P1_4
                                     66 	.globl _P1_3
                                     67 	.globl _P1_2
                                     68 	.globl _P1_1
                                     69 	.globl _P1_0
                                     70 	.globl _TF1
                                     71 	.globl _TR1
                                     72 	.globl _TF0
                                     73 	.globl _TR0
                                     74 	.globl _IE1
                                     75 	.globl _IT1
                                     76 	.globl _IE0
                                     77 	.globl _IT0
                                     78 	.globl _P0_7
                                     79 	.globl _P0_6
                                     80 	.globl _P0_5
                                     81 	.globl _P0_4
                                     82 	.globl _P0_3
                                     83 	.globl _P0_2
                                     84 	.globl _P0_1
                                     85 	.globl _P0_0
                                     86 	.globl _B
                                     87 	.globl _ACC
                                     88 	.globl _PSW
                                     89 	.globl _IP
                                     90 	.globl _P3
                                     91 	.globl _IE
                                     92 	.globl _P2
                                     93 	.globl _SBUF
                                     94 	.globl _SCON
                                     95 	.globl _P1
                                     96 	.globl _TH1
                                     97 	.globl _TH0
                                     98 	.globl _TL1
                                     99 	.globl _TL0
                                    100 	.globl _TMOD
                                    101 	.globl _TCON
                                    102 	.globl _PCON
                                    103 	.globl _DPH
                                    104 	.globl _DPL
                                    105 	.globl _SP
                                    106 	.globl _P0
                                    107 	.globl _LCD_set_symbol_PARM_2
                                    108 	.globl _lcd_ready
                                    109 	.globl _LCD_ready
                                    110 	.globl _LCD_Init
                                    111 	.globl _LCD_IRWrite
                                    112 	.globl _LCD_functionSet
                                    113 	.globl _LCD_write_char
                                    114 	.globl _LCD_write_string
                                    115 	.globl _delay
                                    116 	.globl _LCD_set_symbol
                                    117 ;--------------------------------------------------------
                                    118 ; special function registers
                                    119 ;--------------------------------------------------------
                                    120 	.area RSEG    (ABS,DATA)
      000000                        121 	.org 0x0000
                           000080   122 _P0	=	0x0080
                           000081   123 _SP	=	0x0081
                           000082   124 _DPL	=	0x0082
                           000083   125 _DPH	=	0x0083
                           000087   126 _PCON	=	0x0087
                           000088   127 _TCON	=	0x0088
                           000089   128 _TMOD	=	0x0089
                           00008A   129 _TL0	=	0x008a
                           00008B   130 _TL1	=	0x008b
                           00008C   131 _TH0	=	0x008c
                           00008D   132 _TH1	=	0x008d
                           000090   133 _P1	=	0x0090
                           000098   134 _SCON	=	0x0098
                           000099   135 _SBUF	=	0x0099
                           0000A0   136 _P2	=	0x00a0
                           0000A8   137 _IE	=	0x00a8
                           0000B0   138 _P3	=	0x00b0
                           0000B8   139 _IP	=	0x00b8
                           0000D0   140 _PSW	=	0x00d0
                           0000E0   141 _ACC	=	0x00e0
                           0000F0   142 _B	=	0x00f0
                                    143 ;--------------------------------------------------------
                                    144 ; special function bits
                                    145 ;--------------------------------------------------------
                                    146 	.area RSEG    (ABS,DATA)
      000000                        147 	.org 0x0000
                           000080   148 _P0_0	=	0x0080
                           000081   149 _P0_1	=	0x0081
                           000082   150 _P0_2	=	0x0082
                           000083   151 _P0_3	=	0x0083
                           000084   152 _P0_4	=	0x0084
                           000085   153 _P0_5	=	0x0085
                           000086   154 _P0_6	=	0x0086
                           000087   155 _P0_7	=	0x0087
                           000088   156 _IT0	=	0x0088
                           000089   157 _IE0	=	0x0089
                           00008A   158 _IT1	=	0x008a
                           00008B   159 _IE1	=	0x008b
                           00008C   160 _TR0	=	0x008c
                           00008D   161 _TF0	=	0x008d
                           00008E   162 _TR1	=	0x008e
                           00008F   163 _TF1	=	0x008f
                           000090   164 _P1_0	=	0x0090
                           000091   165 _P1_1	=	0x0091
                           000092   166 _P1_2	=	0x0092
                           000093   167 _P1_3	=	0x0093
                           000094   168 _P1_4	=	0x0094
                           000095   169 _P1_5	=	0x0095
                           000096   170 _P1_6	=	0x0096
                           000097   171 _P1_7	=	0x0097
                           000098   172 _RI	=	0x0098
                           000099   173 _TI	=	0x0099
                           00009A   174 _RB8	=	0x009a
                           00009B   175 _TB8	=	0x009b
                           00009C   176 _REN	=	0x009c
                           00009D   177 _SM2	=	0x009d
                           00009E   178 _SM1	=	0x009e
                           00009F   179 _SM0	=	0x009f
                           0000A0   180 _P2_0	=	0x00a0
                           0000A1   181 _P2_1	=	0x00a1
                           0000A2   182 _P2_2	=	0x00a2
                           0000A3   183 _P2_3	=	0x00a3
                           0000A4   184 _P2_4	=	0x00a4
                           0000A5   185 _P2_5	=	0x00a5
                           0000A6   186 _P2_6	=	0x00a6
                           0000A7   187 _P2_7	=	0x00a7
                           0000A8   188 _EX0	=	0x00a8
                           0000A9   189 _ET0	=	0x00a9
                           0000AA   190 _EX1	=	0x00aa
                           0000AB   191 _ET1	=	0x00ab
                           0000AC   192 _ES	=	0x00ac
                           0000AF   193 _EA	=	0x00af
                           0000B0   194 _P3_0	=	0x00b0
                           0000B1   195 _P3_1	=	0x00b1
                           0000B2   196 _P3_2	=	0x00b2
                           0000B3   197 _P3_3	=	0x00b3
                           0000B4   198 _P3_4	=	0x00b4
                           0000B5   199 _P3_5	=	0x00b5
                           0000B6   200 _P3_6	=	0x00b6
                           0000B7   201 _P3_7	=	0x00b7
                           0000B0   202 _RXD	=	0x00b0
                           0000B1   203 _TXD	=	0x00b1
                           0000B2   204 _INT0	=	0x00b2
                           0000B3   205 _INT1	=	0x00b3
                           0000B4   206 _T0	=	0x00b4
                           0000B5   207 _T1	=	0x00b5
                           0000B6   208 _WR	=	0x00b6
                           0000B7   209 _RD	=	0x00b7
                           0000B8   210 _PX0	=	0x00b8
                           0000B9   211 _PT0	=	0x00b9
                           0000BA   212 _PX1	=	0x00ba
                           0000BB   213 _PT1	=	0x00bb
                           0000BC   214 _PS	=	0x00bc
                           0000D0   215 _P	=	0x00d0
                           0000D1   216 _F1	=	0x00d1
                           0000D2   217 _OV	=	0x00d2
                           0000D3   218 _RS0	=	0x00d3
                           0000D4   219 _RS1	=	0x00d4
                           0000D5   220 _F0	=	0x00d5
                           0000D6   221 _AC	=	0x00d6
                           0000D7   222 _CY	=	0x00d7
                                    223 ;--------------------------------------------------------
                                    224 ; overlayable register banks
                                    225 ;--------------------------------------------------------
                                    226 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        227 	.ds 8
                                    228 ;--------------------------------------------------------
                                    229 ; internal ram data
                                    230 ;--------------------------------------------------------
                                    231 	.area DSEG    (DATA)
                           00003E   232 _lcd_ready	=	0x003e
      000008                        233 _LCD_Init_dinosaur_10001_13:
      000008                        234 	.ds 8
      000010                        235 _LCD_Init_cactus_10002_14:
      000010                        236 	.ds 8
      000018                        237 _LCD_set_symbol_PARM_2:
      000018                        238 	.ds 3
                                    239 ;--------------------------------------------------------
                                    240 ; overlayable items in internal ram
                                    241 ;--------------------------------------------------------
                                    242 	.area	OSEG    (OVR,DATA)
                                    243 ;--------------------------------------------------------
                                    244 ; indirectly addressable internal ram data
                                    245 ;--------------------------------------------------------
                                    246 	.area ISEG    (DATA)
                                    247 ;--------------------------------------------------------
                                    248 ; absolute internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area IABS    (ABS,DATA)
                                    251 	.area IABS    (ABS,DATA)
                                    252 ;--------------------------------------------------------
                                    253 ; bit data
                                    254 ;--------------------------------------------------------
                                    255 	.area BSEG    (BIT)
                                    256 ;--------------------------------------------------------
                                    257 ; paged external ram data
                                    258 ;--------------------------------------------------------
                                    259 	.area PSEG    (PAG,XDATA)
                                    260 ;--------------------------------------------------------
                                    261 ; uninitialized external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area XSEG    (XDATA)
                                    264 ;--------------------------------------------------------
                                    265 ; absolute external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area XABS    (ABS,XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; initialized external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XISEG   (XDATA)
                                    272 	.area HOME    (CODE)
                                    273 	.area GSINIT0 (CODE)
                                    274 	.area GSINIT1 (CODE)
                                    275 	.area GSINIT2 (CODE)
                                    276 	.area GSINIT3 (CODE)
                                    277 	.area GSINIT4 (CODE)
                                    278 	.area GSINIT5 (CODE)
                                    279 	.area GSINIT  (CODE)
                                    280 	.area GSFINAL (CODE)
                                    281 	.area CSEG    (CODE)
                                    282 ;--------------------------------------------------------
                                    283 ; global & static initialisations
                                    284 ;--------------------------------------------------------
                                    285 	.area HOME    (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 	.area GSFINAL (CODE)
                                    288 	.area GSINIT  (CODE)
                                    289 ;--------------------------------------------------------
                                    290 ; Home
                                    291 ;--------------------------------------------------------
                                    292 	.area HOME    (CODE)
                                    293 	.area HOME    (CODE)
                                    294 ;--------------------------------------------------------
                                    295 ; code
                                    296 ;--------------------------------------------------------
                                    297 	.area CSEG    (CODE)
                                    298 ;------------------------------------------------------------
                                    299 ;Allocation info for local variables in function 'LCD_ready'
                                    300 ;------------------------------------------------------------
                                    301 ;	lcdlib.c:16: unsigned char LCD_ready(void) {
                                    302 ;	-----------------------------------------
                                    303 ;	 function LCD_ready
                                    304 ;	-----------------------------------------
      00056A                        305 _LCD_ready:
                           000007   306 	ar7 = 0x07
                           000006   307 	ar6 = 0x06
                           000005   308 	ar5 = 0x05
                           000004   309 	ar4 = 0x04
                           000003   310 	ar3 = 0x03
                           000002   311 	ar2 = 0x02
                           000001   312 	ar1 = 0x01
                           000000   313 	ar0 = 0x00
                                    314 ;	lcdlib.c:17: return lcd_ready;
      00056A 85 3E 82         [24]  315 	mov	dpl, _lcd_ready
                                    316 ;	lcdlib.c:18: }
      00056D 22               [24]  317 	ret
                                    318 ;------------------------------------------------------------
                                    319 ;Allocation info for local variables in function 'LCD_Init'
                                    320 ;------------------------------------------------------------
                                    321 ;dinosaur      Allocated with name '_LCD_Init_dinosaur_10001_13'
                                    322 ;cactus        Allocated with name '_LCD_Init_cactus_10002_14'
                                    323 ;------------------------------------------------------------
                                    324 ;	lcdlib.c:19: void LCD_Init(void) {
                                    325 ;	-----------------------------------------
                                    326 ;	 function LCD_Init
                                    327 ;	-----------------------------------------
      00056E                        328 _LCD_Init:
                                    329 ;	lcdlib.c:20: LCD_functionSet();
      00056E 12 05 F1         [24]  330 	lcall	_LCD_functionSet
                                    331 ;	lcdlib.c:21: LCD_entryModeSet(1, 1); /* increment and no shift */
      000571 75 82 07         [24]  332 	mov	dpl, #0x07
      000574 12 05 CF         [24]  333 	lcall	_LCD_IRWrite
                                    334 ;	lcdlib.c:22: LCD_displayOnOffControl(1, 1, 1); /* display on, cursor on and blinking on */
      000577 75 82 0F         [24]  335 	mov	dpl, #0x0f
      00057A 12 05 CF         [24]  336 	lcall	_LCD_IRWrite
                                    337 ;	lcdlib.c:23: const char dinosaur[] = {0x07, 0x05, 0x06, 0x07, 0x14, 0x17, 0x0E, 0x0A};
      00057D 75 08 07         [24]  338 	mov	_LCD_Init_dinosaur_10001_13,#0x07
      000580 75 09 05         [24]  339 	mov	(_LCD_Init_dinosaur_10001_13 + 0x0001),#0x05
      000583 75 0A 06         [24]  340 	mov	(_LCD_Init_dinosaur_10001_13 + 0x0002),#0x06
      000586 75 0B 07         [24]  341 	mov	(_LCD_Init_dinosaur_10001_13 + 0x0003),#0x07
      000589 75 0C 14         [24]  342 	mov	(_LCD_Init_dinosaur_10001_13 + 0x0004),#0x14
      00058C 75 0D 17         [24]  343 	mov	(_LCD_Init_dinosaur_10001_13 + 0x0005),#0x17
      00058F 75 0E 0E         [24]  344 	mov	(_LCD_Init_dinosaur_10001_13 + 0x0006),#0x0e
      000592 75 0F 0A         [24]  345 	mov	(_LCD_Init_dinosaur_10001_13 + 0x0007),#0x0a
                                    346 ;	lcdlib.c:24: LCD_set_symbol('\10', dinosaur); // bitmap for dinosaur starts at 0x10
      000595 75 18 08         [24]  347 	mov	_LCD_set_symbol_PARM_2,#_LCD_Init_dinosaur_10001_13
      000598 75 19 00         [24]  348 	mov	(_LCD_set_symbol_PARM_2 + 1),#0x00
      00059B 75 1A 40         [24]  349 	mov	(_LCD_set_symbol_PARM_2 + 2),#0x40
      00059E 75 82 08         [24]  350 	mov	dpl, #0x08
      0005A1 12 06 7E         [24]  351 	lcall	_LCD_set_symbol
                                    352 ;	lcdlib.c:25: const char cactus[] = {0x04, 0x05, 0x15, 0x15, 0x16, 0x0C, 0x04, 0x04};
      0005A4 75 10 04         [24]  353 	mov	_LCD_Init_cactus_10002_14,#0x04
      0005A7 75 11 05         [24]  354 	mov	(_LCD_Init_cactus_10002_14 + 0x0001),#0x05
      0005AA 75 12 15         [24]  355 	mov	(_LCD_Init_cactus_10002_14 + 0x0002),#0x15
      0005AD 75 13 15         [24]  356 	mov	(_LCD_Init_cactus_10002_14 + 0x0003),#0x15
      0005B0 75 14 16         [24]  357 	mov	(_LCD_Init_cactus_10002_14 + 0x0004),#0x16
      0005B3 75 15 0C         [24]  358 	mov	(_LCD_Init_cactus_10002_14 + 0x0005),#0x0c
      0005B6 75 16 04         [24]  359 	mov	(_LCD_Init_cactus_10002_14 + 0x0006),#0x04
      0005B9 75 17 04         [24]  360 	mov	(_LCD_Init_cactus_10002_14 + 0x0007),#0x04
                                    361 ;	lcdlib.c:26: LCD_set_symbol('\20', cactus);   // bitmap for cactus starts at 0x20
      0005BC 75 18 10         [24]  362 	mov	_LCD_set_symbol_PARM_2,#_LCD_Init_cactus_10002_14
      0005BF 75 19 00         [24]  363 	mov	(_LCD_set_symbol_PARM_2 + 1),#0x00
      0005C2 75 1A 40         [24]  364 	mov	(_LCD_set_symbol_PARM_2 + 2),#0x40
      0005C5 75 82 10         [24]  365 	mov	dpl, #0x10
      0005C8 12 06 7E         [24]  366 	lcall	_LCD_set_symbol
                                    367 ;	lcdlib.c:27: lcd_ready = 1;
      0005CB 75 3E 01         [24]  368 	mov	_lcd_ready,#0x01
                                    369 ;	lcdlib.c:28: }
      0005CE 22               [24]  370 	ret
                                    371 ;------------------------------------------------------------
                                    372 ;Allocation info for local variables in function 'LCD_IRWrite'
                                    373 ;------------------------------------------------------------
                                    374 ;c             Allocated to registers r7 
                                    375 ;------------------------------------------------------------
                                    376 ;	lcdlib.c:29: void LCD_IRWrite(char c) {
                                    377 ;	-----------------------------------------
                                    378 ;	 function LCD_IRWrite
                                    379 ;	-----------------------------------------
      0005CF                        380 _LCD_IRWrite:
      0005CF AF 82            [24]  381 	mov	r7, dpl
                                    382 ;	lcdlib.c:30: lcd_ready = 0;
      0005D1 75 3E 00         [24]  383 	mov	_lcd_ready,#0x00
                                    384 ;	lcdlib.c:31: DB = (c & 0xf0); // high nibble, keep RS low
      0005D4 74 F0            [12]  385 	mov	a,#0xf0
      0005D6 5F               [12]  386 	anl	a,r7
      0005D7 F5 90            [12]  387 	mov	_P1,a
                                    388 ;	lcdlib.c:32: E = 1;  // pulse E
                                    389 ;	assignBit
      0005D9 D2 92            [12]  390 	setb	_P1_2
                                    391 ;	lcdlib.c:33: E = 0;
                                    392 ;	assignBit
      0005DB C2 92            [12]  393 	clr	_P1_2
                                    394 ;	lcdlib.c:34: DB = (c << 4); // low nibble, keep RS low
      0005DD EF               [12]  395 	mov	a,r7
      0005DE C4               [12]  396 	swap	a
      0005DF 54 F0            [12]  397 	anl	a,#0xf0
      0005E1 F5 90            [12]  398 	mov	_P1,a
                                    399 ;	lcdlib.c:35: E = 1;
                                    400 ;	assignBit
      0005E3 D2 92            [12]  401 	setb	_P1_2
                                    402 ;	lcdlib.c:36: E = 0;
                                    403 ;	assignBit
      0005E5 C2 92            [12]  404 	clr	_P1_2
                                    405 ;	lcdlib.c:37: delay(DELAY_AMOUNT);
      0005E7 75 82 32         [24]  406 	mov	dpl, #0x32
      0005EA 12 06 7A         [24]  407 	lcall	_delay
                                    408 ;	lcdlib.c:38: lcd_ready = 1;
      0005ED 75 3E 01         [24]  409 	mov	_lcd_ready,#0x01
                                    410 ;	lcdlib.c:39: }
      0005F0 22               [24]  411 	ret
                                    412 ;------------------------------------------------------------
                                    413 ;Allocation info for local variables in function 'LCD_functionSet'
                                    414 ;------------------------------------------------------------
                                    415 ;	lcdlib.c:40: void LCD_functionSet(void) {
                                    416 ;	-----------------------------------------
                                    417 ;	 function LCD_functionSet
                                    418 ;	-----------------------------------------
      0005F1                        419 _LCD_functionSet:
                                    420 ;	lcdlib.c:41: lcd_ready = 0;
      0005F1 75 3E 00         [24]  421 	mov	_lcd_ready,#0x00
                                    422 ;	lcdlib.c:44: DB = 0x20;  // DB<7:4> = 0010, <RS,E,x,x>=0
      0005F4 75 90 20         [24]  423 	mov	_P1,#0x20
                                    424 ;	lcdlib.c:45: E = 1;
                                    425 ;	assignBit
      0005F7 D2 92            [12]  426 	setb	_P1_2
                                    427 ;	lcdlib.c:46: E = 0;
                                    428 ;	assignBit
      0005F9 C2 92            [12]  429 	clr	_P1_2
                                    430 ;	lcdlib.c:47: delay(DELAY_AMOUNT);
      0005FB 75 82 32         [24]  431 	mov	dpl, #0x32
      0005FE 12 06 7A         [24]  432 	lcall	_delay
                                    433 ;	lcdlib.c:48: E = 1;
                                    434 ;	assignBit
      000601 D2 92            [12]  435 	setb	_P1_2
                                    436 ;	lcdlib.c:49: E = 0;
                                    437 ;	assignBit
      000603 C2 92            [12]  438 	clr	_P1_2
                                    439 ;	lcdlib.c:50: delay(DELAY_AMOUNT); // added, to ensure sufficient delay
      000605 75 82 32         [24]  440 	mov	dpl, #0x32
      000608 12 06 7A         [24]  441 	lcall	_delay
                                    442 ;	lcdlib.c:51: DB7 = 1; // 2-line model
                                    443 ;	assignBit
      00060B D2 97            [12]  444 	setb	_P1_7
                                    445 ;	lcdlib.c:53: E = 1;
                                    446 ;	assignBit
      00060D D2 92            [12]  447 	setb	_P1_2
                                    448 ;	lcdlib.c:54: E = 0;
                                    449 ;	assignBit
      00060F C2 92            [12]  450 	clr	_P1_2
                                    451 ;	lcdlib.c:55: delay(DELAY_AMOUNT);
      000611 75 82 32         [24]  452 	mov	dpl, #0x32
      000614 12 06 7A         [24]  453 	lcall	_delay
                                    454 ;	lcdlib.c:56: lcd_ready = 1;
      000617 75 3E 01         [24]  455 	mov	_lcd_ready,#0x01
                                    456 ;	lcdlib.c:57: }
      00061A 22               [24]  457 	ret
                                    458 ;------------------------------------------------------------
                                    459 ;Allocation info for local variables in function 'LCD_write_char'
                                    460 ;------------------------------------------------------------
                                    461 ;c             Allocated to registers r7 
                                    462 ;------------------------------------------------------------
                                    463 ;	lcdlib.c:59: void LCD_write_char(char c) {
                                    464 ;	-----------------------------------------
                                    465 ;	 function LCD_write_char
                                    466 ;	-----------------------------------------
      00061B                        467 _LCD_write_char:
      00061B AF 82            [24]  468 	mov	r7, dpl
                                    469 ;	lcdlib.c:60: lcd_ready = 0;
      00061D 75 3E 00         [24]  470 	mov	_lcd_ready,#0x00
                                    471 ;	lcdlib.c:61: DB = (c & 0xf0) | 0x08; //; keep the RS
      000620 74 F0            [12]  472 	mov	a,#0xf0
      000622 5F               [12]  473 	anl	a,r7
      000623 44 08            [12]  474 	orl	a,#0x08
      000625 F5 90            [12]  475 	mov	_P1,a
                                    476 ;	lcdlib.c:62: RS = 1;
                                    477 ;	assignBit
      000627 D2 93            [12]  478 	setb	_P1_3
                                    479 ;	lcdlib.c:63: E = 1;
                                    480 ;	assignBit
      000629 D2 92            [12]  481 	setb	_P1_2
                                    482 ;	lcdlib.c:64: E = 0;
                                    483 ;	assignBit
      00062B C2 92            [12]  484 	clr	_P1_2
                                    485 ;	lcdlib.c:65: DB = (c << 4) | 0x08; // keep the RS
      00062D EF               [12]  486 	mov	a,r7
      00062E C4               [12]  487 	swap	a
      00062F 54 F0            [12]  488 	anl	a,#0xf0
      000631 FF               [12]  489 	mov	r7,a
      000632 74 08            [12]  490 	mov	a,#0x08
      000634 4F               [12]  491 	orl	a,r7
      000635 F5 90            [12]  492 	mov	_P1,a
                                    493 ;	lcdlib.c:66: E = 1;
                                    494 ;	assignBit
      000637 D2 92            [12]  495 	setb	_P1_2
                                    496 ;	lcdlib.c:67: E = 0;
                                    497 ;	assignBit
      000639 C2 92            [12]  498 	clr	_P1_2
                                    499 ;	lcdlib.c:68: delay(DELAY_AMOUNT);
      00063B 75 82 32         [24]  500 	mov	dpl, #0x32
      00063E 12 06 7A         [24]  501 	lcall	_delay
                                    502 ;	lcdlib.c:69: lcd_ready = 1;
      000641 75 3E 01         [24]  503 	mov	_lcd_ready,#0x01
                                    504 ;	lcdlib.c:70: }
      000644 22               [24]  505 	ret
                                    506 ;------------------------------------------------------------
                                    507 ;Allocation info for local variables in function 'LCD_write_string'
                                    508 ;------------------------------------------------------------
                                    509 ;str           Allocated to registers 
                                    510 ;------------------------------------------------------------
                                    511 ;	lcdlib.c:71: void LCD_write_string(char* str) {
                                    512 ;	-----------------------------------------
                                    513 ;	 function LCD_write_string
                                    514 ;	-----------------------------------------
      000645                        515 _LCD_write_string:
      000645 AD 82            [24]  516 	mov	r5, dpl
      000647 AE 83            [24]  517 	mov	r6, dph
      000649 AF F0            [24]  518 	mov	r7, b
                                    519 ;	lcdlib.c:72: while (*str++) {
      00064B                        520 00101$:
      00064B 8D 82            [24]  521 	mov	dpl,r5
      00064D 8E 83            [24]  522 	mov	dph,r6
      00064F 8F F0            [24]  523 	mov	b,r7
      000651 12 08 1E         [24]  524 	lcall	__gptrget
      000654 FC               [12]  525 	mov	r4,a
      000655 A3               [24]  526 	inc	dptr
      000656 AD 82            [24]  527 	mov	r5,dpl
      000658 AE 83            [24]  528 	mov	r6,dph
      00065A EC               [12]  529 	mov	a,r4
      00065B 60 1C            [24]  530 	jz	00104$
                                    531 ;	lcdlib.c:73: LCD_write_char(*str);
      00065D 8D 82            [24]  532 	mov	dpl,r5
      00065F 8E 83            [24]  533 	mov	dph,r6
      000661 8F F0            [24]  534 	mov	b,r7
      000663 12 08 1E         [24]  535 	lcall	__gptrget
      000666 F5 82            [12]  536 	mov	dpl,a
      000668 C0 07            [24]  537 	push	ar7
      00066A C0 06            [24]  538 	push	ar6
      00066C C0 05            [24]  539 	push	ar5
      00066E 12 06 1B         [24]  540 	lcall	_LCD_write_char
      000671 D0 05            [24]  541 	pop	ar5
      000673 D0 06            [24]  542 	pop	ar6
      000675 D0 07            [24]  543 	pop	ar7
      000677 80 D2            [24]  544 	sjmp	00101$
      000679                        545 00104$:
                                    546 ;	lcdlib.c:75: }
      000679 22               [24]  547 	ret
                                    548 ;------------------------------------------------------------
                                    549 ;Allocation info for local variables in function 'delay'
                                    550 ;------------------------------------------------------------
                                    551 ;n             Allocated to registers 
                                    552 ;------------------------------------------------------------
                                    553 ;	lcdlib.c:76: void delay(unsigned char n) {
                                    554 ;	-----------------------------------------
                                    555 ;	 function delay
                                    556 ;	-----------------------------------------
      00067A                        557 _delay:
                                    558 ;	lcdlib.c:80: __endasm;
      00067A                        559 dhere:
      00067A D5 82 FD         [24]  560 	djnz	dpl, dhere
                                    561 ;	lcdlib.c:82: }
      00067D 22               [24]  562 	ret
                                    563 ;------------------------------------------------------------
                                    564 ;Allocation info for local variables in function 'LCD_set_symbol'
                                    565 ;------------------------------------------------------------
                                    566 ;symb          Allocated with name '_LCD_set_symbol_PARM_2'
                                    567 ;code          Allocated to registers r7 
                                    568 ;------------------------------------------------------------
                                    569 ;	lcdlib.c:84: void LCD_set_symbol(char code, const char symb[]) {
                                    570 ;	-----------------------------------------
                                    571 ;	 function LCD_set_symbol
                                    572 ;	-----------------------------------------
      00067E                        573 _LCD_set_symbol:
      00067E AF 82            [24]  574 	mov	r7, dpl
                                    575 ;	lcdlib.c:89: LCD_setCgRamAddress(code); // code is the character generation memory 
      000680 74 40            [12]  576 	mov	a,#0x40
      000682 4F               [12]  577 	orl	a,r7
      000683 F5 82            [12]  578 	mov	dpl,a
      000685 12 05 CF         [24]  579 	lcall	_LCD_IRWrite
                                    580 ;	lcdlib.c:92: LCD_write_char(symb[0]);
      000688 AD 18            [24]  581 	mov	r5,_LCD_set_symbol_PARM_2
      00068A AE 19            [24]  582 	mov	r6,(_LCD_set_symbol_PARM_2 + 1)
      00068C AF 1A            [24]  583 	mov	r7,(_LCD_set_symbol_PARM_2 + 2)
      00068E 8D 82            [24]  584 	mov	dpl,r5
      000690 8E 83            [24]  585 	mov	dph,r6
      000692 8F F0            [24]  586 	mov	b,r7
      000694 12 08 1E         [24]  587 	lcall	__gptrget
      000697 F5 82            [12]  588 	mov	dpl,a
      000699 C0 07            [24]  589 	push	ar7
      00069B C0 06            [24]  590 	push	ar6
      00069D C0 05            [24]  591 	push	ar5
      00069F 12 06 1B         [24]  592 	lcall	_LCD_write_char
      0006A2 D0 05            [24]  593 	pop	ar5
      0006A4 D0 06            [24]  594 	pop	ar6
      0006A6 D0 07            [24]  595 	pop	ar7
                                    596 ;	lcdlib.c:93: LCD_write_char(symb[1]);
      0006A8 74 01            [12]  597 	mov	a,#0x01
      0006AA 2D               [12]  598 	add	a, r5
      0006AB FA               [12]  599 	mov	r2,a
      0006AC E4               [12]  600 	clr	a
      0006AD 3E               [12]  601 	addc	a, r6
      0006AE FB               [12]  602 	mov	r3,a
      0006AF 8F 04            [24]  603 	mov	ar4,r7
      0006B1 8A 82            [24]  604 	mov	dpl,r2
      0006B3 8B 83            [24]  605 	mov	dph,r3
      0006B5 8C F0            [24]  606 	mov	b,r4
      0006B7 12 08 1E         [24]  607 	lcall	__gptrget
      0006BA F5 82            [12]  608 	mov	dpl,a
      0006BC C0 07            [24]  609 	push	ar7
      0006BE C0 06            [24]  610 	push	ar6
      0006C0 C0 05            [24]  611 	push	ar5
      0006C2 12 06 1B         [24]  612 	lcall	_LCD_write_char
      0006C5 D0 05            [24]  613 	pop	ar5
      0006C7 D0 06            [24]  614 	pop	ar6
      0006C9 D0 07            [24]  615 	pop	ar7
                                    616 ;	lcdlib.c:94: LCD_write_char(symb[2]);
      0006CB 74 02            [12]  617 	mov	a,#0x02
      0006CD 2D               [12]  618 	add	a, r5
      0006CE FA               [12]  619 	mov	r2,a
      0006CF E4               [12]  620 	clr	a
      0006D0 3E               [12]  621 	addc	a, r6
      0006D1 FB               [12]  622 	mov	r3,a
      0006D2 8F 04            [24]  623 	mov	ar4,r7
      0006D4 8A 82            [24]  624 	mov	dpl,r2
      0006D6 8B 83            [24]  625 	mov	dph,r3
      0006D8 8C F0            [24]  626 	mov	b,r4
      0006DA 12 08 1E         [24]  627 	lcall	__gptrget
      0006DD F5 82            [12]  628 	mov	dpl,a
      0006DF C0 07            [24]  629 	push	ar7
      0006E1 C0 06            [24]  630 	push	ar6
      0006E3 C0 05            [24]  631 	push	ar5
      0006E5 12 06 1B         [24]  632 	lcall	_LCD_write_char
      0006E8 D0 05            [24]  633 	pop	ar5
      0006EA D0 06            [24]  634 	pop	ar6
      0006EC D0 07            [24]  635 	pop	ar7
                                    636 ;	lcdlib.c:95: LCD_write_char(symb[3]);
      0006EE 74 03            [12]  637 	mov	a,#0x03
      0006F0 2D               [12]  638 	add	a, r5
      0006F1 FA               [12]  639 	mov	r2,a
      0006F2 E4               [12]  640 	clr	a
      0006F3 3E               [12]  641 	addc	a, r6
      0006F4 FB               [12]  642 	mov	r3,a
      0006F5 8F 04            [24]  643 	mov	ar4,r7
      0006F7 8A 82            [24]  644 	mov	dpl,r2
      0006F9 8B 83            [24]  645 	mov	dph,r3
      0006FB 8C F0            [24]  646 	mov	b,r4
      0006FD 12 08 1E         [24]  647 	lcall	__gptrget
      000700 F5 82            [12]  648 	mov	dpl,a
      000702 C0 07            [24]  649 	push	ar7
      000704 C0 06            [24]  650 	push	ar6
      000706 C0 05            [24]  651 	push	ar5
      000708 12 06 1B         [24]  652 	lcall	_LCD_write_char
      00070B D0 05            [24]  653 	pop	ar5
      00070D D0 06            [24]  654 	pop	ar6
      00070F D0 07            [24]  655 	pop	ar7
                                    656 ;	lcdlib.c:96: LCD_write_char(symb[4]);
      000711 74 04            [12]  657 	mov	a,#0x04
      000713 2D               [12]  658 	add	a, r5
      000714 FA               [12]  659 	mov	r2,a
      000715 E4               [12]  660 	clr	a
      000716 3E               [12]  661 	addc	a, r6
      000717 FB               [12]  662 	mov	r3,a
      000718 8F 04            [24]  663 	mov	ar4,r7
      00071A 8A 82            [24]  664 	mov	dpl,r2
      00071C 8B 83            [24]  665 	mov	dph,r3
      00071E 8C F0            [24]  666 	mov	b,r4
      000720 12 08 1E         [24]  667 	lcall	__gptrget
      000723 F5 82            [12]  668 	mov	dpl,a
      000725 C0 07            [24]  669 	push	ar7
      000727 C0 06            [24]  670 	push	ar6
      000729 C0 05            [24]  671 	push	ar5
      00072B 12 06 1B         [24]  672 	lcall	_LCD_write_char
      00072E D0 05            [24]  673 	pop	ar5
      000730 D0 06            [24]  674 	pop	ar6
      000732 D0 07            [24]  675 	pop	ar7
                                    676 ;	lcdlib.c:97: LCD_write_char(symb[5]);
      000734 74 05            [12]  677 	mov	a,#0x05
      000736 2D               [12]  678 	add	a, r5
      000737 FA               [12]  679 	mov	r2,a
      000738 E4               [12]  680 	clr	a
      000739 3E               [12]  681 	addc	a, r6
      00073A FB               [12]  682 	mov	r3,a
      00073B 8F 04            [24]  683 	mov	ar4,r7
      00073D 8A 82            [24]  684 	mov	dpl,r2
      00073F 8B 83            [24]  685 	mov	dph,r3
      000741 8C F0            [24]  686 	mov	b,r4
      000743 12 08 1E         [24]  687 	lcall	__gptrget
      000746 F5 82            [12]  688 	mov	dpl,a
      000748 C0 07            [24]  689 	push	ar7
      00074A C0 06            [24]  690 	push	ar6
      00074C C0 05            [24]  691 	push	ar5
      00074E 12 06 1B         [24]  692 	lcall	_LCD_write_char
      000751 D0 05            [24]  693 	pop	ar5
      000753 D0 06            [24]  694 	pop	ar6
      000755 D0 07            [24]  695 	pop	ar7
                                    696 ;	lcdlib.c:98: LCD_write_char(symb[6]);
      000757 74 06            [12]  697 	mov	a,#0x06
      000759 2D               [12]  698 	add	a, r5
      00075A FA               [12]  699 	mov	r2,a
      00075B E4               [12]  700 	clr	a
      00075C 3E               [12]  701 	addc	a, r6
      00075D FB               [12]  702 	mov	r3,a
      00075E 8F 04            [24]  703 	mov	ar4,r7
      000760 8A 82            [24]  704 	mov	dpl,r2
      000762 8B 83            [24]  705 	mov	dph,r3
      000764 8C F0            [24]  706 	mov	b,r4
      000766 12 08 1E         [24]  707 	lcall	__gptrget
      000769 F5 82            [12]  708 	mov	dpl,a
      00076B C0 07            [24]  709 	push	ar7
      00076D C0 06            [24]  710 	push	ar6
      00076F C0 05            [24]  711 	push	ar5
      000771 12 06 1B         [24]  712 	lcall	_LCD_write_char
      000774 D0 05            [24]  713 	pop	ar5
      000776 D0 06            [24]  714 	pop	ar6
      000778 D0 07            [24]  715 	pop	ar7
                                    716 ;	lcdlib.c:99: LCD_write_char(symb[7]);
      00077A 74 07            [12]  717 	mov	a,#0x07
      00077C 2D               [12]  718 	add	a, r5
      00077D FD               [12]  719 	mov	r5,a
      00077E E4               [12]  720 	clr	a
      00077F 3E               [12]  721 	addc	a, r6
      000780 FE               [12]  722 	mov	r6,a
      000781 8D 82            [24]  723 	mov	dpl,r5
      000783 8E 83            [24]  724 	mov	dph,r6
      000785 8F F0            [24]  725 	mov	b,r7
      000787 12 08 1E         [24]  726 	lcall	__gptrget
      00078A F5 82            [12]  727 	mov	dpl,a
                                    728 ;	lcdlib.c:102: }
      00078C 02 06 1B         [24]  729 	ljmp	_LCD_write_char
                                    730 	.area CSEG    (CODE)
                                    731 	.area CONST   (CODE)
                                    732 	.area XINIT   (CODE)
                                    733 	.area CABS    (ABS,CODE)
