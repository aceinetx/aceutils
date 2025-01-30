;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'
include 'atoi.inc'
include 'memset.inc'
include 'itoa.inc'

entry _start
_start:

	mov rsi, [rsp+16]
	cmp rsi, 0
	je .quit

	call aceutils_atoi
	mov [i], rax
	inc qword [j]

.loop:
	cmp qword [i], 1
	jl .quit

	mov rax, s
	mov rdx, 32
	mov rbx, 0
	call aceutils_memset

	mov rax, [j]
	mov rsi, s
	mov rdx, 32
	call aceutils_itoa

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, s
	mov rdx, 32
	syscall

	mov rax, SYS_WRITE
	mov rsi, newl
	mov rdx, 1
	syscall

	dec qword [i]
	inc qword [j]
	jmp .loop

.quit:
	quit

newl: db 10
i: rq 1
j: rq 1
s: rb 32
