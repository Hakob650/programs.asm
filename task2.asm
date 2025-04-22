extern printf
extern scanf

section .data
	messg db "enter an integer",0
        res db "sum is: %d",10,0
	fmt dd "%d",0
section .bss
	N resd 1
section .text
	global main
main:
	push rbp
	mov rbp,rsp

	mov rdi,messg
	xor rax,rax
	call printf

	mov rdi,fmt
	mov rsi,N
	xor rax,rax
	call scanf

	xor rax,rax
	mov rax,N
        mov rcx,10

loop1:
	add rax,rcx 
	LOOP loop1

	mov rdi,res
	mov rsi,rax
	xor rax,rax
	call printf

	mov rsp,rbp
	pop rbp

	xor rax,rax
	ret
