;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'

entry _start
_start:
	mov rax, SYS_NEWUNAME
	mov rdi, utsname
	syscall ;; get uname

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, (utsname+(__NEW_UTS_LEN*4)+4)
	mov rdx, __NEW_UTS_LEN
	syscall

	mov rax, SYS_WRITE
	mov rsi, newl
	mov rdx, 1
	syscall

	quit

newl: db 10
utsname: rb (__NEW_UTS_LEN*6)+6
