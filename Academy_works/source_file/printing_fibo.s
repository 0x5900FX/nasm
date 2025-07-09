global _start


section .data
	message db "Welcome to my fibo Program", 0x0a
	len  equ $ - message 

section .text
_start:
	mov rax , 1
	mov rdi , 1
	mov rsi , message
	mov rdx , len
	syscall

	xor rax , rax
	xor rbx , rbx
	inc rbx

loop:
	add rax , rbx
	xchg rax , rbx
	mov rcx , rax
	push  rax 
	push rbx
	
	mov rax , 1
	mov rdi,1
	mov rsi , rcx
	mov rdx , 2
	syscall

	pop rbx
	pop rax

	
	cmp rbx , 10
	js loop

	mov rax , 60
	xor rdi , rdi
	syscall
