
#calc.asm
1-contains initialized data,including string for prompts and error messages
2-defines a null-terminated string to prompt the user input to integers
3-defines a string to prompt the uset select an operation
4-defines a format string for printing the result,10 represents a newline(\n) and 0 is the null-terminator
5-defines an error message for division by 0
6-reserves memory for user inputs
7,8-num1 and num2 reserve place for 2 integers
9-reserves 4 bytes(1 dword),to store an integer
10-contains the program logic
11-mark main as a global symbol,making it the entry point
12-defines external scanf,printf instructions,which are standard C library functions used for input and output
13-the starting point of the program
14-moves address of prompt_numbers into rdi
15-calls printf to display the prompt
16-moves the format "%d %d" to rdi to read 2 integers
17-num1 and num2 are passed as pointers in rsi and rdi
18-call scanf-calls scanf to read user input
19,20-displays the operation selection prompt
21,22,23-reads the operation choice and stores it in operation
24,25,26-moves num1 into eax,num2 into ebx,operation into ecx for processing
27,28-compares operation with 1,if equal jumps to add
29,30-compares operation with 2,if equal jumps to sub
31,32-compares operation with 3,if equal jumps to mul
33,34-compares operation with 4,if equal jumps to div
35-if the input doesn't match any operation,the program exits
36,37,38-adds num1(eax) and num2(ebx),jumps to print_result
39,40,41-subtracts num2(ebx) from num1(eax)
42,43,44-multiplies eax by ebx and stores the result in eax
45,46,47-compares ebx(num2) with 0,if equal jumps to division by 0
48-clears edx(important for division because edx:eax holds the dividend in 64-bit division
49,50,51,52-prints an error message and exits
52,53,54,55-moves the result format string into rdi,moves eax(result) into rsi(2nd argument for printf),calls printf to display the result
56,57,58,59-moves 60 into eax(exit systemcall number),clears edi(exit code 0),calls syscall to terminate the program
