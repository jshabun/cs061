;=================================================
; Name: Joshua Shabun
; Email: jshab003@ucr.edu
; 
; Lab: lab 3, ex 1
; Lab section: 024
; TA: Shirin Haji Amin Shirazi
; 
;=================================================

.ORIG x3000
;--------------
;Instructions
;--------------
LD R5, DATA_PTR					;R5 <- DATA_PTR

LDR R3, R5, #0					;R3 <- Mem[R5] + 0
LDR R4, R5, #1					;R4 <- Mem[R5] + 1

ADD R3, R3, #1					;R3 <- R3 + 1
ADD R4, R4, #1					;R4 <- R4 + 1

STR R3, R5, #0					;Mem[R5] + 0 <- R3
STR R4, R5, #1					;Mem[R5] + 1 <- R4

HALT							;terminates the program
;---------------
;Local Data
;---------------
;DEC_65_PTR	.FILL	x4000		;puts address x4000 in memory here
;HEX_41_PTR	.FILL	x4001		;puts address x4001 in memory here

DATA_PTR	.FILL	x4000
;----------------
;Remote Data
;----------------
.ORIG x4000
DEC_65	.FILL	#65				;Puts #65 into memory at x4000
HEX_41	.FILL	x41				;Puts x41 into memory at x4001

.END
