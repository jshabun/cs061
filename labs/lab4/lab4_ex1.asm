;=================================================
; Name: Joshua Shabun
; Email: jshab003@ucr.edu
; 
; Lab: lab 4, ex 1
; Lab section: 024
; TA: Shirin Haji Amin Shirazi
; 
;=================================================

.ORIG x3000

;--------------
;Instructions
;---------------
AND R1, R1, x0						;R1 <- x0 (counter that starts from 0)
LD R2, DATA_PTR						;R2 <- Mem[DATA_PTR]

DO_WHILE
	STR R1, R2, #0					;Mem[R2] <- R1
	ADD R2, R2, #1					;R2 <- R2 + 1
	ADD R1, R1, #1					;R1 <- R1 + 1
	ADD R3, R1, #-10				;R3 <- R1 + (-10)
	BRnp DO_WHILE					;if (R3 < 0) then DO_WHILE
	
LD R4, DATA_PTR						;R4 <- Mem[DATA_PTR]
ADD R4, R4, #6						;R4 <- R4 + 6
LDR R2, R4, #0						;R2 <- R4

HALT								;terminates the program
;----------------
;Local Data
;----------------
DATA_PTR	.FILL	x4000			;location of array

;-----------------
;Remote Data
;-----------------
.ORIG x4000

ARRAY_RES	.BLKW	#10				;blocks off 10 spots for the array

.END
