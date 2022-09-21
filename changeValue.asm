.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Two Number: ", 0
	msgbefore db "Before Change: %d, %d", 10, 0
	msgafter db "After Change: %d, %d", 10, 0
	frmtint db "%d%d", 0
	num1 dd 0
	num2 dd 0

.code
	main proc
		; printf(msginpt)
		push offset msginpt
		call crt_printf

		; scanf(frmtint, &num1, &num2)
		push offset num2
		push offset num1
		push offset frmtint
		call crt_scanf

		; printf(msgbefore, num1, num2)
		push num2
		push num1
		push offset msgbefore
		call crt_printf

		; change values
		mov eax, num1
		xchg eax, num2
		mov num1, eax

		; printf(msgafter, num1, num2)
		push num2
		push num1
		push offset msgbefore
		call crt_printf

		; ExitProcess(0)
		push 0
		call ExitProcess
	main endp
end main