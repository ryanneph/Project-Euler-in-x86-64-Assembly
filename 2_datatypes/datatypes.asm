global _start
section .text
_start:
; graceful exit
mov eax, 1 ; exit syscall
mov ebx, 0 ; exit code
int 80h

section .data
var1: db 0x55 ; single byte 0x55
var2: db 0x55, 0x56, 0x57 ; three successive bytes
var3: db 'a', 0x55 ; char constant
var4: db 'hi', 14, 15
