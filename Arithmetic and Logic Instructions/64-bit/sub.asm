section .data
    num1 dd 30
    num2 dd 20

section .text
    global _start

_start:
    mov rax, [num1]      ; Load num1 into RAX
    mov rbx, [num2]      ; Load num2 into RBX
    sub rax, rbx         ; Subtract num2 from num1
    mov [num1], rax      ; Store the result back in num1

    ; Exit the program
    mov rax, 60           ; 60 is the exit syscall number
    xor rdi, rdi          ; Exit status (0 for success)
    syscall               ; Make a syscall to exit
