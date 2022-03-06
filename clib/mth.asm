format ELF64

public c_gcd
public c_fibonacci
public c_factorial
public c_bubble_sort
public c_rand
public c_srand

include "asmlib/mth.inc"

section '.c_srand' executable
c_srand:
	mov rax, rdi
	call c_srand
	ret

section '.c_rand' executable
c_rand:
	call c_rand
	ret

section '.c_bubble_sort' executable
c_bubble_sort:
	mov rax, rdi
	mov rbx, rsi
	call bubble_sort
	ret

section '.c_gcd' executable
c_gcd:
	mov rax, rdi
	mov rbx, rsi
	call gcd
	ret

section '.c_fibonacci' executable
c_fibonacci:
	mov rax, rdi
	call fibonacci
	ret

section '.c_factorial' executable
c_factorial:
	mov rax, rdi
	call factorial 
	ret
