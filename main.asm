format ELF64
public _start

include "asmlib/fmt.inc"
include "asmlib/sys.inc"

section '.bss' writable
	buffer_size equ 50
	buffer rb buffer_size

section '.data' writable
	dates db "hello, world!", 0
	datas_size = $-dates-1
	filename db "test_file.txt", 0

section '.text' executable
_start:
	mov rax, filename
	mov rbx, 0
    call fopen
	
	mov rbx, buffer
	mov rcx, buffer_size
	call fread

	push rax
	mov rax, buffer
	call print_string
	pop rax

	call fclose
	call print_line
	call exit

section '.fcreate' executable
fcreate:
	push rbx
	push rcx

	mov rcx, rbx
	mov rbx, rax
	mov rax, 8 
	int 0x80

	pop rcx
	pop rbx
	ret

section '.fdelete' executable
fdelete:
	push rax 
	push rbx
	
	mov rbx, rax
	mov rax, 10
	int 0x80

	pop rbx
	pop rax
	ret

section '.fopen' executable
fopen:
	push rbx
	push rcx

	mov rcx, rbx
	mov rbx, rax
	mov rax, 5
	int 0x80

	pop rcx
	pop rbx
	ret

section '.fclose' executable
fclose:
	push rbx

	mov rbx, rax
	mov rax, 6
	int 0x80

	pop rbx
	ret

section '.fwrite' executable
fwrite:
	push rax
	push rbx
	push rcx
	push rdx

	push rbx
	push rcx

	mov rbx, 1
	xor rcx, rcx
	call fseek

	pop rcx
	pop rbx

	mov rdx, rcx
	mov rcx, rbx
	mov rbx, rax
	mov rax, 4
	int 0x80

	pop rdx
	pop rcx
	pop rbx
	pop rax
	ret

section '.fread' executable
fread:
	push rax
	push rbx
	push rcx
	push rdx

	push rbx
	push rcx

	mov rbx, 1
	xor rcx, rcx
	call fseek

	pop rcx
	pop rbx

	mov rdx, rcx
	mov rcx, rbx
	mov rbx, rax
	mov rax, 3
	int 0x80

	pop rdx
	pop rcx
	pop rbx
	pop rax
	ret



section '.fseek' executable
fseek:
	push rax 
	push rbx
	push rcx
	push rdx

	mov rdx, rbx
	mov rbx, rax
	mov rax, 19
	int 0x80

	pop rdx
	pop rcx
	pop rbx
	pop rax
	ret


