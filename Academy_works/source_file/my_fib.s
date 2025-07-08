global _start
section .text

_start:
	mov al , 1
	mov bl , 2
	inc bl
	add al ,  bl
	imul rbx , rax
	sub rbx , rax
