.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	frmtint db "%d", 0
	msginpt db "Enter The Number: ", 0
	msgOdd db "%d Is Odd Number", 10, 0
	msgEven db "%d Is Even Number", 10, 0
	num dd 0


.code
	main proc
		; printf(msginpt)
		push offset msginpt
		call crt_printf

		; scanf(frmtint, &num)
		push offset num
		push offset frmtint
		call crt_scanf

		; eax = num / 2
		mov eax, num
		mov edx, 0
		mov ecx, 2
		div ecx

		push num
		cmp edx, 0
		je PrintEven
		push offset msgOdd
		jmp CallPrintf
		PrintEven:
			push offset msgEven
		CallPrintf:
			call crt_printf

		; ExitProcess(0)
		push 0
		call ExitProcess
	main endp
end main