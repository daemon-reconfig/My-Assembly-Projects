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
    mov ebx, 0
    int 80h
    
