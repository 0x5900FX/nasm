global _start
section .text

_start:
	xor rax , rax 
	xor rbx , rbx 
	inc rbx 
	mov rcx , 10

loopforFibo:
	add rax , rbx
	xchg rbx , rax  
	loop loopforFibo
