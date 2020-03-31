; Author: Vivek Ramachandran
section .text
	global _start
_start:
	nop
	; copy a string from source to destination
	mov ecx, sourceLen
	lea esi, [source]
	lea edi, [destination]

	cld     ; clear direction flag
	;std	 ; set direction flag
	rep movsb

	; Print hello world using write syscall
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, destination
	mov edx, sourceLen
	int 0x80

	; string comparation with cmpsb
	; compare source and destination
	mov ecx, sourceLen
	lea esi, [source]
	lea edi, [comparison]
	repe cmpsb

	jz SetEqual
	mov ecx, result2
	mov edx, result2Len
	jmp Print

SetEqual:
	mov ecx, result1
	mov edx, result1Len

Print:
	mov eax, 0x4
	mov ebx, 0x1
	int 0x80

	mov eax, 0x1
	mov ebx, 0x0
	int 0x80

section .data
	source db "Hello World!", 0xa
	sourceLen equ $ - source

	comparison db "Hello World!", 0xa

	result1 db "String are Equal", 0xa
	result1Len equ $ - result1

	result2 db "String are Unequal", 0xa
	result2Len equ $ - result2

section .bss
	destination resb 100
