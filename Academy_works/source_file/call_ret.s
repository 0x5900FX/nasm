global _start


section .data
	message db "Welcome to my fibo Program", 0x0a
	len  equ $ - message 

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
	add rax , rbx
	xchg rax , rbx
	mov rcx , rax
	cmp rbx , 10
	js loop
	ret

Exit:
	mov rax , 60
	xor rdi , rdi
	syscall

