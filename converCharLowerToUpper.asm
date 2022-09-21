.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Char: ", 0
	msgres db "UpperChar: %c", 0
	frmtint db "%c", 0
	chr dd 0


.code
	main proc
		push offset msginpt
		call crt_printf

		push offset chr
		push offset frmtint
		call crt_scanf

		mov eax, 223
		and eax, chr

		push eax
		push offset msgres
		call crt_printf
		EXITPROGRAM:
		push 0
		call ExitProcess
	main endp
end main