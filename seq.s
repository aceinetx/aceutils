;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'
include 'atoi.inc'

;; convert number to string
;; rax - number to convert
;; rsi - buffer pointer
;; rdx - buffer length
itoa:
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
    lea  r10, [rdi + rcx - 1] ; End of buffer
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

    mov  [r10 - r11], dl  ; Store digit from end
    inc  r11
    test r8, r8
    jnz  .digit_loop

    ; Reverse digits
    mov  rsi, r10
    sub  rsi, r11
    inc  rsi              ; Start of digits
    mov  rdi, rsi
    lea  rdx, [rsi + r11 - 1] ; End of digits

.reverse_loop:
    cmp  rdi, rdx
    jge  .end
    mov  al, [rdi]
    mov  ah, [rdx]
    mov  [rdi], ah
    mov  [rdx], al
    inc  rdi
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

entry _start
_start:

	mov rax, 123
	mov rsi, temp
	mov rdx, 10
	call itoa

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, temp
	mov rdx, 10
	quit

	mov rsi, [rsp+16]
	cmp rsi, 0
	je .quit

	call aceutils_atoi
	mov rbx, rax

.loop:
	cmp rbx, 1
	jl .quit



	dec rbx
	jmp .loop

.quit:
	quit

temp: rb 10
