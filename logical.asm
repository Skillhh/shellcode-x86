section .text
	global _start
_start:
	nop
	; AND usage

	mov al, 0x10
	and al, 0x01

	and byte [var1], 0xaa
	and word [var2], 0x1122

	; OR usage

	mov al, 0x10
	or al, 0x01

	or byte [var1], 0xaa

	mov eax, 0
	or eax, 0x0

	; XOR
	xor dword [var3], 0x11223344
	xor dword [var3], 0x11223344

	; NOT
	mov eax, 0xffffffff
	not eax
	not eax

	; exit
	mov eax, 1
	mov ebx, 10
	int 0x80

section .data
	var1 db 0x05
	var2 dw 0x1122
	var3 dd 0x11223344
