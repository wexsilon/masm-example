.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Dimensions (ex: 8 4 3) >>> ", 0
	msgYes db "YES", 0
	msgNo db "No", 0
	frmtint db "%d%d%d", 0
	n dd 0
	m dd 0
	r dd 0


.code
	main proc
		push offset msginpt
		call crt_printf

		push offset r
		push offset m
		push offset n
		push offset frmtint
		call crt_scanf

		mov eax, n
		add eax, m
		mov ebx, r
		cmp eax, ebx ; eax = n + m, ebx = r
		jna PRINTNO

		add ebx, n
		mov eax, m
		cmp ebx, eax ; ebx = n + r, eax = m
		jna PRINTNO

		add eax, r
		mov ebx, n
		cmp eax, ebx ; eax = m + r, ebx = n
		jna PRINTNO

		push offset msgYes
		call crt_printf
		jmp EXITPROGRAM


		PRINTNO:
		push offset msgNo
		call crt_printf

		EXITPROGRAM:
		push 0
		call ExitProcess
	main endp
end main