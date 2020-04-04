; Author: Vivek Ramachandran
extern printf
extern exit

section .text
	global main

main:
	nop
	push msg
	call printf
	add esp, 0x4	; Adjust the stack

	mov eax, 0xa
	call exit


section .data
	msg db "Hello World!", 0xa
	len equ $ - msg
