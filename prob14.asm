.data
    suma: .space 4
    media: .space 4
    index: .space 4
    n: .long 3
    v: .long 1, 2, 3
    format: .asciz "(%d, %d)\n"
.text
.global main
main:
    lea v, %edi
    mov $0, suma
    movl $0, index
    movl $0, media

for:
    mov index, %ecx
    cmp n, %ecx
    je final

    movl suma, %eax
    add (%edi, %ecx, 4), %eax
    movl %eax, suma

    incl index
    jmp for

final:
    movl suma, %eax
    movl n, %ebx
    movl $0, %edx
    divl %ebx

    mov %eax, media
    jmp et_exit

et_exit:
    pushl suma
    pushl media
    push $format
    call printf
    popl %ebx
    popl %ebx
    popl %ebx

    push $0
    call fflush
    popl %ebx

    mov $1, %eax
    mov $0, %ebx
    int $0x80


