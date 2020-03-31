section .text
	global _start

HelloProc:
	; Print hello world using syscall
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, msg
	mov edx, len
	int 0x80
	; End of Procedure
	ret

Exit:
	mov eax, 0x1
	mov ebx, 0x0
	int 0x80
	; End of Procedure
	ret

_start:
	nop
	mov ecx, 0x10

Print:
	push ecx
	call HelloProc
	pop ecx
	loop Print

	call Exit


section .data
	msg db "Hello World", 0xa
	len equ $ - msg
