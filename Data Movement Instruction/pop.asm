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
        pop_i 1
        pop_i 2
        pop_i 3
        pop_i 4
        ;print stack

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
    
    pop_i:
        dec [top]
        mov eax, 0
        mov ebx, 0
        mov ecx, 0

        mov al, [top]
        mov dl, al
        mov ah, 0x0e
        mov bh, 0x00
        mov bl, 0x07
        int 0x10
        ret
