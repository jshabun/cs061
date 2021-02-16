;=================================================
; Name: Joshua Shabun
; Email: jshab003@ucr.edu
; 
; Lab: lab 5, ex 1
; Lab section: 024
; TA: Shirin Haji Amin Shirazi
; 
;=================================================
.ORIG x3000

;--------------
;Instructions
;---------------
LD R1, M_OF_TWO						;R1 <- Mem[M_OF_TWO]
LD R2, DATA_PTR						;R2 <- Mem[DATA_PTR]
LD R3, COUNTER						;R3 <- Mem[COUNTER]

DO_WHILE
	STR R1, R2, #0					;Mem[R2] <- R1
	ADD R2, R2, #1					;R2 <- R2 + 1
	ADD R1, R1, R1					;R1 <- R1 + R1
	ADD R3, R3, #-1					;R3 <- R1 + (-1)
	BRnp DO_WHILE					;if (R3 < 0) then DO_WHILE
END_DO_WHILE						
	
LD R2, DATA_PTR						;R4 <- Mem[DATA_PTR]
;ADD R4, R4, #6						;R4 <- R4 + 6
;LDR R2, R4, #0						;R2 <- R4
LD R3, COUNTER						;R5 <- Mem[COUNTER]

OUTPUT_LOOP
	LDR R1, R2, #0
	LD R7, SUB_BINARY_CONVERT_3200
	JSRR R7
	ADD R2, R2, #1
	ADD R3, R3, #-1
	BRnp OUTPUT_LOOP
END_OUTPUT_LOOP

HALT								;terminates the program
;----------------
;Local Data
;----------------
DATA_PTR	.FILL	x4000			;location of array
COUNTER		.FILL	#10				;counter from dec #10
M_OF_TWO	.FILL	#1				;counts powers of 2 from #1
SPACE		.STRINGZ 	" "
SUB_BINARY_CONVERT_3200	.FILL	x3200
;-----------------
;Remote Data
;-----------------
.ORIG x4000

ARRAY_RES	.BLKW	#10				;blocks off 10 spots for the array

;==============================================================
; Subroutine: SUB_BINARY_CONVERT_3200
; Parameter: (R1): Decimal to Binary
; Postcondition: Convert R1 from decimal to 16-bit binary
; Return Value: None
;==============================================================
.ORIG x3200

;============================
; Subroutine Instructions
;============================

; (1) Backup R7 and resgisters
ST R0, BACKUP_R0_3200
ST R1, BACKUP_R1_3200
ST R2, BACKUP_R2_3200
ST R3, BACKUP_R3_3200
ST R7, BACKUP_R7_3200

; (2) Algorithm
LD R2, LOOP_COUNT

SUBLOOP
	ADD R1, R1, #0
	BRp IF_POSITIVE
	BRn	IF_NEGATIVE

IF_POSITIVE
	LD R0, ASCII_ZERO
	OUT
	BRnzp IF_SHIFT
	
IF_NEGATIVE
	LD R0, ASCII_ONE
	OUT
	BRnzp IF_SHIFT
	
IF_SHIFT
	ADD R1, R1, R1
	ADD R2, R2, #-1
	BRz END_SUBLOOP
	ADD R3, R2, #-12
	;BRz SPACE_OUT
	ADD R3, R2, #-8
	;BRz SPACE_OUT
	ADD R3, R2, #-4
	;BRz SPACE_OUT
	BRnzp SUBLOOP
	
SPACE_OUT
	LD R0, SPACE_SUB
	OUT
	BRnzp SUBLOOP

END_SUBLOOP
	LD R0, NEWLINE_SUB
	OUT

; (3) Restore Registers
LD R0, BACKUP_R0_3200
LD R1, BACKUP_R1_3200
LD R2, BACKUP_R2_3200
LD R3, BACKUP_R3_3200
LD R7, BACKUP_R7_3200

; (4) RET
RET

;===================
; Subroutine Data
;===================
NEWLINE_SUB	.STRINGZ	"\n"
SPACE_SUB	.STRINGZ	" "
LOOP_COUNT	.FILL	#16
ASCII_ZERO	.FILL	#48
ASCII_ONE	.FILL	#49

BACKUP_R0_3200	.BLKW	#1
BACKUP_R1_3200	.BLKW	#1
BACKUP_R2_3200	.BLKW	#1
BACKUP_R3_3200	.BLKW	#1
BACKUP_R7_3200	.BLKW	#1

.END
