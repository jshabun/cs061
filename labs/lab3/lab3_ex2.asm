;=================================================
; Name: Joshua Shabun
; Email: jshab003@ucr.edu
; 
; Lab: lab 3, ex 2
; Lab section: 024
; TA: Shirin Haji Amin Shirazi
; 
;=================================================

.ORIG x3000
;--------------
;Instructions
;--------------
LEA R0, INTRO					;get starting address of prompt string
PUTS			    			;Invokes BIOS routine to output string

LD R2, DATA_PTR					;R2 <- Mem[DATA_PTR]
LD R3, ARRAY_SIZE				;R3 <- Mem[ARRAY_SIZE]

DO_WHILE
	GETC						;gets input and stores in R0
	OUT							;outputs ascii character stored in R0
	STR R0, R2, #0				;Mem[R2] <- R0
	ADD R2, R2, #1				;R2 <- R2 + 1
	ADD R3, R3, #-1				;R3 <- R3 - 1
	BRp DO_WHILE				;do while (R3 > 0)
END_DO_WHILE

HALT							;terminates the program
;--------------
;Local Data
;--------------
ARRAY_SIZE	.FILL	#10				;array size of 10
DATA_PTR	.FILL	x4000			;location of array block at x4000
INTRO	.STRINGZ	"Enter 10 characters:\n"	;prompt string

;---------------
;Remote Data
;---------------
.ORIG x4000

ARRAY_RES	.BLKW	#10				;blocks off 10 spots for the array

.END
