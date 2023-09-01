section .data
    num1 dq 40
    num2 dq 20
    result dq 0
    out_fmt db "Result: ", 0  ; Format string (no placeholders)

section .text
    global _start

_start:
    mov rax, [num1]
    mov rbx, [num2]
    imul rbx, rax           ; Multiply num1 and num2, result in RBX
    mov [result], rbx

    ; Prepare for printing the label
    mov rax, 1               ; 1 is the sys_write syscall number
    mov rdi, 1               ; 1 is the file descriptor for stdout
    lea rsi, [out_fmt]       ; Load the address of the format string
    mov rdx, 9               ; Number of bytes to print (length of the format string)
    syscall

    ; Prepare for printing the result
    mov rax, 1               ; 1 is the sys_write syscall number
    mov rdi, 1               ; 1 is the file descriptor for stdout
    lea rsi, [result]        ; Load the address of result
    mov rdx, 8               ; Number of bytes to print (assuming a 64-bit result)
    syscall

    ; Exit the program
    mov rax, 60              ; 60 is the sys_exit syscall number
    xor rdi, rdi             ; Exit status (0 for success)
    syscall
