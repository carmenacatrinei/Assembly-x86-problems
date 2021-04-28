.data
.text
.globl _start
_start:
    # SWAP EAX, EBX cu functii logice
    mov $1, %eax 
    mov $2, %ebx 
    
    xor %eax, %ebx 
    xor %ebx, %eax 
    xor %eax, %ebx 

et_exit:
    mov $1, %eax 
    xor %ebx, %ebx 
    int $0x80
    
