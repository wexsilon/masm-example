.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	PI equ 3
	msginpt db "Enter Radius: ", 0
	msgres db "Circle Perimeter: %d", 0
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
		mov ecx, 2
		mul ecx
		mov ecx, PI
		mul ecx

		push eax
		push offset msgres
		call crt_printf

		push 0
		call ExitProcess
	main endp
end main