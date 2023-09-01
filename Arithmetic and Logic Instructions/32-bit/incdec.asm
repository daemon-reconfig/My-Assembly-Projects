section .data
    num1 dd 0
    num2 dd 0
section .text
    global _start   
_start:
    mov eax, [num1]
    inc eax
    mov ebx, [num2]
    dec ebx
    ;print
    mov eax, 1
    mov ebx, 1
    mov ecx, num1
    mov edx, 4
    int 80h
    ; Print a space between values
    mov eax, 4
    mov ecx, space        
    mov edx, 1            
    int 80h
    ; Print num2
    mov eax, 4
    mov ecx, num2         
    mov edx, 4
    int 80h
    ;exit
    mov eax, 1
    mov ebx, 0
    int 80h
section .data
    space db ' '     
