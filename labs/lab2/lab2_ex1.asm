;=================================================
; Name: Joshua Shabun
; Email: jshab003@ucr.edu
; 
; Lab: lab 2. ex 1
; Lab section: 24
; TA: Shirin Haji Amin Shirazi
; 
;=================================================

.ORIG x3000
;--------------
;Instructions
;--------------
LD R3, DEC_65				;loads DEC_65 to R3 (R3 <- #65)
LD R4, HEX_41				;loads HEX_41 to R4 (R4 <- x41)

HALT						; terminate program
;---------------
;Local Data
;---------------
DEC_65	.FILL	#65			;puts #65 into memory here
HEX_41	.FILL	x41			;puts x41 into memory here

.END
