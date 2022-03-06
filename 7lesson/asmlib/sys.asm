format ELF64

public exit

section '.exit' executable
exit:
	mov rax, 1
	xor rbx, rbx
	int 0x80
