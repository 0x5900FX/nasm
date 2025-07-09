global  _start
extern  printf, scanf

section .data
    message db "Please input max Fn", 0x0a
    len equ $ - message
    outFormat db  "%d", 0x0a, 0x00
    inFormat db  "%d", 0x00

section .bss
    userInput resb 1

section .text
_start:
    call printMessage   ; print intro message
    call getInput       ; get max number
    call initFib        ; set initial Fib values
    call loopFib        ; calculate Fib numbers
    call Exit           ; Exit the program

printMessage:
        mov rax , 1
        mov rdi , 1
        mov rsi , message
        mov rdx , len
        syscall
        ret

getInput:
    sub rsp, 8          ; align stack to 16-bytes
    mov rdi, inFormat   ; set 1st parameter (inFormat)
    mov rsi, userInput  ; set 2nd parameter (userInput)
    call scanf          ; scanf(inFormat, userInput)
    add rsp, 8          ; restore stack alignment
    ret

initFib:
        xor rax , rax
        xor rbx , rbx
        inc rbx
        ret

printFib:
        push rax
        push rbx
        mov rdi , outFormat
        mov rsi , rbx
        call printf
        pop rbx
        pop rax
        ret 


loopFib:
    call printFib
    add rax , rbx
    xchg rax , rbx
    mov rcx , rax
    cmp rbx,[userInput] ; do rbx - userInput
    js loopFib		    ; jump if result is <0
    ret

Exit:
	mov rax , 60
        xor rdi , rdi
        syscall
