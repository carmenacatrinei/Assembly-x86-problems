.data
    x: .space 4
.text
.globl _start
_start:
    # EAX = EAX * ((EAX+EBX)/ECX +1)
    mov $2, %eax 
    mov $1, %ebx 
    mov $3, %ecx 

    mov %eax, x
    add %ebx, %eax 
    idiv %ecx
    add $1, %eax
    mov %eax, %ebx
    mov x, %eax
    imul %ebx 

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
    