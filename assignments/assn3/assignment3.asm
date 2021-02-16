;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Joshua Shabun
; Email: joshua.shabun@email.ucr.edu
; 
; Assignment name: Assignment 3
; Lab section: 024
; TA: Shirin Haji Amin Shirazi
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

.ORIG x3000						; Program begins here
;-------------
;Instructions
;-------------
LD R6, Value_ptr				; R6 <-- pointer to value to be displayed as binary
LDR R1, R6, #0					; R1 <-- value to be displayed as binary 
;-------------------------------
;INSERT CODE STARTING FROM HERE
;-------------------------------
LD R2, FULL_BIT					; R2 <- Mem[FULL_BIT]

DO_WHILE_LOOP
	ADD R1, R1, #0				; R1 <- R1 + 0
	BRn	MSB_NEG					; if (R1 < 0) then MSB_NEG
	BRzp MSB_POS					; if (R1 > 0) then MSB_POS
	
MSB_NEG
	LD R0, NUM_ONE				; R0 <- Mem[NUM_ONE] (sets R0 to 1)
	OUT							; prints R0 to the screen as an ascii char
	BRnzp SHIFT_LEFT			; if R0 is neg, zero, or pos then SHIFT_LEFT

MSB_POS
	LD R0, NUM_ZERO				; R0 <- Mem[NUM_ZERO] (sets R0 to 0)
	OUT							; prints R0 to screen as ascii char
	BRnzp SHIFT_LEFT			; if R0 neg, zero, or pos then SHIFT_LEFT	

SHIFT_LEFT
	LD R5, DEC_1				; R5 <- Mem[DEC_1] (sets R5 to -1)
	ADD R1, R1, R1				; R1 <- R1 + R1
	ADD R2, R2, R5				; R2 <- R2 + R5
	BRz END_LOOP				; if (R2 = 0) then END_LOOP
	
	LD R5, DEC_12				; R5 <- Mem[DEC_12] (sets R5 to -12)
	ADD R3, R2, R5				; R3 <- R2 + R5
	BRz SPACE_OUTPUT			; if (R3 = 0) then SPACE_OUTPUT
	
	LD R5, DEC_8				; R5 <- Mem[DEC_8] (sets R5 to -8)	
	ADD R3, R2, R5				; R3 <- R2 + R5	
	BRz SPACE_OUTPUT			; if (R3 = 0) then SPACE_OUTPUT	
	
	LD R5, BIT_COUNT			; R5 <- Mem[BIT_COUNT] (sets R5 to -4)
	ADD R3, R2, R5				; R3 <- R2 + R5	
	BRz SPACE_OUTPUT			; if (R3 = 0) then SPACE_OUTPUT
	
	BRnzp DO_WHILE_LOOP			; go to DO_WHILE_LOOP

SPACE_OUTPUT
	LD R0, SPACE				; R0 <- Mem[SPACE] (sets R0 to " ")
	OUT							; prints R0 to screen as ascii char
	BRnzp DO_WHILE_LOOP			; go to DO_WHILE_LOOP
	
END_LOOP
	LD R0, NEWLINE				; R0 <- Mem[NEWLINE] (sets R0 to '\n')	
	OUT							; prints R0 to screen as ascii char

HALT							; terminates the program
;---------------	
;Data
;---------------
Value_ptr	.FILL xCB00			; The address where value to be displayed is stored

NEWLINE		.STRINGZ	"\n"	; newline string
SPACE		.FILL	' '			; space char	
NUM_ONE		.FILL	'1'			; #1 char
NUM_ZERO	.FILL	'0'			; #0 char
BIT_COUNT	.FILL	#-4			; Bit count of -4
FULL_BIT	.FILL	#16			; Full bit of #16
DEC_12		.FILL	#-12		; sets to #-12	
DEC_8		.FILL	#-8			; sets to #-8	
DEC_1		.FILL	#-1			; sets to #-1	

.ORIG xCB00						; Remote data
Value .FILL xABCD				; <----!!!NUMBER TO BE DISPLAYED AS BINARY!!! Note: label is redundant.
;---------------	
;END of PROGRAM
;---------------	
.END
