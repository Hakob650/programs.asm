extern printf
extern scanf

section .data
	fmt_1 db "%d",0
	fmt_2 db "%d",10,0
section .text
	global main
main:
	push rbp
	mov rbp,rsp

	sub rsp,16

	mov rdi,fmt_1
	lea rsi,[rbp-4]
	xor rax,rax
	call scanf

	mov rdi,fmt_1
	lea rsi,[rbp-8]
	xor rax,rax
	call scanf

	mov cx,[rbp-8]
	mov rax,[rbp-4]
	mov rbx,rax
	mov rax,1
loop:
	imul rbx
	LOOP loop

	mov rdi,fmt_2
        mov rsi,rax
	call printf

	mov rsp,rbp
	pop rbp

	xor rax,rax
        ret
