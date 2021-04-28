.data
    pozitiv: .asciz "Pozitiv\n"
    negativ: .asciz "Negativ\n"
    zero:    .asciz "Zero\n"
    format:  .asciz "%s"

.text
.global main
main:
    # In registrul EAX avem un numar intreg
    # Sa se verifice daca numarul e ><=0
    mov $5, %eax 
    mov $0, %ebx
    cmp %ebx, %eax
    je et_zero
    jg et_pozitiv
    jl et_negativ
    jmp et_exit

et_zero:
    push $zero
    push $format
    call printf
    popl %ebx
    popl %ebx 

    pushl $0
    call fflush
    pop %ebx
    jmp et_exit

et_pozitiv:
    push $pozitiv
    push $format
    call printf
    popl %ebx
    popl %ebx 

    pushl $0
    call fflush
    pop %ebx
    jmp et_exit

et_negativ:
    push $negativ
    push $format
    call printf
    popl %ebx
    popl %ebx 

    pushl $0
    call fflush
    pop %ebx
    jmp et_exit

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
