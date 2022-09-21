.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Three Numbers: ", 0
	frmtints db "%d%d%d", 0
	num1 dd 0
	num2 dd 0
	num3 dd 0
	msgResMax db "MAX: %d", 10, 0

.code
	main proc

		push offset msginpt
		call crt_printf
		
		push offset num3
		push offset num2
		push offset num1
		push offset frmtints
		call crt_scanf
		
		mov eax, num1
		cmp eax, num2
		jae LBL1
		mov eax, num2
		LBL1:
		cmp eax, num3
		jae LBL2
		mov eax, num3
		LBL2:
		push eax
		push offset msgResMax
		call crt_printf
		
		push 0
		call ExitProcess

	main endp
end main