.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Count Of Year: %d", 0
	msgres db "Count Of Days: %d", 0
	frmtint db "%d", 0
	years dd 0

.code
	main proc

		push offset msginpt
		call crt_printf

		push offset years
		push offset frmtint
		call crt_scanf

		mov eax, years
		mov ecx, 365
		mul ecx

		push eax
		push offset msgres
		call crt_printf

		push 0
		call ExitProcess
	main endp
end main