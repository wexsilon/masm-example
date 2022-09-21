.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Start And End Number (ex: 2 10) >>> ", 0
	msgres db "%d ", 0
	frmtint db "%d%d", 0
	snum dd 0
	enum dd 0
	idx dd 0

.code
	main proc
		push offset msginpt
		call crt_printf

		push offset enum
		push offset snum
		push offset frmtint
		call crt_scanf

		mov eax, snum
		mov idx, eax
		PRINTRANGE:
		mov eax, idx
		cmp eax, enum
		ja EXITPROGRAM
		push idx
		push offset msgres
		call crt_printf
		inc idx
		jmp PRINTRANGE

		EXITPROGRAM:
		push 0
		call ExitProcess
	main endp
end main