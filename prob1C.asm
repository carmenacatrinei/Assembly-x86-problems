.data
.text
.globl _start
_start:
    # EAX= (EAX+EBX+ECX) * 16
    mov $1, %eax 
    mov $2, %ebx 
    mov $3, %ecx 

    add %ebx, %eax
    add %ecx, %eax
    mov $16, %ebx
    imul %ebx

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80
    
