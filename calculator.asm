.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginptop db "Enter Oprator: ", 0
	msginptnums db "Enter Two Number: ", 0
	msginv db "Invalid Oprator", 0
	msgres db "%d %c %d = %d", 0
	frmtchr db "%c", 0
	frmtints db "%d%d", 0
	oprt dw 0
	num1 dd 0
	num2 dd 0


.code

	main proc

		push offset msginptop
		call crt_printf

		push offset oprt
		push offset frmtchr
		call crt_scanf

		push offset msginptnums
		call crt_printf

		push offset num2
		push offset num1
		push offset frmtints
		call crt_scanf

		mov eax, num1

		cmp oprt, 43
		
		jne CHECKSUB
		
		add eax, num2
		
		push eax
		push num2
		push 43
		
		jmp PRINTRESULT

		CHECKSUB:
		cmp oprt, 45
			
		jne CHECKMUL

		sub eax, num2
		push eax
		push num2
		push 45
		jmp PRINTRESULT

		CHECKMUL:
		cmp oprt, 42

		jne CHECKDIV

		mul num2
		push eax
		push num2
		push 42
		jmp PRINTRESULT

		CHECKDIV:
		cmp oprt, 47

		jne INVALIDOPRATOR
		xor edx, edx
		div num2
		push eax
		push num2
		push 47

		PRINTRESULT:
		push num1
		push offset msgres
		call crt_printf
		jmp EXITPROGRAM

		INVALIDOPRATOR:
		push offset msginv
		call crt_printf

		EXITPROGRAM:
		push 0
		call ExitProcess
	main endp

end main