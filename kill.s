;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'
include 'atoi.inc'
include 'signal.inc'

entry _start
_start:
	mov rsi, [rsp+16]
	cmp rsi, 0
	je .quit

	call aceutils_atoi

	mov edi, eax
	mov rax, SYS_KILL
	mov rsi, SIGKILL
	syscall

.quit:
	quit
