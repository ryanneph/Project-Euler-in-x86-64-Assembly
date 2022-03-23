global _start          ; entrypoint

section .text:
_start:
  mov eax, 0x4         ; write syscall
  mov ebx, 1           ; fd
  mov ecx, message     ; *buf
  mov edx, message_len ; count
  int 0x80

  ; Graceful exit
  mov eax, 0x1         ; exit syscall
  mov ebx, 0x0         ; return code
  int 0x80

section .data:
  message: db "Hello World!", 0xA ; 0xA is newline
  message_len equ $-message
