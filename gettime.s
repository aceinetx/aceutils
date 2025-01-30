;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'
include 'itoa.inc'

entry _start
_start:
	mov rax, SYS_TIME
	mov rdi, timev
	syscall

	mov rax, [rdi]
	mov rsi, buf
	mov rdx, __GETTIME_BUF_LEN
	call aceutils_itoa

	mov rax, SYS_WRITE
	mov rdi, 1
	;; buf already in rsi
	;; length already in rdx
	syscall

	mov rax, SYS_WRITE
	mov rsi, newl
	mov rdx, 1
	syscall

	quit

newl: db 10
timev: rq 0
buf: rq __GETTIME_BUF_LEN
