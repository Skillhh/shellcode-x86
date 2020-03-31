; control.asm
section .text
	global _start
_start:
	nop
	jmp Begin

NeverExecute:
	mov eax, 0x10
	xor ebx, ebx

Begin:
	mov eax, 0x5

PrintHW:
	push eax

	; Print hello world using write syscall
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, msg
	mov edx, len
	int 0x80

	pop eax
	dec eax
	jnz PrintHW

	mov eax, 0x1
	mov ebx, 0x0
	int 0x80


section .data
	msg db "Hello World", 0xa
	len equ $ - msg
