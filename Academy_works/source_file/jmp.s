global _start
section .text

_start:
	xor al, al
	xor bl,bl
	inc bl
	
	mov rcx , 5

loop:
	add al,bl
	xchg al, bl
	jmp loop

