format ELF64
public _start

section '.data' writeble
	new_line equ 0xA
	msg db "hello, world",new_line, 0

section '.text' executable
_start:
;     mov rax, 4 ; 4 - write
;	 xor rbx,rbx
;	 inc rbx ; 1 - stdout
;	 mov rcx, msg
;	 mov rdx, len
;	 xor rbx,rbx
;	 int 0x80
     mov rax,msg
	 call print_string
	 call exit

print_string:
	push rax
	push rbx
	push rcx
	push rdx
	mov rcx,rax
	call length_string
	mov rdx, rax
	mov rax, 4
	mov rbx, 1
	int 0x80
	pop rdx
	pop rcx
	pop rbx
	pop rax
	ret  

length_string:
	push rdx
	xor rdx, rdx
	.next_iter:
		cmp [rax + rdx], byte 0
		je .close
		inc rdx
		jmp .next_iter
	
	.close:
		mov rax, rdx
		pop rdx
		ret 

exit:
     mov rax, 1 ; 1 - exit
	 mov rbx, 0 ; 0 - return
     int 0x80
;
;
;
;
;byte - 8 bit
;word - 16 bit
;dword - 32 bit
;qword - 64 bit
;rax - 64:
;eax - 32
;ax - 16
;ah/al - 8 
