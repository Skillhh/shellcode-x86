; hello-world - An example to start assembly code
section .data
msg db "Hello World", 0xa
len equ $ - msg

section .text
	global _start

_start:
	nop
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 0x1
	mov ebx, 0x0
	int 0x80
