section .data
    message db "Hello welcome to my assembly program", 0x0a
    msg_len equ $ - message

section .text
global _start
_start:
    mov rax, 1          ; syscall number for write
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, message    ; address of message
    mov rdx, msg_len    ; length of message
    syscall

    ; Exit
    mov rax, 60         ; syscall number for exit
    xor rdi, rdi        ; exit code 0
    syscall

