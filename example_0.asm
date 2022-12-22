BITS 64

global my_function		; EXPORT our function 'my_function'
extern another_function		; IMPORT the function 'another_function'

section .data
				; Declare static data
	my_str db "Holberton", 0Ah, 0
	; "Holberton", followed by a new line (0A hexa), and \0


section .text
				; Code section

my_function:			; This is a symbol
	; Do some
	; some
	; stuff
	; here
