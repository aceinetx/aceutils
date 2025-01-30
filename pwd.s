;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'

PATH_SIZE = 1024

entry _start
_start:
	mov rax, SYS_GETCWD
	mov rdi, path
	mov rsi, PATH_SIZE
	syscall ;; get current working directory

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, path
	mov rdx, PATH_SIZE
	syscall ;; print it

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, n
	mov rdx, 1
	syscall ;; print newline

	quit

n: db 10
path: rb PATH_SIZE
