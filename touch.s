;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'

entry _start
_start:
	mov rbx, 16
.loop:
	mov rdi, [rsp+rbx]
	cmp rdi, 0
	je .quit

	mov rax, SYS_OPEN
	mov rsi, 0x241
	mov rdx, 0644o
	syscall

	mov rdi, rax
	mov rax, SYS_CLOSE
	syscall

	add rbx, 8
	jmp .loop

.quit:
	quit
