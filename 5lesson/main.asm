format ELF64
public _start

include "asmlib/fmt.inc"
include "asmlib/sys.inc"

section '.data' writable
	fmt db "[%h]", 0
	msg db "hello,d", 0
	msg2 db "iam", 0

section '.text' executable
_start:
	push 254770
	mov rax, fmt
	call prinft
	call print_line
	call exit

section '.prinft' executable

prinft:
	push rax
	push rbx
	mov rbx, 32
	.next_iter:
		cmp [rax], byte 0
		je .close
		cmp [rax], byte '%'
		je .special_char
		jmp .default_char
		.special_char:
			inc rax
			cmp [rax], byte 's'
			je .print_string
			cmp [rax], byte 'o'
			je .print_oct
			cmp [rax], byte 'h'
			je .print_hex
			cmp [rax], byte 'd'
			je .print_number
			cmp [rax], byte 'c'
			je .print_char
			cmp [rax], byte '%'
			je .print_percent
			jmp .next_step
		.print_string:
			push rax
			mov rax, [rsp+rbx]
			call print_string
			pop rax
			jmp .shift_stack
		.print_number:
			push rax
			mov rax, [rsp+rbx]
			call print_number 
			pop rax
			jmp .shift_stack
		.print_oct:
			push rax
			mov rax, [rsp+rbx]
			call print_oct
			pop rax
			jmp .shift_stack
		.print_hex:
			push rax
			mov rax, [rsp+rbx]
			call print_hex			
			pop rax
			jmp .shift_stack
		.print_char:
			push rax
			mov rax, [rsp+rbx]
			call print_char
			pop rax
			jmp .shift_stack
		.print_percent:
			push rax
			mov rax, '%'
			call print_char
			pop rax
			jmp .next_step
		.default_char:
			push rax
			mov rax, [rax]
			call print_char
			pop rax
			jmp .next_step
		.shift_stack:
			add rbx, 8
		.next_step:
			inc rax
			jmp .next_iter
	.close:
		pop rbx
		pop rax
		ret


section '.print_oct' executable
print_oct:
	push rax 
	push rbx
	push rcx
	push rdx
	xor rcx,rcx
	push rax
	mov rax,'0'
	call print_char
	pop rax
	.next_iter:
		mov rbx, 8
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

section '.print_hex' executable
print_hex:
	push rax 
	push rbx
	push rcx
	push rdx
	xor rcx,rcx
	push rax
	mov rax,'0'
	call print_char
	mov rax,'x'
	call print_char
	pop rax
	.next_iter:
		mov rbx, 16
		xor rdx, rdx
		div rbx
		cmp rdx, 10
		jl .is_number
		jmp .is_alpa
		.is_number:
			add rdx, '0'
			jmp .next_step
		.is_alpa:
			sub rdx, 10
			add rdx, 'A'
			jmp .next_step
		.next_step:
		push rdx
		inc rcx
		cmp rax, 0
		je .print_iter
		jmp .next_iter
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
