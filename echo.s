;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'
include 'strlen.inc'

entry _start
_start:
	mov rbx, 16
.loop:
	mov rsi, [rsp+rbx]
	cmp rsi, 0
	je .quit

	call aceutils_strlen
	mov rdx, rax

	mov rax, SYS_WRITE
	mov rdi, 1
	syscall

	mov rax, SYS_WRITE
	mov rdx, 1
	mov rsi, space
	syscall

	add rbx, 8

	jmp .loop

.quit:
	mov rax, SYS_WRITE
	mov rdx, 1
	mov rsi, newline
	syscall
	quit

newline: db 10
space: db ' '
