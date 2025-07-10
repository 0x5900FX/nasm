global _start

section .text
_start

; Welcome -to my sh- ellcode

mov rbx , 'ellcode!'
push rbx
mov rbx , 'to my sh'
push rbx
mov rbx , 'Welcome '
push rbx

mov rsi, rsp

mov rax , 1 ; syscall code

mov rdi ,  1  ; stdout

mov rsi , rsp

mov rdx , 24

syscall


mov rax , 60
xor rdi , rdi
syscall
