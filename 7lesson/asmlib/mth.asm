format ELF64

public gcd
public fibonacci
public factorial

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


					


