;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0

;; convert a string to number
;; rsi - string
;; result in rax
aceutils_atoi:
	xor rax, rax
	push rsi
	push rbx

.loop:
	mov dl, [rsi]
	cmp dl, 0
	je .quit ;; Quit if eol reached

	movsx rbx, dl
	sub rbx, '0' ;; get as number

	imul rax, 10
	add rax, rbx

	inc rsi
	jmp .loop

.quit:
	pop rbx
	pop rsi
	ret
