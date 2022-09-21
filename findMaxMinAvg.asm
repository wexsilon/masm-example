.386
.model flat, stdcall
option casemap:none

include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

.data
	msginpt db "Enter Three Numbers: ", 0
	frmtints db "%d%d%d", 0
	num1 dd 0
	num2 dd 0
	num3 dd 0
	msgResMin db "MIN: %d", 10, 0
	msgResMax db "MAX: %d", 10, 0
	msgResAvg db "AVG: %d", 10, 0

.code
	main proc
		; printf("Enter Three Numbers: ")
		push offset msginpt
		call crt_printf

		; scanf("%d%d%d", &num1, &num2, &num3)
		push offset num3
		push offset num2
		push offset num1
		push offset frmtints
		call crt_scanf

		; find MAX and print
		mov eax, num1 ; eax = num1
		cmp eax, num2 ; if (eax < num2)
		jae LBL1      ; 
		mov eax, num2 ; 	eax = num2
		LBL1:         ;
		cmp eax, num3 ; if (eax < num3)
		jae LBL2      ;
		mov eax, num3 ; 	eax = num3
		LBL2:
		; printf("MAX: %d", eax)
		push eax
		push offset msgResMax
		call crt_printf

		; find MIN and print
		mov eax, num1 ; eax = num1
		cmp eax, num2 ; if (eax > num2)
		jbe LBL3      ;
		mov eax, num2 ; 	eax = num2
		LBL3:         ;
		cmp eax, num3 ; if (eax > num3)
		jbe LBL4      ;
		mov eax, num3 ; 	eax = num3
		LBL4:
		; printf("MAX: %d", eax)
		push eax
		push offset msgResMin
		call crt_printf

		; find AVG and print
		mov eax, num1 ; eax = num1
		add eax, num2 ; eax += num2
		add eax, num3 ; eax += num3
		xor edx, edx  ;
		mov ecx, 3    ;
		div ecx       ; eax /= 3
		; printf("AVG: %d", eax)
		push eax
		push offset msgResAvg
		call crt_printf

		; ExitProcess(0)
		push 0
		call ExitProcess
	main endp
end main