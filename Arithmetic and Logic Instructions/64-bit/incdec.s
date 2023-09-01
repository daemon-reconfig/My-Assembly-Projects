section .data
    num1 dd 0
    num2 dd 0
    space db ' '

section .text
    global _start

_start:
    mov rax, [num1]       ; Load num1 into RAX
    inc rax               ; Increment RAX
    mov rbx, [num2]       ; Load num2 into RBX
    dec rbx               ; Decrement RBX

    ; Print num1
    mov rdi, rax          ; Copy num1 to RDI for syscall
    mov rax, 1            ; 1 is the sys_write syscall number
    mov rsi, rdi          ; Load the value of num1 into RSI (address of num1)
    mov rdx, 4            ; Number of bytes to print
    syscall               ; Make a syscall to write to stdout

    ; Print a space between values
    mov rax, 4
    mov rdi, space        ; Load the address of a space character
    mov rsi, 1            ; Number of bytes to print (1 for the space)
    syscall

    ; Print num2
    mov rdi, rbx          ; Copy num2 to RDI for syscall
    mov rax, 4
    mov rsi, rdi          ; Load the value of num2 into RSI (address of num2)
    mov rdx, 4            ; Number of bytes to print
    syscall

    ; Exit the program
    mov rax, 60           ; 60 is the exit syscall number
    xor rdi, rdi          ; Exit status (0 for success)
    syscall               ; Make a syscall to exit
