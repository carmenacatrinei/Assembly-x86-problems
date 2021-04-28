.data
    x: .space 4
.text
.globl _start
_start: 
    # ECX = EAX/16 +EBX * 16
    mov $16, %eax 
    mov $1, %ebx 
    mov %ebx, x

    mov $16, %ebx
    idiv %ebx 

    mov x, %eax
    imul %ebx

    add x, %eax
    mov %eax, %ecx 

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
