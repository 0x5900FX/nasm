global _start 
extern printf , scanf

section .data
	message db "Enter number for fn Max", 0x0a
	len  equ $ - message
	dataType db "%d" , 0x0a , 0x00
	dataInput db "%d" , 0x00


section .bss
	bufferinput resb 1


section .text
_start:
	call Print
	call getInput
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



getInput:

        sub rsp  , 8

        mov  rdi, dataInput
        mov  rsi, bufferinput


        call scanf


        add rsp , 8
        ret

initFibo:
	xor rax , rax
	xor rbx , rbx
	inc rbx
	ret



PrintFibo:
        push rax
        push rbx
        mov rdi , dataType
        mov rsi , rbx
        call printf
        pop rbx
        pop rax
        ret 

loop:
	call PrintFibo
	add rax , rbx
	xchg rax , rbx
	mov rcx , rax
	cmp rbx , [bufferinput]
	js loop
	ret

Exit:
	mov rax , 60
	xor rdi , rdi
	syscall



