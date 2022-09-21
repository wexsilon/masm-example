.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Length, Width And Height (ex: 8 4 2) >>> ", 9
	msgres db "Trapezius Area: %d", 0
	frmtints db "%d%d%d", 0
	ln dd 0
	wd dd 0
	ht dd 0


.code
	main proc
		push offset msginpt
		call crt_printf

		push offset ln
		push offset wd
		push offset ht
		push offset frmtints
		call crt_scanf

		mov eax, ln
		add eax, wd
		mul ht
		mov ecx, 2
		xor edx, edx
		div ecx		

		push eax
		push offset msgres
		call crt_printf

		push 0
		call ExitProcess
	main endp
end main