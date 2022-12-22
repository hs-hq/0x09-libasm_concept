BITS 64

	global add_me	; EXPORT our 'add_me' function

	section .text

	; int add_me(int a, int b);
	; Adds to integers
	;
	; edi <- a
	; esi <- b
	;
	; Return: The sum of the two integers

add_me:
	mov eax, edi	; Move @a in the Return value register
			; Note that we use @eax and not @rax, because we're
			; dealing with 32-bit values

	add eax, esi	; Add @b to @eax

	ret		; Return from function
