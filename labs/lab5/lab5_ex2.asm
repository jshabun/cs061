;=================================================
; Name: Joshua Shabun
; Email: jshab003@ucr.edu
; 
; Lab: lab 5, ex 2
; Lab section: 024
; TA: Shirin Haji Amin Shirazi
; 
;=================================================
.ORIG x3000

;=================
; Instructions
;=================
LEA R0, PROMPT
PUTS
GETC
OUT
AND R0, R0, #0

LD R6, SUB_DECIMAL_BINARY_3400
JSRR R6

LD R6, SUB_BINARY_DECIMAL_3200
JSRR R6

HALT
;=====================
; Local Data
;=====================
PROMPT	.STRINGZ	"Enter a 16-bit 2's complement binary number\n(e.g. b0001001000110100):\n"
SUB_DECIMAL_BINARY_3400	.FILL	x3400
SUB_BINARY_DECIMAL_3200	.FILL	x3200

;=======================================================================
; Subroutine: SUB_DECIMAL_BINARY_3200
; Parameter: (R1): Convert decimal to 16-bit binary
; Postcondition: convert and print 16-bit binary from decimal in R1
; Return Value: None
;=======================================================================
.ORIG x3200

;=========================
; Subroutine Instructions
;=========================
; (1) Backup and R7 and registers
ST R0, BACKUP_R0_3200
ST R1, BACKUP_R1_3200
ST R2, BACKUP_R2_3200
ST R3, BACKUP_R3_3200
ST R4, BACKUP_R4_3200
ST R7, BACKUP_R7_3200

; (2) Algorithm
LD R2, SIZE 

DO_WHILE
	ADD R1, R1, #0
    BRp IF_POSITIVE
    BRn IF_NEGATIVE

IF_POSITIVE
	LD R0, ASCII_ZERO
    OUT
    BRnzp IF_SHIFT

IF_NEGATIVE
	LD R0, ASCII_ONE
    OUT
    BRnzp IF_SHIFT

IF_SHIFT
	ADD R1, R1, R1 ; Shift binary left
    ADD R2, R2, #-1
    BRz END_LOOP
    ADD R3, R2, #-12
    ;BRz SPACE_OUT
    ADD R3, R2, #-8
    ;BRz SPACE_OUT
    ADD R3, R2, #-4
    ;BRz SPACE_OUT
    BRnzp DO_WHILE

SPACE_OUT
    LD R0, SPACE_1
    OUT
    BRnzp DO_WHILE

END_LOOP
    LD R0, NEWLINE_1
    OUT

; (3) Restore Registers
LD R0, BACKUP_R0_3200
LD R1, BACKUP_R1_3200
LD R2, BACKUP_R2_3200
LD R3, BACKUP_R3_3200
LD R4, BACKUP_R4_3200
LD R7, BACKUP_R7_3200

; (4) RET
RET

;=======================
; Subroutine Data
;=======================
NEWLINE_1 .STRINGZ "\n"
SPACE_1 .STRINGZ " "
ASCII_ZERO .FILL #48 ; ASCII 0
ASCII_ONE .FILL #49 ; ASCII 1
SIZE .FILL #16 ;Counter

BACKUP_R0_3200 .BLKW #1
BACKUP_R1_3200 .BLKW #1
BACKUP_R2_3200 .BLKW #1
BACKUP_R3_3200 .BLKW #1
BACKUP_R4_3200 .BLKW #1
BACKUP_R7_3200 .BLKW #1

;=======================================================================
; Subroutine: SUB_BINARY_DECIMAL_3400
; Parameter: None
; Postcondition: Convert input to decimal
; Return Value: R1 converted decimal from binary input
;=======================================================================
.ORIG x3400

;======================
; Subroutine Instructions
;======================
; (1) Backup R7 and registers
ST R0, BACKUP_R0_3400
ST R2, BACKUP_R2_3400
ST R3, BACKUP_R3_3400
ST R4, BACKUP_R4_3400
ST R7, BACKUP_R7_3400

; (2) Algorithm
LD R3, LOOP_SIZE
AND R1, R1, #0
LD R4, NEGATIVE_DEC

INPUT_LOOP
	GETC
	OUT
	ADD R1, R1, R1
    ADD R0, R0, R4
    BRp ADD_1
    BRnz END_INPUT_LOOP

    ADD_1
		ADD R1, R1, #1

	END_INPUT_LOOP
		ADD R3, R3, #-1

    BRp INPUT_LOOP
	LD R0, NEWLINE_2
    OUT

; (3) Restore Registers
LD R0, BACKUP_R0_3400
LD R2, BACKUP_R2_3400
LD R3, BACKUP_R3_3400
LD R4, BACKUP_R4_3400
LD R7, BACKUP_R7_3400

; 4) RET
RET

;====================
; Subroutine Data
;====================

LOOP_SIZE .FILL #16 ;counter
NEGATIVE_DEC .FILL #-48
NEWLINE_2 .STRINGZ "\n"

BACKUP_R0_3400 .BLKW #1
BACKUP_R2_3400 .BLKW #1
BACKUP_R3_3400 .BLKW #1
BACKUP_R4_3400 .BLKW #1
BACKUP_R7_3400 .BLKW #1

.END

