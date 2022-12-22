BITS 64

	global print_alphabet	; EXPORT our 'print_alphabet' function

	section .text

	; void print_alphabet(void);
	; Prints the lowercase alphabet

print_alphabet:
	push rbp		; Setup stack frame
	mov rbp, rsp		; Those two lines are equivalent to 'enter'

				; Save registers that are gonna be used in this
	push rsi		; procedure, in case they were used before
	push rax
	push rdi
	push rdx

	add rsp, -1		; Increase the stack by 1 byte to store a char
	mov byte [rsp], 97	; Store the ascii value of 'a'

	; Setup 'write' syscall
	mov rax, 1		; Write syscall
	mov rdi, 1		; write to stdout
	mov rdx, 1		; Write 1 byte
	mov rsi, rsp		; Address of the character to be printed (Address of the stack)

	; loop_alphabet -> while (@r8 <= 122)
loop_alphabet:
	syscall
	inc byte [rsp]		; Increment our variable in the stack
	cmp byte [rsp], 122	; Compare the value our char to 'z'
	jle loop_alphabet	; Jump to loop only if our char is lower or equal to 'z'

	; The symbol 'end' is not necessary since we never jump on it, but it
	; makes our code way more understandable, we quickly know that this
	; part handles the restoration of the registers saved in the stack, and
	; the restoration of the previous stack frame
end:
	add rsp, 1		; Discard our local variable
	pop rdx			; Restore used registers
	pop rdi
	pop rax
	pop rsi

	mov rsp, rbp		; Restore previous stack frame
	pop rbp			; Those two lines are equivalent to 'leave'

	ret			; Return from procedure ('pop rip')
