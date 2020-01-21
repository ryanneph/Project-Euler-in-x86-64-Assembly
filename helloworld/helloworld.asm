; hello world code in intel assembly language
global _start

section .text
_start:
; reset registers
xor ecx, ecx ; clearing ECX
xor ebx, ebx ; clearing EBX
mul ecx      ; clearing EAX,EDX
; init with values
mov eax, 0x4 ; moving write syscall num to eax
mov ebx, 0x1 ; moving file descriptor into ebx
mov ecx, $msg ; moving actual buffer into ecx
mov edx, $len ; moving the count into edx (defined in .data)
int 0x80; Interrupt 80
; graceful exit
mov eax, 0x1 ; moving exit syscal num to eax
mov ebx, 0x0 ; moving exit status num to ebx
int 0x80 ; Interrupt 80

section .data
msg: db "Hello World!", 0x0A
len: equ $-msg ; important that this instruction is immediately after msg definition
