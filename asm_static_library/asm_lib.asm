SECTION .DATA
	hello:    db 'hello ryan!',10 ; 10: line-feed
	helloLen: equ $-hello

SECTION .TEXT
	GLOBAL asm_print_hello

asm_print_hello:
	; issue a syscall to write()
	mov eax,4		; prepare for write() syscall
	mov ebx,1		; input: STDOUT
	mov ecx,hello		; input: string pointer
	mov edx,helloLen	; input: string length
	int 80h			; issue syscall by interrupt
	ret			; return control to caller


