format ELF64

public gcd
public fibonacci
public factorial
public bubble_sort
public rand
public srand

section '.data' writable
	_next dq 1

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

section '.gcd' executable
gcd:
	push rbx
	push rdx
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
		pop rdx
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


					


