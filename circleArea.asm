.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Radius: ", 0
	frmtint db "%d", 0
	rad dd 0



.code
	main proc
		push offset msginpt
		call crt_printf

		push offset rad
		push offset frmtint
		call crt_scanf

		mov eax, rad
		mul eax
		mov ecx, 3
		mul ecx

		push 0
		call ExitProcess
	main endp
end main