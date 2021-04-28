.data
    putere: .space 4
    nr_nat: .space 4
    
.text
.globl _start
_start:
    mov $7, %eax
    mov %eax, nr_nat

    mov $1, %eax
    jmp for

for:
    mov $2, %ebx
    imul %ebx
    cmp nr_nat, %eax 
    ja et_exit
    jmp for

et_exit:
    mov $1, %eax 
    xor %ebx, %ebx 
    int $0x80
