.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msg db "Hello World!", 0

.code
	main proc
		push offset msg
		call crt_printf

		push 0
		call ExitProcess
	main endp
end main