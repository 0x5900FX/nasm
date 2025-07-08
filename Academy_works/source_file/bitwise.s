global _start
section .text

_start:
	mov al , 1
	mov bl , 2
	not al
	not bl
	and al , bl
	mov cl , al
	or  cl , bl
	xor al , bl
