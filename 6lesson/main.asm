 format ELF64
 public _start 
 
 include "asmlib/fmt.inc"
 include "asmlib/sys.inc"
 include "asmlib/str.inc"

section '.data' writable
	_next dq 1

section '.bss' writable
	_buffer_char_size equ 2
	_buffer_char rb _buffer_char_size

	_buffer_number_size equ 21
	_buffer_number rb _buffer_number_size

	buffer_size equ 20
	buffer rb buffer_size

 section '.text' executable
 _start:
	call time
	call srand

	call rand
	call print_number
	call print_line

	call rand
	call print_number
	call print_line

	call rand
	call print_number
	call print_line
	call exit

section '.time' executable
time:
	push rbx
	mov rax, 13
	xor rbx, rbx
	int 0x80
	pop rbx
	ret

section '.srand' executable
srand:
	mov[_next], rax
	ret

section '.rand' executable
rand:
	push rbx
	push rdx

	mov rax, [_next]
	mov rbx, 1103515245 * 12345
	mul rbx
	mov [_next], rax
	xor rdx, rdx
	mov rbx, 65536
	div rbx
	xor rdx, rdx
	mov rbx, 32768
	div rbx
	mov rax, rdx

	pop rdx
	pop rbx
	ret

section '.input_char' executable
input_char:
	push rbx

	mov rax, _buffer_char
	mov rbx, _buffer_char_size
	call input_string
	mov rax, [rax]

	pop rbx
	ret


section '.input_number' executable
input_number:
	push rbx

	mov rax, _buffer_number
	mov rbx, _buffer_number_size
	call input_string
	call string_to_number

	pop rbx
	ret

section '.input_string' executable
input_string: 
	push rax
	push rbx 
	push rcx
	push rdx

	push rax

	mov rcx, rax
	mov rdx, rbx
	mov rax, 3
	mov rbx, 2
	int 0x80
	
	pop rbx
	mov [rbx + rax - 1], byte 0

	pop rdx
	pop rcx
	pop rbx
	pop rax
	ret

