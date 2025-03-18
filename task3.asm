extern printf

extern scanf

section .data
	scanf_fmt db "%d",0
	printf_fmt db "max is %d",10,0
section .bss
	arr resd 20
section .text
	global main
main:
	push rbp
	mov rbp,rsp

	mov rbx,0
loop1:
	cmp rbx,20
	jae loop1_end

	xor rax,rax
	mov rdi,scanf_fmt
	lea rsi,[arr+4*rbx]	
	call scanf
	
	inc rbx
	jmp loop1

loop1_end:
	mov rax,0
	mov eax,[arr]
	mov rbx,1

loop2:
	cmp rbx,20
	jae loop2_end

	cmp eax,[arr+4*rbx]
	jl assign
	inc rbx
	jmp loop2
assign:
	mov eax,[arr+4*rbx]
	inc rbx
	jmp loop2
loop2_end:
	mov rdi,printf_fmt
	movsx rsi,eax
	xor rax,rax
	call printf

	mov rsp,rbp
	pop rbp

	xor rax,rax
	ret
