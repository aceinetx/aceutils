;; aceutils
;; Copyright (c) aceinetx 2022-2025
;; License: GPL-2.0

;; get length of a string
;; rsi - the string
;; result in rax
aceutils_strlen:
	xor rax, rax
	push rsi

.loop:
	mov dl, [rsi]
	cmp dl, 0
	je .end

	inc rax
	inc rsi

	jmp .loop

.end:
	pop rsi
	ret
