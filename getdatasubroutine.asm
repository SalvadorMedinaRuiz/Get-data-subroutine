;Salvador Medina-Ruiz
;11-16-2021
;Get Data Sub Routine
			.ORIG		x3000
			
			JSR		GETDATA
			ST		R1, FIRST				;stores the two digit number in FIRST
			
;if you want more number, call sub routine again and store it into second
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, SECOND
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, THIRD
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, FOURTH
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, FIFTH
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, SIX
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, SEVENTH
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, EIGTH
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, NINETH
			AND		R5, R5, 0
			JSR		GETDATA
			ST		R1, TENTH

			HALT
FIRST			.BLKW		1
SECOND			.BLKW		1
THIRD			.BLKW		1
FOURTH			.BLKW		1
FIFTH			.BLKW		1
SIX			.BLKW		1
SEVENTH			.BLKW		1
EIGTH			.BLKW		1
NINETH			.BLKW		1
TENTH			.BLKW		1

;;sub rotuine for asking for a two digit number;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GETDATA			ST		R7, SAVER7
			ST		R6, SAVER6
			ST		R5, SAVER5
			ST		R2, SAVER2

			AND		R1, R1, 0
			AND		R2, R2, 0
			LEA		R0, PROMPT
			LD		R6, THIRTY
			PUTS
			GETC							;we are getting our first character
			OUT

			ADD		R1, R0, 0				;R0 has the first character, so we put it into R1
			ADD		R1, R1, R6				;subtracts 48 to R1 to turn it into a number
			LD		R5, TEN					;loads ten into R5
			JSR		MULTIPLICATION
		
			GETC							;now we are getting the second character
			OUT
			ADD		R0, R0, R6				;subtracts 48 to turn it into a number
			ADD		R1, R0, R1				;R1 = 40 + 5 = 45

			LD		R0, CR
			OUT
			LD		R0, LF
			OUT

			LD		R2, SAVER2
			LD		R5, SAVER5
			LD		R6, SAVER6
			LD		R7, SAVER7
			RET	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Multiplication sub routine;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MULTIPLICATION		ST		R7, MULTSAVER7
			ST		R5, MULTSAVER5
			ST		R3, MULTSAVER3
			AND		R3, R3, 0
AGAIN			ADD		R3, R3, R1
			ADD		R5, R5, -1	
			BRp		AGAIN
			AND		R1, R1, 0				;the number we started with R1
			ADD		R1, R3, 0
			LD		R3, MULTSAVER3
			LD		R5, MULTSAVER5
			LD		R7, MULTSAVER7
			RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SAVER7			.BLKW		1					;TO store where we were from R7 in SAVER7
SAVER6			.BLKW		1					;Same for the rest
SAVER5			.BLKW		1					;
SAVER2			.BLKW		1					;
MULTSAVER7		.BLKW		1
MULTSAVER5		.BLKW		1
MULTSAVER3		.BLKW		1
PROMPT			.STRINGZ	"Enter a two digit number"
CR			.FILL		13
LF			.FILL		10
TEN			.FILL		10					;TO make our one character (number) a 2 digit one 4 = 4+10 = 40
THIRTY			.FILL		xFFD0					;covert character to digit. 48 is 30 in hex, so FFD0 is -30 in hex
			.END
