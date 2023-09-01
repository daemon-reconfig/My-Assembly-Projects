section .data
    num1 dd 30
    num2 dd 20
section .text
    global _start
_start:
    mov eax, [num1]
    mov ebx, [num2]
    sub eax, ebx
    mov [num1], eax
    mov eax, 1
    xor ebx, ebx
    int 80h
    
