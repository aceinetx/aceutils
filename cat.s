;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0
format ELF64 executable
include 'aceutils.inc'

cat:
	push rbx
	push rdi

	mov rax, SYS_OPEN ;; open the file
	xor rsi, rsi
	xor rdx, rdx
	syscall

	test rax, rax ;; quit if failed to read the file
	js .quit

	mov rbx, rax

.read_loop:
	mov rax, SYS_READ
	mov rdi, rbx
	mov rsi, buffer
	mov rdx, 4096
	syscall

	test rax, rax
	jle .close_file

	mov rdx, rax
	mov rax, SYS_WRITE
	mov rdi, 1
	mov rsi, buffer
	syscall

	jmp .read_loop

.close_file:
	mov rax, SYS_CLOSE
	mov rdi, rbx
	syscall

	xor rdi, rdi
	jmp .quit

.quit:
	pop rdi
	pop rbx
	ret

entry _start
_start:
	mov rbx, 16
.loop:
	mov rdi, [rsp+rbx]
	cmp rdi, 0
	je .quit

	call cat
	add rbx, 8

	jmp .loop

.quit:
	mov rax, SYS_EXIT
	xor rdi, rdi
	syscall

buffer:	rb 4096
