.data
    nr_noduri:          .space 4
    nr_muchii:          .space 4
    roles:              .space 400
    value:              .space 4           
    matrix:             .space 1600
    index:              .space 4
    index2:             .space 4
    left:               .space 4
    right:              .space 4
    one:                .long 1
    two:                .long 2
    three:              .long 3
    four:               .long 4
    nr_problema:        .space 4
    valoare:            .space 4
    suma:               .long 0

    queueLen:           .space 4
    queueIndex:         .space 4
    queue:              .space 400
    visited:            .space 400
    graph:              .space 1600
    currentNode:        .space 4
    columnIndex:        .space 4
    indexvector:        .space 4
    message:            .space 400

    nod1:               .space 4
    nod2:               .space 4

    formatScans:        .asciz "%s"
    printf_host:        .asciz "host index %d; "
    printf_switch:      .asciz "switch index %d; "
    printf_switchm:     .asciz "switch malitios index %d: "
    printf_switchml:    .asciz "switch malitios index %d; "
    printf_contr:       .asciz "controller index %d; "
    formatScan:         .asciz "%d"
    formatPrints:       .asciz "%s"
    formatPrintd:       .asciz "%d"
    newLine:	        .asciz "\n"

    yes:                .asciz "Yes"
    no:                 .asciz "No"

.text

.global main

main:

    jmp             citire_noduri_muchii

citire_noduri_muchii:

    pushl       $nr_noduri
    push        $formatScan
    call        scanf
    popl        %ebx
    popl        %ebx
 
    pushl       $nr_muchii
    push        $formatScan
    call        scanf
    popl        %ebx
    popl        %ebx
 
    movl        $0, index
    lea         matrix, %edi

    jmp         for_citire_muchii

for_citire_muchii:

    movl        index, %ecx
    cmp         nr_muchii, %ecx
    je          pregatire_citire 

    pushl       $left
    push        $formatScan
    call        scanf
    popl        %ebx
    popl        %ebx
 
    pushl       $right
    push        $formatScan
    call        scanf
    popl        %ebx
    popl        %ebx
 
    movl        $0, %edx
    movl        nr_noduri, %eax
    mull        left
    addl        right, %eax
    movl        $1, (%edi, %eax, 4)
 
    movl        $0, %edx
    movl        nr_noduri, %eax
    mull        right
    addl        left, %eax
    movl        $1, (%edi, %eax, 4)
 
    incl        index
    jmp         for_citire_muchii
 
pregatire_citire:

    movl        $0, index
    lea         roles, %edi
    jmp         for_citire_roluri
 
    for_citire_roluri:

    movl        index, %ecx
    cmp         nr_muchii, %ecx
    je          citire_nr_problema
 
    pushl       $value
    push        $formatScan
    call        scanf
    popl        %ebx
    popl        %ebx
 
    movl        index, %ecx
    movl        value, %eax
    movl        %eax, (%edi, %ecx, 4)
 
    incl        index
    jmp         for_citire_roluri

citire_nr_problema:

    pushl       $nr_problema
    push        $formatScan
    call        scanf
    popl        %ebx
    popl        %ebx
 
    movl        nr_problema, %edx
 
    cmp         one, %edx
    je          nota_5
 
    cmp         two, %edx
    je          nota_7
 
    cmp         three, %edx
    je          nota_10

nota_5:

    movl        $0, index
    movl        $0, index2
    lea         roles, %edi
    lea         matrix, %esi

        for_principal:

            movl        index, %ecx
            cmp         nr_noduri, %ecx
            je          et_exit

            movl        $0, index2
            movl        $3, %ebx
            cmp         %ebx, (%edi, %ecx, 4)
            je          print_switch_malitios
            jmp         continuare_for_principal

            print_switch_malitios:

                pushl       index
                push        $printf_switchm
                call        printf
                popl        %ebx
                popl        %ebx

                jmp         for_index2
            
            for_index2:

                movl        index2, %ecx
                cmp         nr_noduri, %ecx
                je          afisare_endl

                
                movl        $0, %edx
                movl        nr_noduri, %eax
                mull        index
                addl        index2, %eax

                movl        $1, %edx
                cmp         %edx, (%esi, %eax, 4)
                je          verificare_index2
                jmp         continuare_for_index2

                verificare_index2:

                    movl        index2, %ecx
                    cmp         $1, (%edi, %ecx, 4)
                    je          afisare_host

                    cmp         $2, (%edi, %ecx, 4)
                    je          afisare_switch

                    cmp         $3, (%edi, %ecx, 4)
                    je          afisare_switch_malitios

                    cmp         $4, (%edi, %ecx, 4)
                    je          afisare_controller

                afisare_host:

                    pushl       index2
                    push        $printf_host
                    call        printf
                    popl        %ebx
                    popl        %ebx

                    pushl       $0
                    call        fflush
                    popl        %ebx
                    
                    jmp         continuare_for_index2

                afisare_switch:

                    pushl       index2
                    push        $printf_switch
                    call        printf
                    popl        %ebx
                    popl        %ebx

                    pushl       $0
                    call        fflush
                    popl        %ebx
                    
                    jmp         continuare_for_index2

                afisare_switch_malitios:

                    pushl       index2
                    push        $printf_switchml
                    call        printf
                    popl        %ebx
                    popl        %ebx

                    pushl       $0
                    call        fflush
                    popl        %ebx
                    
                    jmp         continuare_for_index2


                afisare_controller:

                    pushl       index2
                    push        $printf_contr
                    call        printf
                    popl        %ebx
                    popl        %ebx

                    pushl       $0
                    call        fflush
                    popl        %ebx
                    
                    jmp         continuare_for_index2
                

                continuare_for_index2:

                    incl        index2
                    jmp         for_index2

            afisare_endl:

                push        $newLine
                call        printf
                popl        %ebx

                pushl       $0
                call        fflush
                popl        %ebx

                jmp         continuare_for_principal

            continuare_for_principal:

                incl        index
                jmp         for_principal

nota_7:

        lea         queue, %edi
        movl        $0, queueLen

        movl        $0, %eax
        movl        queueLen, %ecx
        movl        %eax, (%edi, %ecx, 4)

        incl        queueLen

        lea         visited, %edi
        movl        $1, %eax
        movl        $0, %ecx
        movl        %eax, (%edi, %ecx, 4)

        while:

            movl        queueIndex, %ecx
            cmp         queueLen, %ecx
            je          parcurgere_visited

            lea         queue, %edi
            movl        (%edi, %ecx, 4), %edx
            movl        %edx, currentNode

            lea         roles, %esi
            movl        currentNode, %ecx
            movl        $1, %edx
            cmp         %edx, (%esi, %ecx, 4)
            je          afisare_host_index2
            jne         continuare_interior_while

            afisare_host_index2:

                pushl       currentNode
                push        $printf_host
                call        printf
                popl        %ebx
                popl        %ebx

                pushl       $0
                call        fflush
                popl        %ebx

                movl        currentNode, %ecx

            continuare_interior_while:

                movl        $0, columnIndex

                while2:

                    movl        columnIndex, %ecx
                    cmp         nr_noduri, %ecx
                    je          continuare_while

                    lea         matrix, %edi
                    movl        nr_noduri, %eax
                    movl        $0, %edx
                    mull        currentNode
                    addl        columnIndex, %eax

                    movl        $1, %edx
                    cmp         (%edi, %eax, 4), %edx
                    je          if_visited
                    jne         continuare_while2

                if_visited:

                    lea         visited, %edi
                    movl        columnIndex, %ecx
                    movl        $1, %eax
                    cmp         (%edi, %ecx, 4), %eax
                    jne         continuare_if_visited
                    je          continuare_while2

                continuare_if_visited:

                    lea         queue, %edi
                    movl        queueLen, %ecx
                    movl        columnIndex, %edx
                    movl        %edx, (%edi, %ecx, 4)

                    incl        queueLen

                    lea         visited, %esi
                    movl        columnIndex, %ecx
                    movl        $1, %edx
                    movl        %edx, (%esi, %ecx, 4)

                continuare_while2:

                    incl        columnIndex
                    jmp         while2

            continuare_while:

                incl        queueIndex
                jmp         while

            parcurgere_visited:

                push        $newLine
                call        printf
                popl        %ebx

                pushl       $0
                call        fflush
                popl        %ebx

                lea         visited, %edi
                movl        $0, index

                continuare_parcurgere_visited:

                    movl index, %ecx
                    cmp nr_noduri, %ecx
                    je verificare_suma

                    movl (%edi, %ecx, 4), %edx
                    addl %edx, suma

                    incl index
                    jmp continuare_parcurgere_visited

                verificare_suma:

                    movl        suma, %ecx
                    cmp         nr_noduri, %ecx
                    je          afisare_yes
                    jne         afisare_no

                afisare_yes:

                    push        $yes
                    call        printf
                    popl        %ebx

                    pushl       $0
                    call        fflush
                    popl        %ebx

                    jmp         et_exit

                afisare_no:

                    push        $no
                    call        printf
                    popl        %ebx

                    pushl       $0
                    call        fflush
                    popl        %ebx
                    jmp         et_exit

nota_10:
    
    pushl       $nod1
	pushl       $formatScan
	call        scanf
	popl        %ebx
	popl        %ebx
	
	pushl       $nod2
	pushl       $formatScan
	call        scanf
	popl        %ebx
	popl        %ebx

	lea         message, %edi
	pushl       %edi
	pushl       $formatScans
	call        scanf
	popl        %ebx
	popl        %ebx

    jmp         et_exit


et_exit:

    movl        $1, %eax
    xor         %ebx, %ebx
    int         $0x80
