global _start

section .data

message db "This is data",0x0a  ; db means -> reserve memory & fill with this byte
len equ $ - message  


section .text
_start:
	mov rax , 1
	mov rdi , 1
	mov rsi , message
	mov rdx , 14
	syscall

	mov rax , 60
	xor rdi,rdi
	syscall
