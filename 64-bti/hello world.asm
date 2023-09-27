section .data
  msg1 db "Test", 10, 0
  l1 equ $-msg1-1
  msg2 db "Another one ", 10, 0
  l2 equ $-msg2-1
  m1 dq 478.9
  m2 dq 3.14

section .bss
section .text
  global main
  main:
    push rbp
    mov rbp, rsp
    mov rax, 1
    mov rdx, 1
    mov rsi, msg1
    mov rdx, l1
    syscall
    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, l2
    syscall
    mov rsp, rbp
    pop rbp
    mov rax, 60
    mov rdi, 0
    syscall
    
