global _start
section .text

_start:
	xor rax, rax
	xor rbx, rbx
	inc rbx
	push rax
	push rbx


loop:
	pop rbx
	pop rax

	add rax,rbx
	xchg rax, rbx
	cmp  rbx , 10
	js loop


