;=================================================
; Name: Joshua Shabun
; Email:  jshab003@ucr.edu
; 
; Lab: lab 2, ex 4
; Lab section: 24
; TA: Shirin Haji Amin Shirazi
; 
;=================================================

.ORIG x3000
;-------------
;Instructions
;-------------
LD R0, HEX_61			 	;loads HEX_61 to R0 (R0 <- x61)
LD R1, HEX_1A				;loads HEX_1A to R1 (R1 <- x1A)

DO_WHILE_LOOP
	OUT 					;outputs contents of R0 to console 
	ADD R0, R0, #1			; increments R0 by 1 (R0 <- R0 + #1)
	ADD R1, R1, #-1			; increments R1 by -1 (decreases by 1) (R1 <- R1 + (#-1))
	BRp DO_WHILE_LOOP		;if (R1>0) goto DO_WHILE_LOOP
END_DO_WHILE_LOOP

HALT						;terminate program
;-------------
;Local Data
;-------------
HEX_61	.FILL	x61			;puts hex value x61 into memory here
HEX_1A	.FILL	x1A			;puts hex value x1A into memory here

.END
