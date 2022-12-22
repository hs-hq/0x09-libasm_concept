BITS 64

	global swap		; EXPORT our 'swap' function

	section .text

	; void swap(int *a, int *b);
	; Swaps the values of two pointers
	;
	; rdi <- a
	; rsi <- b

swap:
	push rbp		; Setup stack frame
	mov rbp, rsp		; Those two lines are equivalent to 'enter'

	push r8			; Save @r8, in case it was used before
	push r9			; Save @r9, in case it was used before

	; It is not possible to 'mov' from memory to memory
	; Thus, we need to save the values at the two given addresses @a and @b,
	; in order to swap them after
	mov r8d, dword [rdi]	; Save int stored at address of @a
				; Since we handle integers (32-bit), we use the
				; 32-bit register @r8d, and retrieve a dword
	mov r9d, dword [rsi]	; Save int stored at address of @b
	mov dword [rdi], r9d	; Put at address @a the value that was at address @b
	mov dword [rsi], r8d	; Put at address @b the value that was at address @a

	pop r9			; Restore @r9 first (last pushed)
	pop r8			; Restore @r8

	mov rsp, rbp		; Restore previous stack frame
	pop rbp			; Those two lines are equivalent to 'leave'

	ret			; Return from procedure ('pop rip')
