section .data
    .align 4
    .type   g, @object
    .size   g, 4
g:
    .long   0
    .text
    .globl  main
    .type   main, @function
main:
    ;anything
    movl    $0, %eax
    ret
    .size   main, .-main
    .ident  "GCC: (GNU) 4.8.2 20131212 (Red Hat 4.8.2-7)"
    .section    .note.GNU-stack,"",@progbits
