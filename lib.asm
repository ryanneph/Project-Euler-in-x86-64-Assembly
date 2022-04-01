section .data

section .text
    global euler001__asm

euler001__asm:
    ;; sum of all multiples of 3 or 5
    ; edi < count (s32):  test all numbers in [0, count)
    ; eax > sum   (s32)

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
