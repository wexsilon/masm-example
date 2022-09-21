.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Count Of Star: ", 0
	num dd 0
	frmtint db "%d", 0
	msgstar db "* ", 0
	;loopidx dd 0
.code
	main proc
		push offset msginpt
		call crt_printf

		push offset num
		push offset frmtint
		call crt_scanf

		mov ecx, num
		LPFOR:
			mov loopidx, ecx
			push offset msgstar
			call crt_printf
			mov ecx, loopidx
		loop LPFOR

		push 0
		call ExitProcess
	main endp
end main





