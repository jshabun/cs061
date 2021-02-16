;=================================================
; Name: Joshua Shabun
; Email: jshab003@ucr.edu
; 
; Lab: lab 4, ex 3
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
	
LD R4, DATA_PTR						;R4 <- Mem[DATA_PTR]
ADD R4, R4, #6						;R4 <- R4 + 6
LDR R2, R4, #0						;R2 <- R4

HALT								;terminates the program
;----------------
;Local Data
;----------------
DATA_PTR	.FILL	x4000			;location of array
COUNTER		.FILL	#10				;counter from dec #10
M_OF_TWO	.FILL	#1				;counts powers of 2 from #1
;-----------------
;Remote Data
;-----------------
.ORIG x4000

ARRAY_RES	.BLKW	#10				;blocks off 10 spots for the array

.END
