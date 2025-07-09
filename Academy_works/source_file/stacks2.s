global _start
section .text

_start:
	mov rax , 20
	mov rbx , 40 
	mov rdx , 10
	mov rcx , 15

	push rax
	push rbx
	push rdx
	push rcx

	pop rcx 
	pop rdx 
	pop rbx
	pop rax
