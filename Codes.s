 #calc.asm 
line 1-contains initialized data,including string for prompts and error messages 
line 2-defines a null-terminated string to prompt the user input to integers 
line 3-defines a string to prompt the uset select an operation 
line 4-defines a format string for printing the result,10 represents a newline(\n) and 0 is the null-terminator 
line 5-defines an error message for division by 0 
line 6-reserves memory for user inputs 
lines 7,8-num1 and num2 reserve place for 2 integers 
line 9-reserves 4 bytes(1 dword),to store an integer 
line 10-contains the program logic 
line 11-marks main as a global symbol,making it the entry point 
line 12-defines external scanf,printf instructions,which are standard C library functions used for input and output 
line 13-the starting point of the program 
line 14-moves address of prompt_numbers into rdi 
line 15-calls printf to display the prompt 
line 16-moves the format "%d %d" to rdi to read 2 integers 
line 17-num1 and num2 are passed as pointers in rsi and rdi 
line 18-call scanf-calls scanf to read user input 
lines 19,20-displays the operation selection prompt 
lines 21,22,23-reads the operation choice and stores it in operation 
lines 24,25,26-moves num1 into eax,num2 into ebx,operation into ecx for processing 
lines 27,28-compares operation with 1,if equal jumps to add 
lines 29,30-compares operation with 2,if equal jumps to sub 
lines 31,32-compares operation with 3,if equal jumps to mul 
lines 33,34-compares operation with 4,if equal jumps to div
line 35-if the input doesn't match any operation,the program exits
lines 36,37,38-adds eax(num1) to ebx(num2) and stores the result in eax,jumps to print result
lines 39,40,41-subtracts ebx(num2) from eax(num1)
lines 42,43,44-multiplies eax(num1) by ebx(num2) and stores the result in eax
lines 45,46,47-compares ebx(num2) with 0,if zero jumps to division_by_zero
line 48-clears edx(important  for division because edx:eax holds the dividend in 64-bit division)
lines 49,50,51-prints error message and exits
lines 52,53,54-moves the result format string into rdi,moves eax(result) into rsi(the 2nd argument for printf),calls printf to display the result
lines 55,56,57-moves 60 into eax(exit system call number),clears edi(exit code 0),calls syscall to terminate the program


#sumofnums.asm
1.Data Section (.data and .bss)
prompt- a string to prompt the user for input.
fmt - a format string for scanf, used to read an integer.
sum_fmt- a format string for printf to display the result.
num- uninitialized storage(4 bytes) to hold the user's input
total- uninitialized storage(4 bytes) to store the sum
2.print the prompt(printf)-moves the prompt string into rdi(first argument for printf),calls printf to display the message
3.read user input-moves the address of string format into rdi(first argument for scanf)
,moves the address of num into rsi(2nd argumentof of scanf,the address where integer will be stored),calls scanf to store the user's input into num
4.initialize sum and load
zeroes out the total so the sum starts at 0,loads N from num into eax,if N<1 jumps to exit(prevents negative values)
5.Sum loop
adds eax(current N) to total,decrements eax,repeats until eax=0
6.Print the sum
moves format string sum to rdi,moves the value of num to rsi(original N),moves the value of total into rdx(computed sum),calls printf to display the result
7.Exit program
uses the linux exit syscall(60),sets edx=0(exitstatus=succeed),calls syscall to terminate the program












