;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0

;; convert number to string
;; rax - number to convert
;; rsi - buffer pointer
;; rdx - buffer length
aceutils_itoa:
    push rsi
    push rdx
    push rax
    push rdi
    push rcx
    push r8
    push r9
    push r10
    push r11

    mov  rdi, rsi         ; Buffer pointer
    mov  rcx, rdx         ; Buffer length
    test rax, rax
    jz   .zero_case

    ; Handle negative numbers
    mov  r8, rax          ; Store original number
    xor  r9, r9           ; Negative flag
    test r8, r8
    jns  .positive
    neg  r8
    mov  r9, 1            ; Set negative flag

.positive:
    ; Check space for sign
    test r9, r9
    jz   .no_sign
    cmp  rcx, 1
    jl   .end
    mov  byte [rdi], '-'
    inc  rdi
    dec  rcx

.no_sign:
    xor  r11, r11         ; Digit count

.digit_loop:
    mov  rax, r8
    xor  rdx, rdx
    mov  rsi, 10
    div  rsi              ; RDX = remainder
    mov  r8, rax          ; Update quotient

    add  dl, '0'          ; Convert to ASCII
    cmp  r11, rcx
    jge  .no_space

    mov  [rdi + r11], dl  ; Store digit from start
    inc  r11
    test r8, r8
    jnz  .digit_loop

    ; Reverse digits
    lea  rdx, [rdi + r11 - 1] ; End of digits
    mov  rsi, rdi         ; Start of digits

.reverse_loop:
    cmp  rsi, rdx
    jge  .end
    mov  al, [rsi]
    mov  ah, [rdx]
    mov  [rsi], ah
    mov  [rdx], al
    inc  rsi
    dec  rdx
    jmp  .reverse_loop

.zero_case:
    cmp  rcx, 1
    jl   .end
    mov  byte [rdi], '0'

.no_space:
.end:
    pop  r11
    pop  r10
    pop  r9
    pop  r8
    pop  rcx
    pop  rdi
    pop  rax
    pop  rdx
    pop  rsi
    ret
