# DAtaType.asm - An Example of data type
section .text
	global _start
_start:
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 0x1
	mov ebx, 0x0
	int 0x80

section .data
	var1 db 0xAA
	var2 db 0xBB, 0xCC, 0xDD
	var3 dw 0xEE
	var4 dd 0xAABBCCDD
	var5 dd 0x112233
	var6 times 6 db 0xFF

	msg db "Hello World!", 0xa
	len equ $ - msg

section .bss
	var7 resb 100
	var8 resw 20
