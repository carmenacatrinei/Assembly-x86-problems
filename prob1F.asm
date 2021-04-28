.data
    x: .space 4
.text
.globl _start
_start:
    # EAX= (EAX + EBX)/(EAX+ECX)
    mov $2, %eax 
    mov $4, %ebx 
    mov $1, %ecx 

    mov %eax, x
    add %ebx, %eax 
    add x, %ecx
    mov %ecx, %ebx
    idiv %ebx

et_exit:
    mov $1, %eax
    mov $0, %ebx 
    int $0x80
