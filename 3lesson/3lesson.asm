
format ELF64
public _start

section '.data' writable
	strnum db "34657346", 0
	_buffer.size equ 20

section '.bss' writable
    _buffer rb _buffer.size
	_bss_char rb 1
	
section '.print_number' executable
print_number:
	push rax 
	push rbx
	push rcx
	push rdx
	xor rcx,rcx
	.next_iter:
		mov rbx, 10
		xor rdx, rdx
		div rbx
		add rdx, '0'
		push rdx
		inc rcx	
		cmp rax, 0
		je .print_iter
		jmp .next_iter
	.print_iter:
		cmp rcx, 0
		je .close
		pop rax
		call print_char
		dec rcx
		jmp .print_iter
	.close:
	pop rdx
	pop rcx
	pop rbx
	pop rax
	ret


section '.print_char' executable

print_char:
	push rdx
	push rcx
	push rax

	mov [_bss_char], al

	mov rax, 4
	mov rbx, 1
	mov rcx, _bss_char
	mov rdx, 1
	int 0x80
	
	pop rax
	pop rcx
	pop rdx
	ret

section '.print_string' executable
print_string:
	push rax
	push rbx
	push rcx
	push rdx
	
	mov rcx, rax
	call lenght_string

	mov rdx, rax
	mov rax, 4
	mov rbx, 1
	int 0x80

	pop rdx
	pop rcx
	pop rbx
	pop rax
	ret

section '.print_line' executable
print_line:
	push rax
	mov rax, 0xA
	call print_char
	pop rax
	ret

section '.lenght_string' executable
lenght_string:
	push rbx
	xor rbx, rbx
	.next_iter:
		cmp [rax + rbx], byte 0
		je .close
		inc rbx
		jmp .next_iter
	
	.close:
		mov rax, rbx
		pop rbx
		ret 


section '.exit' executable
exit:
	mov rax, 1
	xor rbx, rbx
	int 0x80
