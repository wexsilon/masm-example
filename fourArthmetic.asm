.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Two Number: ", 0
	frmtints db "%d%d", 0
	num1 dd 0
	num2 dd 0
	msgResAdd db "%d + %d = %d", 10, 0
	msgResSub db "%d - %d = %d", 10, 0
	msgResMul db "%d * %d = %d", 10, 0
	msgResDiv db "%d / %d = %d", 10, 0

.code
	main proc
		; printf(msginpt)
		push offset msginpt
		call crt_printf

		; scanf("%d%d", &num1, &num2)
		push offset num2
		push offset num1
		push offset frmtints
		call crt_scanf

		; eax = num1 + num2
		mov eax, num1
		add eax, num2

		; printf(msgResAdd, num1, num2, eax)
		push eax
		push num2
		push num1
		push offset msgResAdd
		call crt_printf

		; eax = num1 - num2
		mov eax, num1
		sub eax, num2

		; printf(msgResSub, num1, num2, eax)
		push eax
		push num2
		push num1
		push offset msgResSub
		call crt_printf

		; eax = num1 * num2
		mov eax, num1
		mov ebx, num2
		mul ebx

		; printf(msgResMul, num1, num2, eax)
		push eax
		push num2
		push num1
		push offset msgResMul
		call crt_printf

		; eax = num1 / num2
		mov eax, num1
		mov ebx, num2
		mov edx, 0
		div ebx

		; printf(msgResDiv, num1, num2, eax)
		push eax
		push num2
		push num1
		push offset msgResDiv
		call crt_printf
		
		; ExitProcess(0)
		push 0
		call ExitProcess
	main endp
end main