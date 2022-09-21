.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Two Number: ", 0
	msgYes db "YES", 0
	msgNo db "No", 0
	frmtint db "%d%d", 0
	num1 dd 0
	num2 dd 0

.code
	main proc
		push offset msginpt
		call crt_printf

		push offset num2
		push offset num1
		push offset frmtint
		call crt_scanf

		xor edx, edx
		mov eax, num1
		div num2

		cmp edx, 0
		je PRINTYES
		push offset msgNo
		jmp EXITPROGRAM
		PRINTYES:
		push offset msgYes
		
		EXITPROGRAM:
		call crt_printf
		push 0
		call ExitProcess
	main endp
end main