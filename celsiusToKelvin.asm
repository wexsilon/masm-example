.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Celsius: ", 0
	msgres db "Kelvin: %d", 0
	frmtint db "%d", 0
	num dd 0

.code
	main proc
		push offset msginpt
		call crt_printf

		push offset num
		push offset frmtint
		call crt_scanf

		mov eax, num
		add eax, 273

		push eax
		push offset msgres
		call crt_printf

		push 0
		call ExitProcess
	main endp
end main