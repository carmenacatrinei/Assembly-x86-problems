.data
.text

.globl _start

# ECX= EAX+EBX-ECX

_start:

    mov $10, %eax
    mov $11, %ebx
    mov $1, %ecx

    add %ebx, %eax
    sub %ecx, %eax
    movl %eax, %ecx

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80   
    
