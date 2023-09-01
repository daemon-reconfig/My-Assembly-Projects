section .data
    num1 dd 40
    num2 dd 20
    result dd ?
section .text
    global _start
_start:
    mov eax, [num1]
    mov ebx, [num2]
    imul ebx, EAX
    mov [result], ebx
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 4
    int 80h
    mov eax, 1
    mov ebx, 0
    int 80h
