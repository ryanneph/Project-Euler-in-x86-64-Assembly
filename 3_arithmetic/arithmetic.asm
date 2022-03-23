; Simple Arithmetic Instructions
global _start
section .text

  _start:
    ; reg based addition
    mov eax, 0
    add al, 0x33
    add al, 0x11
    mov ax, 0x5522
    add ax, 0x3344
    mov eax, 0xffffffff
    add eax, 0x10
    ; memory based addition
    mov eax, 0
    add byte [var1], 0x22
    add byte [var1], 0x11
    add word [var2], 0x1122
    add word [var2], 0x3344
    add dword [var3], 0xffffffff
    add dword [var3], 0x10
    ; set / clear / complement carry flag
    clc
    stc
    cmc
    ; add with carry
    mov eax, 0
    stc
    adc al, 0x22
    stc
    adc al, 0x11
    mov ax, 0x1122
    stc
    adc ax, 0x3344
    mov eax, 0xffffffff
    stc
    adc eax, 0x10
    ; subtract
