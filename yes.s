;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'

entry _start
_start:
	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, y
	mov rdx, 1
	syscall
	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, nl
	mov rdx, 1
	syscall
	jmp _start

y: db "y"
nl: db 10
