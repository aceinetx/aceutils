;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'
include 'atoi.inc'

entry _start
_start:
	mov rsi, [rsp+16]
	cmp rsi, 0
	je .quit
	mov rsi, [rsp+24]
	cmp rsi, 0
	je .quit

	mov rsi, [rsp+16]
	call aceutils_atoi
	mov [rqtp], rax

	mov rsi, [rsp+24]
	call aceutils_atoi
	mov [rqtp+8], rax

	mov rax, SYS_NANOSLEEP
	mov rdi, rqtp
	mov rsi, rmtp
	syscall

.quit:
	quit

rqtp: rq 2
rmtp: rq 2
