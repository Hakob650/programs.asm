section .data
 prompt db "Enter a positive integer",0
 fmt db "%d",0
 sum_fmt db "sum from 1 to %d is %d",10,0
section .bss
 num1 resd 1
 total resd 1
section .text
 global main
 extern printf,scanf
main:
 mov rdi,prompt
 call printf

 mov rdi,fmt
 mov rsi,num
 call scanf

 mov dword [total],0

 mov eax,[num]
 cmp eax,1
 jl exit

loop:
 add dword [total],eax
 dec eax
 cmp eax,0
 jg loop
exit:
 mov rdi,sum_fmt
 mov rsi,[num]
 mov rdx,[total]
 call printf

 mov eax,60
 xor edi,edi
 syscall

