section .data
    num1 dd 40
    num2 dd 20
    result dd ?
    out_fmt db "Result: %d", 10, 0  ; Format string for printing the result

section .text
    global _start

_start:
    mov eax, [num1]
    mov ebx, [num2]
    imul ebx, eax           ; Multiply num1 and num2, result in EBX
    mov [result], ebx

    ; Prepare for printing
    mov eax, 4               ; 4 is the sys_write syscall number
    mov ebx, 1               ; 1 is the file descriptor for stdout
    mov ecx, result          ; Load the address of result
    mov edx, 4               ; Number of bytes to print (assuming a 32-bit result)
    int 80h

    ; Exit the program
    mov eax, 1               ; 1 is the sys_exit syscall number
    mov ebx, 0               ; Exit status (0 for success)
    int 80h
