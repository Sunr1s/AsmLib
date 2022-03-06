 format ELF64
 public _start 
 
 include "asmlib/fmt.inc"
 include "asmlib/sys.inc"

section '.data' writable
	array db 5, 4, 3, 2, 1
	array_size equ 5


 section '.text' executable
 _start:
	mov rax, array
	mov rbx, array_size
	call print_bytes
	call bubble_sort
	call print_bytes
	call print_line
	call exit

section '.bubble_sort' executable
bubble_sort:
	push rbx
	push rcx
	push rdx
	xor rcx, rcx
	.first_iter:
		cmp rcx, rbx
		je .break_first
		xor rdx, rdx
		push rbx
		sub rbx,rcx
		dec rbx
		.second_iter:
			cmp rdx, rbx
			je .break_second
			push rbx
			mov bl, [rax + rdx]
			cmp bl, [rax + rdx + 1]
			jg .swap
			jmp .pass
		.swap:
			mov bh, [rax + rdx + 1]
			mov [rax + rdx + 1], bl
			mov [rax + rdx], bh
		.pass:
			pop rbx
			inc rdx
			jmp .second_iter
		.break_second:
			pop rbx
			inc rcx
			jmp .first_iter
	.break_first:
	    pop rdx
		pop rcx
		pop rbx
		ret

section '.print_bytes' executable
print_bytes:
    push rax
	push rbx
	push rcx
	mov rcx, rax
	xor rax, rax
	mov al, '['
	call print_char
	.next_iter:
		cmp rbx, 0
		je .close
		mov al, [rcx]
		call print_number
		mov al, ' '
		call print_char
		inc rcx
		dec rbx
		jmp .next_iter
	.close:
		mov al, ']'
		call print_char
		pop rcx
		pop rbx
		pop rax
	    ret

