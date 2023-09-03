SYS_E equ 1
SYS_R equ 3
SYS_W equ 4
STDO equ 1
STDI equ 0

segment .data
    m1 db "Enter a number ", 0xA, 0xD
    len1 equ $-m1
    m2 db "Enter second number ", 0xA, 0xD
    len2 equ $-m2
    m3 db "The sum is ", 0xA, 0xD
    len3 equ $-m3
    m4 db "The difference is ", 0xA, 0xD
    len4 equ $-m4
    m5 db "The product is ", 0xA, 0xD
    len5 equ $-m5
    m6 db "The quotient is ", 0xA, 0xD
    len6 equ $-m6
    m7 db "The remainder is ", 0xA, 0xD
    len7 equ $-m7
    m8 db "The first number is greater than the second number", 0xA, 0xD
    len8 equ $-m8
    m9 db "The first number is less than the second number", 0xA, 0xD
    len9 equ $-m9
    m10 db "The first number is equal to the second number", 0xA, 0xD
    len10 equ $-m10
    m11 db "The first number is not equal to the second number", 0xA, 0xD
    len11 equ $-m11
    m12 db "The first number is greater than or equal to the second number", 0xA, 0xD
    len12 equ $-m12
    m13 db "The first number is less than or equal to the second number", 0xA, 0xD
    len13 equ $-m13
    m14 db "The first number is not greater than the second number", 0xA, 0xD
    len14 equ $-m14
    m15 db "The first number is not less than the second number", 0xA, 0xD
    len15 equ $-m15
    m16 db "The first number is not greater than or equal to the second number", 0xA, 0xD
    len16 equ $-m16
    m17 db "The first number is not less than or equal to the second number", 0xA, 0xD
    len17 equ $-m17
segment .bss
    num1 resb 2
    num2 resb 2
    sum resb 2
    diff resb 2
    prod resb 2
    quot resb 2
    rem resb 2
    cmp resb 2 
segment .text
    global _start
_start:
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m1
    mov edx, len1
    int 80h

    mov eax, SYS_R
    mov ebx, STDI
    mov ecx, num1
    mov edx, 2
    int 80h

    mob eax, SYS_W
    mov ebx, STDO
    mov ecx, m2
    mov edx, len2
    int 80h

    mov eax, SYS_R
    mov ebx, STDI
    mov ecx, num2
    mov edx, 2
    int 80h

    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m3
    mov edx, len3
    int 80h

    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'
    add eax, ebx
    add eax, '0'
    mov [sum], eax

    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, sum
    mov edx, 2
    int 80h

    mov eax, SYS_W 
    mov ebx, STDO
    mov ecx, m4
    mov edx, len4
    int 80h

    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub eax, '0'
    sub eax, ebx
    add eax, '0'
    mov [diff], eax

    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, diff
    mov edx, 2
    int 80h

    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m5
    mov edx, len5
    int 80h

    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'
    imul eax, ebx
    add eax, '0'
    mov [prod], eax
    int 80h
    
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, prod
    mov edx, 2
    int 80h

    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m6
    mov edx, len6
    int 80h

    mov eax, [num1]
    mov ebx, [num2]
    sub eax, '0'
    sub ebx, '0'
    mov edx, 0
    idiv ebx
    add eax, '0'
    mov [quot], eax
    int 80h

    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, quot
    mov edx, 2
    int 80h

    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m7
    mov edx, len7
    int 80h

    mov eax, [num1]
    mov ebx, [num2]
    sub eax, '0'
    sub ebx, '0'
    mov edx, 0
    idiv ebx
    add edx, '0'
    mov [rem], edx
    int 80h

    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, rem
    mov edx, 2
    int 80h

    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m8
    mov edx, len8
    int 80h

    mov eax, [num1]
    cmp eax, [num2]
    jg greater
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m9
    mov edx, len9
    int 80h

    mov eax, [num1]
    cmp eax, [num2]
    je equal
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m10
    mov edx, len10
    int 80h

    mov eax, [num1]
    cmp eax, [num2]
    jne notequal
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m11
    mov edx, len11
    int 80h

    mov eax, [num1]
    cmp eax, [num2]
    jge greaterequal
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m12
    mov edx, len12
    int 80h

    mov eax, [num1]
    cmp eax, [num2]
    jle lessequal
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m13
    mov edx, len13
    int 80h

    mov eax, [num1]
    cmp eax, [num2]
    jng notgreater
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m14
    mov edx, len14
    int 80h

    mov eax, [num1]
    cmp eax, [num2]
    jnl notless
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m15
    mov edx, len15
    int 80h

    mov eax, [num1]
    cmp eax, [num2]
    jnle notgreaterequal
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m16
    mov edx, len16
    int 80h

    mov eax, [num1]
    cmp eax, [num2]
    jnle notlessequal
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m17
    mov edx, len17
    int 80h

    mov eax, SYS_E
    mov ebx, 0
    int 80h

greater:
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m8
    mov edx, len8
    int 80h

    mov eax, SYS_E
    mov ebx, 0
    int 80h

equal:
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m10
    mov edx, len10
    int 80h

    mov eax, SYS_E
    mov ebx, 0
    int 80h

notequal:
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m11
    mov edx, len11
    int 80h

    mov eax, SYS_E
    mov ebx, 0
    int 80h

greaterequal:
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m12
    mov edx, len12
    int 80h

    mov eax, SYS_E
    mov ebx, 0
    int 80h

lessequal:
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m13
    mov edx, len13
    int 80h

    mov eax, SYS_E
    mov ebx, 0
    int 80h

notgreater:
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m14
    mov edx, len14
    int 80h

    mov eax, SYS_E
    mov ebx, 0
    int 80h

notless:
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m15
    mov edx, len15
    int 80h

    mov eax, SYS_E
    mov ebx, 0
    int 80h

notgreaterequal:
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m16
    mov edx, len16
    int 80h

    mov eax, SYS_E
    mov ebx, 0
    int 80h

notlessequal:
    mov eax, SYS_W
    mov ebx, STDO
    mov ecx, m17
    mov edx, len17
    int 80h

    mov eax, SYS_E
    mov ebx, 0
    int 80h



    
