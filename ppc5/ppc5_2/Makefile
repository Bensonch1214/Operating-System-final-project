#Makefile for PPC5 Part 2
CC = sdcc
CFLAGS = -c  --model-small
LDFLAGS = 
LCD_OBJ = dino.rel preemptive.rel lcdlib.rel keylib.rel


all: dino.hex


dino.hex:   $(LCD_OBJ)
	$(CC) $(LDFLAGS) -o dino.hex $(LCD_OBJ)


clean:
	rm *.hex *.ihx *.lnk *.lst *.map *.mem *.rel *.rst *.sym *.asm *.lk
	
%.rel:  %.c    preemptive.h Makefile
	$(CC) $(CFLAGS) $<
