SECTION .DATA
	hello:    db 'hello friend!',10 ; 10: line-feed
	helloLen: equ $-hello

SECTION .TEXT
	GLOBAL asm_print_hello
	GLOBAL asm_signed_multiply
	GLOBAL asm_euler001_sum_of_multiples

asm_print_hello:
	; issue a syscall to write()
	mov eax,4		; prepare for write() syscall
	mov ebx,1		; input: STDOUT
	mov ecx,hello		; input: string pointer
	mov edx,helloLen	; input: string length
	int 80h			; issue syscall by interrupt
	ret			; return control to caller

; rdi has a
; rsi has b
; return "a * b" in rax
asm_signed_multiply:
	mov  eax, edi
	imul eax, esi	; a * b
	ret

; rdi has n: number of loop iterations
; return via rax
asm_euler001_sum_of_multiples:
	; i = 0
	xor  r9, r9
	; sum = 0
	xor  r8, r8
loop1:
	; if (i % 3 == 0) { sum += 3 }
	xor  rdx, rdx ; clear dividend
	mov  rax, r9 ; dividend is i
	mov  rcx, 3   ; divisor  is 3
	div  rcx      ; i % 3 is stored to rdx
	test rdx, rdx ; set ZF if zero
	jz   add_i

	; if (i % 5 == 0) { sum += 5 }
	xor  rdx, rdx ; clear dividend
	mov  rax, r9  ; dividend is i
	mov  rcx, 5   ; divisor  is 3
	div  rcx      ; i % 5 is stored to rdx
	test rdx, rdx ; set ZF if zero
	jz   add_i

	jmp  loop1_inc

; sum += i
add_i:
	add  r8, r9

loop1_inc:
	inc  r9 ; i++
	; i < n
	cmp  r9, rdi
	jb   loop1

loop1_done:
	; return sum via rax
	mov  rax, r8
	ret
