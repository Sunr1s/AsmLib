format ELF64

public c_fcreate
public c_fdelete
public c_fopen
public c_fclose
public c_fwrite
public c_fread
public c_fseek
public c_time
public c_exit

include "asmlib/sys.inc"

section ',c_fcreate' executable
c_fcreate:
	mov rax, rdi
	mov rbx, rsi
	call fcreate
	ret

section ',c_fdelete' executable
c_fdelete:
	mov rax, rdi
	call fdelete
	ret

section ',c_fopen' executable
c_fopen:
	mov rax, rdi
	mov rbx, rsi
	mov rcx, rdx
	call fopen
	ret

section ',c_fclose' executable
c_fclose:
	mov rax, rdi
	call fclose
	ret

section ',c_fwrite' executable
c_fwrite:
	mov rax, rdi
	mov rbx, rsi
	mov rcx, rdx
	call fwrite
	ret

section ',c_fread' executable
c_fread:
	mov rax, rdi
	mov rbx, rsi
	mov rcx, rdx
	call fread
	ret

section ',c_fseek' executable
c_fseek:
	mov rax, rdi
	mov rbx, rsi
	mov rcx, rdx
	call fseek
	ret

section ',c_time' executable
c_time:
	mov rax, rdi
	call time 
	ret

section ',c_exit' executable
c_exit:
	call exit 
	ret

