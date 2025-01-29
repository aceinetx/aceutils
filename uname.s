;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'

newline:
	push rax
	push rdi
	push rsi
	push rdx

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, _newline
	mov rdx, 1
	syscall

	pop rdx
	pop rsi
	pop rdi
	pop rax
	ret

entry _start
_start:
	mov rax, SYS_NEWUNAME
	mov rdi, utsname
	syscall

	mov rbx, 0
.loop:
	cmp rbx, 6
	jge .quit

	mov rsi, utsname
	add rsi, rbx

	mov rax, __NEW_UTS_LEN
	mul rbx
	add rsi, rax

	mov rax, SYS_WRITE
	mov rdi, 1
	mov rdx, __NEW_UTS_LEN
	syscall
	call newline

	inc rbx

	jmp .loop

.quit:
	quit

_newline: db 10
utsname: rb 390
