; demo of data movement instructions
global _start
section .text
_start:
  ; MOV example
  mov eax, 0x1 ; move 10(dec) or A (hex) into EAX - immediate
  mov ebx, eax ; move eax to ebx - reg to reg
  mov ecx, [msg] ; move content from memory to reg (brackets mean pointer address rather than bytes)
  ; Moving data from register to memory location
  mov eax, 0x33445566
  mov byte [msg], al
  mov word [msg], ax
  mov dword [msg], eax
  ; XCHG example
  mov ecx, 0xffffffff
  mov edx, 0x11111111
  xchg ecx, edx ; swap contents of the registers
  ; LEA Example
  lea eax, [msg] ; load effective address of MSG in EAX
  lea ebx, [ecx] ; load effective address of ECX in EBX
  ; PUSH Example
  push eax
  push ebx
  ; POP example
  pop eax
  pop ebx
  ; exit gracefully
  mov eax, 1
  mov ebx, 5
  int 80h

section .data
msg: db 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff
