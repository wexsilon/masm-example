.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginptcy db "Enter Current Year: ", 0
	msginpt db "Enter Year of Birth: ", 0
	msgres db "You're %d years old.", 0
	frmtint db "%d", 0
	year dd 0
	curyear dd 0

.code
	main proc

		push offset msginptcy
		call crt_printf

		push offset curyear
		push offset frmtint
		call crt_scanf

		push offset msginpt
		call crt_printf

		push offset year
		push offset frmtint
		call crt_scanf

		mov eax, curyear
		sub eax, year

		push eax
		push offset msgres
		call crt_printf

		push 0
		call ExitProcess
	main endp
end main