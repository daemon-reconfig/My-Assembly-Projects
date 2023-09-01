section .data
    arr dd 1,2,3,4,5,6,7,8,9,10
    result dd 0

section .text
    global _start
    _start:
        lea esi, [arr]
        lea edi, [esi + 8]
        mov al, [edi]
        mov [result], eax
        mov eax, 1
        int 0x80
        
