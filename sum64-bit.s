.data
    num1:   .long   10      # First integer
    num2:   .long   20      # Second integer
    result: .long   0       # Result variable

.text
.globl _start

_start:
    # Load num1 into EAX
    movl num1(%rip), %eax

    # Add num2 to EAX
    addl num2(%rip), %eax

    # Store the result in the 'result' variable
    movl %eax, result(%rip)

    # Exit the program
    movq $60, %rax      # 60 is the exit syscall number
    xor %rdi, %rdi      # Clear RDI (exit status)
    syscall             # Make a syscall to exit
