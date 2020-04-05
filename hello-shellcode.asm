; hello-world - An example to start assembly code
section .text
	global _start

_start:
	jmp short call_shellcode
	; Clear registers
shellcode:
	xor eax, eax
	xor ebx, ebx 
	xor ecx, ecx
	xor edx, edx

	; Print String
	mov al, 0x4
	mov bl, 0x1
	pop ecx
	mov dl, 12
	int 0x80

	; Call sys_exit
	xor eax, eax
	xor ebx, ebx
	mov al, 0x1
	int 0x80
 
 call_shellcode:
	call shellcode
	msg db "Hello World", 0xa
