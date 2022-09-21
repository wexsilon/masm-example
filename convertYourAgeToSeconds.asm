.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Your Age: ", 0
	msgres db "Seconds: %d", 0
	frmtint db "%d", 0
	age dd 0


.code
	main proc

		push offset msginpt
		call crt_printf

		push offset age
		push offset frmtint
		call crt_scanf

		mov eax, age
		mov ecx, 24
		mul ecx
		mov ecx, 3600
		mul ecx
		mov ecx, 365
		mul ecx

		push eax
		push offset msgres
		call crt_printf

		push 0
		call ExitProcess
	main endp
end main