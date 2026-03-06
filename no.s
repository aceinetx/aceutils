;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'

entry _start
_start:
	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, n
	mov rdx, 1
	syscall
	mov rsi, nl
	syscall
	jmp _start

n: db "n"
nl: db 10
