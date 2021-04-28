.data
    x: .space 4
    y: .space 4
.text
.globl _start
_start:
    # EAX = (EAX * EBX)/(ECX^2)
    mov $8, %eax 
    mov $2, %ebx 
    mov $2, %ecx 

    imul %ebx
    mov %eax, x
    mov %ecx, %eax
    imul %eax 
    mov %eax, %ebx
    mov x, %eax
    idiv %ebx

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
        
     
