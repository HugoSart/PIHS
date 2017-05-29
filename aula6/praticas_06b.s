.section	.data

abertura:	.asciz	"=========== Programa de ordenacao de 3 inteiros ===========\n\n"
pergunta:	.asciz	"\n\nDeseja executar de novo? [S]im ou [N]ao?\n=> "
tchau:		.asciz	"\n\nPrograma finalizado com sucesso.\n"
pede_n1:	.asciz	"\nDigite n1 => "
pede_n2:	.asciz	"\nDigite n2 => "
pede_n3:	.asciz	"\nDigite n3 => "
mostra_orig:.asciz	"\nOrdem original: %d -> %d -> %d\n"
mostra_ord:	.asciz	"\nOrdem ordenada: %d -> %d -> %d\n"

n1:			.int 	0
n2:			.int 	0
n3:			.int 	0

resp:		.int 	0

formato:	.asciz	"%d"
limpabuf:	.string	"%*c"	# ou .asciz "%*c"

.section	.text
.globl		main

main:

volta:		pushl	$abertura
			call	printf

			pushl	$pede_n1
			call	printf

			pushl	$n1
			pushl	$formato
			call	scanf

			pushl	$pede_n2
			call	printf

			pushl	$n2
			pushl	$formato
			call	scanf

			pushl	$pede_n3
			call	printf

			pushl	$n3
			pushl	$formato
			call	scanf

			pushl	n3
			pushl	n2
			pushl	n1
			pushl	$mostra_orig
			call	printf

			addl	$56, %esp

			movl	n1,	%eax
			movl	n2,	%ebx
			movl	n3,	%ecx

			cmpl	%eax,	%ebx
			jl		troca1

continua1:	cmpl	%ebx,	%ecx
			jl		troca2

continua2:	cmpl	%eax,	%ebx
			jge		fim
			xchgl	%ebx,	%eax
			jmp		fim

troca1:		xchgl	%eax,	%ebx
			jmp		continua1

troca2:		xchgl	%ebx,	%ecx
			jmp		continua2

fim:		pushl	%ecx
			pushl	%ebx
			pushl	%eax
			pushl	$mostra_ord
			call	printf

			pushl	$pergunta
			call	printf

			pushl	$resp
			pushl	$limpabuf
			call	scanf
			call	getchar		#retorna no %eax

			addl	$32,	%esp
			cmpl	$'S', %eax
			jz		volta

			pushl	$tchau
			call	printf
			addl	$4,	%esp

			pushl	$0
			call	exit
