.data
    x: .space 4
    y: .space 4
.text
.globl _start

_start:
    # EBX= ((EAX*2+EBX)*2+ECX)/2=(EAX*4+EBX*2+ECX*2)/2 = EAX*2 + EBX + ECX/2
    mov $1, %eax 
    mov $1, %ebx   
    mov $2, %ecx  

    mov %eax, x
    mov %ebx, y

    mov $2, %ebx 
    imul %ebx

    add y, %eax

    mov %eax, y

    mov $2, %ebx
    mov %ecx, %eax
    idiv %ebx

    add %eax, y
    mov y, %ebx

et_exit:
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80

