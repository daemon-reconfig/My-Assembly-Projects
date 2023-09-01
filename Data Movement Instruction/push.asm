section .data
    arr dd 100 dup(0)
    top dd 0

section .text
    global _start
    _start: 
        ;push values to stack
        push_i 1
        push_i 2
        push_i 3
        push_i 4
        mov eax, 1
        int 0x80
    push_i:
        mov eax, 0
        mov ebx, 0
        mov ecx, 0

        mov al, [top]
        mov [arr + ebx], al
        inc [top]
        ret
