.section .data

saida:	.asciz "Teste %d: O valor do registrador eh: %X\n\n"
saida2: .asciz "Teste %d: Os valores dos regs sao: %X e %X\n\n"
saida3: .asciz "Teste %d: EAX = %X; EBX = %X; ECX = %X; EDX = %X; ESI = %X; EDI = %X\n\n"

.section .text
.globl main

main:   movl    $0x12345678, %eax
        pushl   %eax
        pushl   $1
        pushl   $saida
        call    printf

        movw    $0x1234, %ax
        pushw   %ax
        movw    $0xABCD, %ax
        pushw   %ax
        pushl   $1
        pushl   $saida
        call    printf

        movb    $0xAA, %ah
        movb    $0xBB, %al
        pushw   %ax
        movb    $0xCC, %ah
        movb    $0xDD, %al
        pushw   %ax
        pushl   $1
        pushl   $saida
        call    printf

        pushl   $0
        call    exit
