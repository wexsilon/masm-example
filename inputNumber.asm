.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	intfrmt db "%d", 0
	outmsg db "You Entered %d", 0
	num dd ?
.code
	main proc
		push offset num
		push offset intfrmt
		call crt_scanf

		push num
		push offset outmsg
		call crt_printf

		push 0
		call ExitProcess
	main endp
end main