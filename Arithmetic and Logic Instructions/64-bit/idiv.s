section .data
    num1 dq 12
    num2 dq 3  

section .text  
    global _start
_start:
    mov rax, [num1]
    cdq
    mov ecx, [num2]
    idiv ecx
    mov [result], rax
    mov rax, 60
    xor rdi, rdi
    syscall
