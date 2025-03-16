section .data
    prompt_numbers db "Enter two integer numbers: ", 0
    prompt_operation db "Select an operation (1 for Addition, 2 for Subtraction, 3 for Multiplication, 4 for Division): ", 0
    result_fmt db "Result: %d", 10, 0   
    error_fmt db "Error: Division by zero is not allowed", 10, 0

section .bss
    num1 resd 1        
    num2 resd 1        
    operation resd 1   

section .text
    global main
     extern printf, scanf

main:
    
    mov rdi, prompt_numbers 
    call printf

    
    mov rdi, "%d %d"      
    mov rsi, num1         
    mov rdx, num2         
    call scanf

    
    mov rdi, prompt_operation
    call printf

    
    mov rdi, "%d"         
    mov rsi, operation    
    call scanf

    
    mov eax, [num1]       
    mov ebx, [num2]       
    mov ecx, [operation]  

    
    cmp ecx, 1            
    je add_numbers

    cmp ecx, 2            
    je subtract_numbers

    cmp ecx, 3            
    je multiply_numbers

    cmp ecx, 4            
    je divide_numbers

    
    jmp _exit

add_numbers:
    add eax, ebx          
    jmp print_result

subtract_numbers:
    sub eax, ebx          
    jmp print_result

multiply_numbers:
    imul eax, ebx         
    jmp print_result

divide_numbers:
 
    cmp ebx, 0
    je division_by_zero
    xor edx, edx
division_by_zero:
    mov rdi,error_fmt
    call printf
    jmp _exit
print_result:
    mov rdi,result_fmt
    mov rsi,rax
    call printf
_exit:
    mov eax,60
    xor edi,edi
    syscall    
