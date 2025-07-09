global _start
extern printf, scanf

section .data
    message db "Welcome to my fibo Program", 0x0a
    len     equ $ - message
    dataType db "%d", 0x0a, 0x00      ; format string for printf
    inFormat db "%d", 0x00             ; format string for scanf

section .bss
    userInput resd 1                   ; reserve 4 bytes for input integer

section .text
_start:
    call Print
    call getInput
    call initFibo
    call loop
    call Exit

Print:
    mov rax, 1                        ; sys_write
    mov rdi, 1                        ; stdout
    mov rsi, message
    mov rdx, len
    syscall
    ret

getInput:
    sub rsp, 32                      ; align stack to 16 bytes before call
    xor rax, rax                    ; zero rax before variadic call
    mov rdi, inFormat
    lea rsi, [userInput]            ; pass address of userInput
    call scanf
    add rsp, 32
    ret

initFibo:
    xor rax, rax
    xor rbx, rbx
    inc rbx                         ; rbx = 1 (second Fibonacci number)
    ret

loop:
    call PrintFibo
    add rax, rbx                    ; rax = rax + rbx
    xchg rax, rbx                   ; swap rax and rbx
    cmp rbx, [userInput]            ; compare current fib number to user input
    js loop                        ; continue loop while rbx < userInput
    ret

PrintFibo:
    mov rdi, dataType               ; format string "%d\n"
    mov esi, ebx                   ; fib number in ebx (lower 32 bits)
    xor eax, eax                   ; zero rax before variadic call
    call printf
    ret

Exit:
    mov rax, 60                    ; sys_exit
    xor rdi, rdi                   ; status 0
    syscall

