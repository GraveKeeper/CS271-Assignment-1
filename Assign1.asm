; Assignment 1     (Assignment1.asm)

; Author(s): Sean Harrington
; CS_271 / Project ID                 Date: 1/19/2023

; Description: 
; Write and test a MASM program that performs the following tasks: 
; Display your name and program title on the output screen. 
; Display instructions for the user. 
; Prompt the user to enter two numbers. 
; Calculate the sum, difference, product, (integer) quotient and remainder of the numbers. 
; Display a terminating message. 

; Extra Credit
; Repeat until the user chooses to quit.
; Validate the second number to be less than the first. 
; Calculate and display the quotient as a floating-point number, rounded to the nearest .001. 


INCLUDE Irvine32.inc

; (insert constant definitions here)
.386
.stack 4096			;SS register
ExitProcess proto,dwExitCode:dword

.data
	intro1					BYTE				"Assignment 1 in MASM ",0					;Display Assignment name
	intro2					BYTE				"by: Sean Harrington ",0					;Display creators name
	prompt1					BYTE				"Please enter 2 numbers ",0					;Prompt for users input
	prompt2					BYTE				"and i'll output the Sum, ",0				;Cont.
	prompt3					BYTE				"Difference, Product, Quotient ",0			;Cont.
	prompt4					BYTE				"and Remainder.",0							;Cont.
	uNum1					DWORD				?											;Take in Users input for first Num
	uNum2					DWORD				?											;Take in Users input for second Num
	uIn1					BYTE				" First Number: ",0							;First Input
	uIn2					BYTE				" Second Number: ",0						;Second Input
	dSum					DWORD				?											;variable for sum
	dDiff					DWORD				?											;variable for difference
	dProd					DWORD				?											;variable for product
	dQuo					DWORD				?											;variable for quotient
	dRem					DWORD				?											;variable for remainder
	bye1					BYTE				"GoodBye! ",0								;Exit message 
	plusSign				BYTE				" + ",0
	minusSign				BYTE				" - ",0
	equalSign				BYTE				" = ",0
	multSign				BYTE				" x ",0
	divSign					BYTE				" / ",0
	rPrompt					BYTE				"remainder ",0


; (insert variable definitions here)

.code
main PROC

; Program introduction displays text and set up user prompt for input
	Introduction:
		mov EDX, OFFSET intro1																;Move copy of into1 to a known address
		call WriteString																	;call write command
		call Crlf																			;End of line sequence

		mov EDX, OFFSET intro2																;Move copy of into1 to a known address
		call WriteString																	;call write command
		call Crlf																			;End of line sequence


		mov EDX, OFFSET prompt1																;output Text Instructions
		call WriteString
		mov EDX, OFFSET prompt2
		call WriteString
		mov EDX, OFFSET prompt3
		call WriteString
		mov EDX, OFFSET prompt4
		call WriteString
		call Crlf

; Take in previously prompted data consiting of 2 seperate Integers
	GetData:
		mov EDX, OFFSET uIn1
		call WriteString
		call Crlf
		call ReadInt																		;Get Data From user for first number
		mov uNum1, EAX

		mov EDX, OFFSET uIn2
		call WriteString
		call Crlf
		call ReadInt																		;Get Data From user for second number
		mov uNum2, EAX

	CalculateData:

; Sum
; Take data and calculate sum of Num1 and Num2
		mov EAX, uNum1
		mov EBX, uNum2
		add EAX, EBX																		;add
		mov dSum, EAX

; Difference
; Take data and calculate difference of Num1 and Num2
		mov EAX, uNum1
		mov EBX, uNum2
		sub EAX, EBX																		;subtract
		mov dDiff, EAX

; Product
; Take data and calculate product of Num1 and Num2
		mov EAX, uNum1
		mov EBX, uNum2
		mul EBX																				;multiply
		mov dProd, EAX
	

; Quotient
; Take data and calculate Quotient of Num1 and Num2
		mov EAX, uNum1
		mov EBX, uNum2
		cdq
		div EBX																				;divide
		mov dQuo, EAX


; Remainder
; Finally find the remainder 
		mov dRem, EDX


; Write data results to the screen for all previous operations
	DisplayData:
		
		mov EAX, uNum1																		;Print to screen the Sum
		call WriteDec
		mov EDX, OFFSET plusSign
		call WriteString
		mov EAX, uNum2
		call WriteDec
		mov EDX, OFFSET equalSign
		call WriteString
		mov EAX, dSum
		call WriteDec
		call Crlf

		mov EAX, uNum1																		;Print to screen the Difference
		call WriteDec
		mov EDX, OFFSET minusSign
		call WriteString
		mov EAX, uNum2
		call WriteDec
		mov EDX, OFFSET equalSign
		call WriteString
		mov EAX, dDiff
		call WriteDec
		call Crlf

		mov EAX, uNum1																		;Print to screen the product
		call WriteDec
		mov EDX, OFFSET multSign
		call WriteString
		mov EAX, uNum2
		call WriteDec
		mov EDX, OFFSET equalSign
		call WriteString
		mov EAX, dProd
		call WriteDec
		call Crlf

		mov EAX, uNum1																		;Print to screen the quotient
		call WriteDec
		mov EDX, OFFSET divSign
		call WriteString
		mov EAX, uNum2
		call WriteDec
		mov EDX, OFFSET equalSign
		call WriteString
		mov EAX, dQuo
		call WriteDec
		call Crlf

		mov EDX, OFFSET rPrompt																;Print to screen the remainder
		call WriteString
		mov EAX, dRem
		call WriteDec
		call Crlf
		call Crlf

; Display exit message to screen
	ByeBye:
		mov	EDX, OFFSET bye1				
		call WriteString
		call Crlf


; (insert executable instructions here)

	
	invoke ExitProcess,0
	exit	; exit to operating system
main ENDP


; (insert additional procedures here)

END main
