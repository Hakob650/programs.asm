section .data
  arr db -5,12,9,-3,7,-14,-8,6,-9,20
  max db "the max value in arr is %d",10,0
section .bss 
  maxvalue resd 1
section .text
  global main
  extern printf
main:
  movzx eax,byte [arr]
  mov [maxvalue],eax
  mov ecx,1
loop:
  cmp ecx,10
  jge done:
  movzx eax,byte [arr+ecx]
  cmp eax,[maxvalue]
  jg newmax

  inc eax
  jmp loop:
 
newmax:
  mov [maxvalue],eax
  inc eax
  jmp loop:

done:
  push [maxvalue]
  push max
  call printf
  add esp,4

  mov eax,1
  xor ebx,ebx
  syscall
