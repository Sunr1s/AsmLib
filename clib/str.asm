format ELF64

public c_string_to_number
public c_number_to_string
public c_lenght_string

include "asmlib/str.inc"

section '.c_string_to_number' executable
c_string_to_number:
	mov rax, rdi
	call string_to_number
	ret

section '.c_number_to_string' executable
c_number_to_string:
	mov rax, rdi
	mov rbx, rsi
	mov rcx, rdx
	call number_to_string
	ret

section '.c_lenght_string' executable
c_lenght_string:
	mov rax, rdi
	call lenght_string
	ret


