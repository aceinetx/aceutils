format ELF64 executable
include 'aceutils.inc'

entry _start
_start:
	mov rbx, 16
.loop:
	mov rdi, [rsp+rbx]
	cmp rdi, 0
	je .quit

	mov rax, SYS_RMDIR
	syscall

	add rbx, 8
	jmp .loop

.quit:
	quit
