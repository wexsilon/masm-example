.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Number: ", 0
	msgres db "Reverse: ", 0
	frmtint db "%d", 0
	num dd 0

.code
	main proc

		push offset msginpt
		call crt_printf

		push offset num
		push offset frmtint
		call crt_scanf

		push offset msgres
		call crt_printf
		
		LBL:
		mov eax, num
		cmp eax, 0
		je EXITPROGRAM
		xor edx, edx
		mov ecx, 10
		div ecx
		
		mov num, eax
		
		push edx
		push offset frmtint
		call crt_printf

		jmp LBL


		EXITPROGRAM:
		push 0
		call ExitProcess
	main endp
end main