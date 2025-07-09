global _start
extern printf

section .data
	message db "Hello welcome to my assembly program", 0x0a , 0
	msg_type db "%s" , 0x00

section .text
_start:
	mov rdi , msg_type
	mov rsi, message

	sub rsp , 16
	call printf
	add rsp , 16


	mov rax, 60
	xor rdi, rdi
	syscall
