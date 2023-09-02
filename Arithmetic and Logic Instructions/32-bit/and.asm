section .data
    num1 dd 0
    num2 dd 5

section .bss
    res resd 1

section .text
    global _start

_start:
    mov eax, [num2]
    mov ebx, 0
    mov ecx, res
    and eax, ecx
    mov [res], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 4
    int 0x80
    mov eax, 1
    int 0x80
