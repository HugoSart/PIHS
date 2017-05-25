.section	.data

numero:		.asciz	"Numero %d => "
newline:	.asciz	"\n"
formato:	.asciz	"%d"
parcial:	.asciz	"\nOs numeros sao parcialmente iguais!\n\n"
diferentes:	.asciz	"\nOs numeros sao todos diferentes!\n\n"
iguais:		.asciz	"\nOs numeros sao todos iguais!\n\n"
outro:		.asciz	"\nDeseja inserir outro? <1> SIM ou <0> NAO? "

n0:			.int	0
n:			.int	0
count:		.int	0
resp:		.int	0
comp:		.int	0

.section	.text
.globl		main

main:

novo:		pushl	$newline
			call	printf

			pushl	count
			pushl	$numero
			call	printf

			movl	$n0, n
			pushl	$n
			pushl	$formato
			call	scanf

			pushl	$outro
			call	printf

			pushl	$resp
			pushl	$formato
			call	scanf

			cmpl	$n, $n1
			

			incl	count

			cmpl	$0, resp

			jz		fim
			jnz		novo	

fim:		pushl	$0
			call	exit