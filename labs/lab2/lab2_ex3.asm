;=================================================
; Name: Joshua Shabun
; Email:  jshab003@ucr.edu
; 
; Lab: lab 2, ex 3
; Lab section: 24
; TA: Shirin Haji Amin Shirazi
; 
;=================================================

.ORIG x3000
;--------------
;Instructions
;--------------
LDI R3, DEC_65_PTR				;loads #65 into R3 (R3 <- #65)
LDI R4, HEX_41_PTR				;loads x41 into R4 (R4 <- x41)

ADD R3, R3, #1					;adds 1 to value of R3 (R3 <- R3 + #1)
ADD R4, R4, #1					;adds 1 to value of R4 (R4 <- R4 + #1)

STI R3, DEC_65_PTR				;store #66 to x4000
STI R4, HEX_41_PTR				;stores x42 to x4001

LD R5, DEC_65_PTR				;directly load value of x4000 to R5 (R5 <- Mem[x4000])
LD R6, HEX_41_PTR				;directly load value of x4001 to R6 (R6 <- Mem[x4001])

LDR R3, R5, #0					;load data into R3 using R5 as base register
LDR R4, R6, #0					;load data into R4 using R6 as a base register

ADD R3, R3, #1					;adds 1 to value of R3 (R3 <- R3 + #1)
ADD R4, R4, #1					;adds 1 to value of R4 (R4 <- R4 + #1)

STR R3, R5, #0					;stores incremented R3 value back into R5
STR R4, R6, #0					;stores incremented R4 value back into R6

HALT							;terminates the program
;---------------
;Local Data
;---------------
DEC_65_PTR	.FILL	x4000		;puts address x4000 in memory here
HEX_41_PTR	.FILL	x4001		;puts address x4001 in memory here
;----------------
;Remote Data
;----------------
.ORIG x4000
DEC_65	.FILL	#65				;Puts #65 into memory at x4000
HEX_41	.FILL	x41				;Puts x41 into memory at x4001

.END
