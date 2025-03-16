section .data
   N  db "Enter a positive integer",0
   fmt db "%d",0
   sum db "sum from 1 %d is %d",10,0
section .text
   global main
   extern printf,scanf
main:
   mov eax,4
   mov ebx,1
   mov ecx,N
   mov edx,25
   syscall

   mov eax,[N]
   push N
   push "%d"
   call scanf
   add esp,8

   mov eax,0
   mov [sum],eax

   mov eax,[N]
   cmp eax,1
   jl exit

loop:
  add [sum],eax
  dec eax
  cmp eax,0
  jg loop

exit:
  push [sum]
  push [N]
  call printf
  add esp,12

  mov eax,1
  xor ebx,ebx
  syscall
