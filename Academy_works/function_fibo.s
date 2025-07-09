global _start
extern printf

section .data
	message db "Welcome to my fibo Program", 0x0a
	len  equ $ - message
	dataType db "%d" , 0x0a , 0x00

section .text
_start:
	call Print
	call initFibo
	call loop
	call Exit


Print:
	mov rax , 1
	mov rdi , 1
	mov rsi , message
	mov rdx , len
	syscall
	ret

initFibo:
	xor rax , rax
	xor rbx , rbx
	inc rbx
	ret

loop:
	call PrintFibo
	add rax , rbx
	xchg rax , rbx
	mov rcx , rax
	cmp rbx , 10000000
	jb loop
	ret


PrintFibo:
	push rax
	push rbx
	sub rsp , 16
	mov rdi , dataType
	mov rsi , rbx
	call printf
	add rsp, 16
	pop rbx
	pop rax
	ret

Exit:
	mov rax , 60
	xor rdi , rdi
	syscall


