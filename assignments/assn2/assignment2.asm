;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Joshua Shabun
; Email: joshua.shabun@email.ucr.edu
; 
; Assignment name: Assignment 2
; Lab section: 24
; TA: Shirin Haji Amin Shirazi
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================

.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------

;----------------------------------------------
;output prompt
;----------------------------------------------	
LEA R0, intro			; get starting address of prompt string
PUTS			    	; Invokes BIOS routine to output string

;-------------------------------
;INSERT YOUR CODE here
;--------------------------------
TRAP x20				;also can use GETC. captures input and stores in R0
OUT						;TRAP x21. ouputs the ASCII stored in R0 as text character
ADD R1, R0, #0			;stores first input from R0 (num1) in R1
LD R0, newline			;prints newline
OUT						;TRAP x21. outputs current ASCII code stored in R0 to console

TRAP x20				;GETC. Captures and stores input in R0
OUT						;ouputs current ASCII code in R0 to console
ADD R2, R0, #0			;stores (num2) input from R0 in R2. [R2 <- R0 + 0]
LD R0, newline			;prints newline
OUT						;outputs R0 as character to console.

ADD R0, R1, #0			; [R0 <- R1 + 0]
OUT						;prints R0 to console

LEA R0, subtract		;loads address corresponding to label 'subtract' to R0
PUTS					;writes the entire string contained in R0 to console

ADD R0, R2, #0			;[R0 <- R2 + 0]
OUT						;prints ASCII character in R0 to console as character

LEA R0, equals			;loads address from 'equals' label to R0 [R0 <- Mem[subtracts]]
PUTS					;ouputs entire string contained in R0 to console.

;------- convert to number -----------
						; For R1
ADD R1, R1, #-16		;[R1 <- R1 + (x30)]
ADD R1, R1, #-16
ADD R1, R1, #-16
						; For R2
ADD R2, R2, #-16		;[R2 <- R2 + (-16)]
ADD R2, R2, #-16
ADD R2, R2, #-16

;--------- 2's complement ------------
NOT R2, R2				;2's complement of value in R2
ADD R2, R2, #1			;[R2 <- R2 + 1] add 1 to R2
ADD R3, R1, R2			;[R3 <- R1 + R2] adding R1 and R2 and storing in 3
						; after this step begins the check for whether it is + or -
;---------- negative check ------------
BRn NEGATIVE_CHECK		;if (R3 < 0) go to NEGATIVE_CHECK, else continue

;----------- number conversion back for output -----------
ADD R3, R3, #12			;if check above continued, you end up here - conversion for output
ADD R3, R3, #12			;[R3 <- R3 + 12]
ADD R3, R3, #12			;[R3 <- R3 + 12]
ADD R3, R3, #12			;[R3 <- R3 + 12]

ADD R0, R3, #0			;[R0 <- R3 + 0] - storing R3 calculated value in R0 for output
OUT						;printing R0 to console

LD R0, newline			;prints newline
OUT						;ouputs newline from R0

HALT					;Stop execution of program

;---------- negative & number conversion for output -----------
NEGATIVE_CHECK
	NOT R3, R3			;2's complement of R2
	ADD R3, R3, #1		;[R3 <- R3 + 1]
	
	ADD R3, R3, #12		;[R3 <- R3 + 12] - converting back for output
	ADD R3, R3, #12		;[R3 <- R3 + 12]
	ADD R3, R3, #12		;[R3 <- R3 + 12]
	ADD R3, R3, #12		;[R3 <- R3 + 12]
	
	LD R0, negative		;stores negative sign in R0
	OUT					; outputs R0 to console
	
	ADD R0, R3, #0		;[R0 <- R3 + 0] - stores R3 in R0 for output
	OUT					;prints R0 to console
	
	LD R0, newline		;prints newline since program must end with newline
	OUT					;outputs newline from R0
	
	HALT				;Stop execution of program

;-------------------
;ADD R0, R1, R2			;[R0 <- R1 + R2] stores sum of R1 and R2 to R0.
						;This will be the calculated value we output.
						
;ADD R1, R1, x30			;[R1 <- R1 + x30]
;ADD R2, R2, x30			;[R2 <- R2 + x30]
;
;NOT R2, R2				;2's complement of R2
;ADD R2, R2, #1			;[R2 <- R2 + 1]
;ADD R3, R1, R2			;[R3 <- R1 + R2] This will be our sum
;
;BRn NEGATIVE_CHECK		;if (R3 < 0) go to NEGATIVE_CHECK

;HALT				; Stop execution of program
;------	
;Data
;------
; String to prompt user. Note: already includes terminating newline!
intro 	.STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 		; prompt string - use with LEA, followed by PUTS.
newline .FILL '\n'	; newline character - use with LD followed by OUT
subtract	.STRINGZ " - "	;minus subtraction character
equals	.STRINGZ " = "	;equals characters
negative	.STRINGZ "-"	;negative character


;---------------	
;END of PROGRAM
;---------------	
.END

