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
	mov r8, qword [i]
	cmp qword [j], r8
	jg .quit

	mov rax, s
	mov rdx, 32
	mov rbx, 0
	call aceutils_memset ;; clear the buffer before using

	mov rax, [j]
	mov rsi, s
	mov rdx, 32
	call aceutils_itoa ;; convert the number to a string

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, s
	mov rdx, 32
	syscall ;; print the number

	mov rax, SYS_WRITE
	mov rsi, newl
	mov rdx, 1
	syscall ;; print newline

	inc qword [j]
	jmp .loop

.quit:
	quit

newl: db 10
j: rq 1
i: rq 1
s: rb 32
