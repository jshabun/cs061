;=================================================
; Name: Joshua Shabun
; Email: jshab003@ucr.edu
; 
; Lab: lab 3, ex 4
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
	LD R4, SENTINEL
	GETC						;gets input and stores in R0
	OUT							;outputs ascii character stored in R0
	STR R0, R2, #0				;Mem[R2] <- R0
	ADD R2, R2, #1				;R2 <- R2 + 1
	
	ADD R4, R4, R0				;R3 <- R3 - 1
	
	BRnp END_SENTINEL_LOOP		;END_SENTINEL_LOOP if R4 positive and negative
	SENTINEL_LOOP
		AND R3, R3, x0			;R3 <- 0
	END_SENTINEL_LOOP
	
	ADD R3, R3, #-1				;R3 <- R3 - 1
	
	BRp DO_WHILE				;do while (R3 > 0)
END_DO_WHILE

;traversing array to add space and output to console
LD R0, NEWLINE					;R0 <- Mem[NEWLINE]
OUT								;prints R0 to console
LEA R0, OUTPUT					;get starting address of string
PUTS							;invokes BIOS routine to output string
LD R0, NEWLINE					;R0 <- Mem[NEWLINE]
OUT								;prints R0 to console	

LD R2, DATA_PTR					;R2 <- Mem[DATA_PTR]
LD R3, ARRAY_SIZE				;R3 <- Mem[ARRAY_SIZE]

DO_WHILE_OUTPUT
	;LD R0, NEWLINE				;R0 <- Mem[NEWLINE]
	;OUT							;print R0 to console
	LDR R0, R2, #0				;R0 <- R2 + 0
	OUT							;print R0 to console
	ADD R2, R2, #1				;R2 <- R2 + 1
	
	LD R4, SENTINEL				;R4 <- Mem[SENTINEL]
	ADD R4, R4, R0				;R4 <- R4 + R0
	
	BRnp END_SENTINEL_2			;END_SENTINEL_2 if R4 is positive or negative	
	
	SENTINEL_2					
		AND R3, R3, x0			;R3 <- 0
	END_SENTINEL_2
	
	ADD R3, R3, #-1				;R3 <- R3 - 1
	BRp DO_WHILE_OUTPUT			; do while (R3 > 0)
END_DO_WHILE_OUTPUT

HALT							;terminates the program
;--------------
;Local Data
;--------------
ARRAY_SIZE	.FILL	#100				;array size of 10
DATA_PTR	.FILL	x4000			;location of array block at x4000
INTRO	.STRINGZ	"Enter 100 characters or less (use % to end):\n"	;prompt string
NEWLINE	.FILL	'\n'			;newline string
OUTPUT	.STRINGZ	"\nOutput:"	;output string
SENTINEL .FILL #-37

;---------------
;Remote Data
;---------------
.ORIG x4000

ARRAY_RES	.BLKW	#100				;blocks off 10 spots for the array

.END
