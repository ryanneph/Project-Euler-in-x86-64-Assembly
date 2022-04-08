section .data

section .text
    global euler001__asm
    global euler002__asm


;; sum of all multiples of 3 or 5
; edi < count (u32):  test all numbers in [0, count)
; eax > sum   (u32)
euler001__asm:
    ; i = 0
    xor  r9, r9
    ; sum = 0
    xor  r8, r8
.loop:
    ; if (i % 3 == 0) { sum += 3 }
    xor  rdx, rdx ; clear dividend
    mov  rax, r9 ; dividend is i
    mov  rcx, 3   ; divisor  is 3
    div  rcx      ; i % 3 is stored to rdx
    test rdx, rdx ; set ZF if zero
    jz   .add_i

    ; if (i % 5 == 0) { sum += 5 }
    xor  rdx, rdx ; clear dividend
    mov  rax, r9  ; dividend is i
    mov  rcx, 5   ; divisor  is 3
    div  rcx      ; i % 5 is stored to rdx
    test rdx, rdx ; set ZF if zero
    jz   .add_i

    jmp  .loop_inc

; sum += i
.add_i:
    add  r8, r9

.loop_inc:
    inc  r9 ; i++
    ; i < n
    cmp  r9, rdi
    jb   .loop

.loop_done:
    ; return sum
    mov  rax, r8
    ret


;; sum of even-valued terms in Fibonacci sequence
; eax > sum (u32)
euler002__asm:
    ; sum = 2 (u32)
    mov esi, 2
    ; prev2: fib[i-2]
    mov ecx, 1
    ; prev1: fib[i-1]
    mov edx, 2

    ; while (fib[i] < 4_000_000)
.loop:
    ; fib[i] = fib[i-1] + fib[i-2])
    mov r8d, ecx
    add r8d, edx

    ; stash fib[i] and fib[i-1)
    mov ecx, edx
    mov edx, r8d

    ; if (fib[i] >= 4M) break
    cmp r8d, 4000000
    ja .loop_done

    ; if fib[i] is even (lowest bit set)
    ;   sum += fib[i]
    test r8b, 1
    jnz .loop
    add esi, r8d

    jmp .loop

.loop_done:
    ; return sum
    mov eax, esi
    ret
