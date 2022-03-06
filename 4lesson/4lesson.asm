
format ELF64
public _start

section '.data' writable
	strnum db "34657346", 0
	_buffer.size equ 20

section '.bss' writable
    _buffer rb _buffer.size
	_bss_char rb 1
	
section '.text' executable
_start:
	mov rax, 3528
	mov rbx, 435436
	call gcd
	call print_number
	call print_line
	call exit
section '.gcd' executable
gcd:
	push rbx
	.next_iter:
		cmp rbx, 0 
		je .close
		xor rdx, rdx
		div rbx
		push rbx
		mov rbx, rdx
		pop rax
		jmp .next_iter
	.close:
		pop rbx
		ret

section '.fibonacci' executable
fibonacci:
	push rbx
	push rcx
	mov rbx, 0
	mov rcx, 1
	cmp rax, 0
	je .next_step
	.next_iter:
		cmp rax, 1
		jle .close
		push rcx
		add rcx, rbx
		pop rbx
		dec rax
		jmp .next_iter
	.next_step:
		xor rcx, rcx
	.close:
		mov rax, rcx
		pop rcx
		pop rbx
		ret
section '.factorial' executable
factorial:
	push rbx
	mov rbx, rax
	mov rax, 1
	.next_iter:
		cmp rbx,1
		jle .close
		mul rbx
		dec rbx
		jmp .next_iter
	.close:
		pop rbx
		ret

section '.string_to_number' executable
string_to_number:
	push rbx
	push rcx
	push rdx
	xor rbx, rbx
	xor rcx, rcx
	.next_iter:
		cmp [rax+rbx], byte 0
		je .next_step
		mov cl, [rax +rbx]
		sub cl, '0' 
		push rcx
		inc rbx
		jmp .next_iter
	.next_step:
		mov rcx, 1
		xor rax, rax
	.to_number:
		cmp rbx, 0
		je .close
		pop rdx
		imul rdx ,rcx
		imul rcx, 10
		add rax, rdx
		dec rbx
		jmp .to_number
	.close:
		pop rdx
		pop rcx
		pop rbx
		ret

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

