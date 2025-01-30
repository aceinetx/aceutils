;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0

;; fill memory
;; rax - addr
;; rdx - count
;; rbx (bl) - char
aceutils_memset:
	push rax
	push rdx

.loop:
	cmp rdx, 0
	jle .quit

	mov byte [rax+rdx], bl

	dec rdx

	jmp .loop

.quit:
	pop rdx
	pop rax
	ret
