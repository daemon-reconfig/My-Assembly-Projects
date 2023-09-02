section .data
    rows dd 5
    star db '*'
.section .text
    .global _start
_start:
    mov ecx, rows
outer_loop:
    mov edx, ecx
inner_loop:
    mov eax, 4
    mov ebx, 1
    mov ecx, star
    mov esi, 1
    int 0x80
    dec edx
    jz newline
    mov eax, 4
    mov ebx, 1
    mov ecx, ' '
    mov esi, 1
    int 0x80
    jmp inner_loop
newline:
    mov eax, 4
    mov ebx, 1
    mov ecx, 10
    mov esi, 1
    int 0x80
    dec ecx
    jz exit
    jmp outer_loop
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
