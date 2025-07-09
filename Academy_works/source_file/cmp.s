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
	cmp bl , 10
	js loop     		; js -> jump if sign  (or negative flag is on)
				;  8 - 10 ->  negative flag -> jump 12 -10 -> Negative not so -> ignore jump exit()
