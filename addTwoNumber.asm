.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	num1 dd 0
	num2 dd 0
	frmts db "%d%d", 0
	msginpt db "Enter Two Number: ", 0
	msgres db "Result: %d", 10, 0

.code
	main proc
		push offset msginpt
		call crt_printf

		push offset num2
		push offset num1
		push offset frmts
		call crt_scanf

		mov eax, num1
		add eax, num2

		push eax
		push offset msgres
		call crt_printf

		push 0
		call ExitProcess
	main endp
end main