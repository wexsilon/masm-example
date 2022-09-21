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

	n2 dd 0
	m2 dd 0
	r2 dd 0 


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
		mul eax
		mov n2, eax

		mov eax, m
		mul eax
		mov m2, eax

		mov eax, r
		mul eax
		mov r2, eax

		mov ebx, n2
		add ebx, m2
		cmp eax, ebx
		je PRINTYES

		add eax, n2
		mov ebx, m2
		cmp eax, ebx
		je PRINTYES


		add ebx, r2
		mov eax, n2
		cmp eax, ebx
		je PRINTYES

		push offset msgNo
		call crt_printf
		jmp EXITPROGRAM

		PRINTYES:
		push offset msgYes
		call crt_printf
		
		EXITPROGRAM:
		push 0
		call ExitProcess
	main endp
end main