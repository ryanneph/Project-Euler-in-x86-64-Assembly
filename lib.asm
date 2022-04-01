section .data

section .text
    global euler001__asm
    global euler002__asm


;; sum of all multiples of 3 or 5
; edi < count (s32):  test all numbers in [0, count)
; eax > sum   (s32)
euler001__asm:
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


;; sum of even-valued terms in Fibonacci sequence
euler002__asm:
    ; sum = 2 (u32)
    mov esi, 2
    ; prev2: fib[i-2]
    mov ecx, 1
    ; prev1: fib[i-1]
    mov edx, 2

    ; while (fib[i] < 4_000_000)
euler002_loop1:
    ; fib[i] = fib[i-1] + fib[i-2])
    mov r8d, ecx
    add r8d, edx

    ; stash fib[i] and fib[i-1)
    mov ecx, edx
    mov edx, r8d

    ; if (fib[i] >= 4M) break
    cmp r8d, 4000000
    ja euler002_loop1_done

    ; if fib[i] is even (lowest bit set)
    ;   sum += fib[i]
    test r8b, 1
    jnz euler002_loop1
    add esi, r8d

    jmp euler002_loop1

euler002_loop1_done:
    mov eax, esi
    ret
