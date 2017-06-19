			.section .data

apresenta:	.asciz	"\n*** PROGRAMA COMPARA IGUALDADE ENTRE VETORES 1.0 *** \n\n"
pedetam:	.asciz	"Digite o tamanho do vetor (0 < tam <= 50) => "
pedenum:	.asciz	"Entre com o numero %d => "
info1:		.asciz	"\nLEITURA DO VETOR %d:\n\n"
info2:		.asciz	"\nVetor %d lido : "
info3:		.asciz	"\nComparando ...\n"
formain:	.asciz	"%d"
formaout:	.asciz	" %d"
respigual:	.asciz	"Vetores iguais!\n\n"
respdifer:	.asciz	"Vetores diferentes!\n\n"
pulalinha:	.asciz	"\n"
pergcont:	.asciz	"\nDeseja nova execucao? [S]im ou [N]ao => "
limpabuf:	.string	"%*c"

maxtam:		.int	50
tam:		.int	0
n:			.int	0
num:		.int	0
resp:		.int	0
vetor1:		.space	204		# 4 bytes para cada numero a ser armazenado
vetor2:		.space	204		# 4 bytes para cada numero a ser armazenado

			.section .text

letam:		pushl	$tam
			pushl	$formain
			call	scanf
			pushl	$pulalinha
			call	printf
			addl	$12, %esp	#desfaz os ultimos 3 push's
			movl	tam, %ecx
			cmpl	$0, %ecx
			jle		letam
			cmpl	maxtam,	%ecx
			jg		letam
			ret

levet:		movl	$0, %ebx
volta1:		incl	%ebx
			pushl	%edi
			pushl	%ecx
			pushl	%ebx
			pushl	$pedenum
			call	printf
			pushl	$num
			pushl	$formain
			call	scanf
			addl	$12, %esp	#desfaz os ultimso 4 push's
			popl	%ebx
			popl	%ecx
			popl	%edi
			movl	num, %eax
			movl	%eax, (%edi)
			addl	$4, %edi
			loop	volta1
			ret

mostravet:	pushl 	%edi
			pushl 	%ecx
			movl 	(%edi), %eax
			pushl 	%eax
			pushl 	$formaout
			call 	printf
			addl 	$8, %esp
			popl 	%ecx
			popl 	%edi
			addl 	$4, %edi
			loop 	mostravet
			pushl 	$pulalinha
			call 	printf
			addl	$4, %esp
			ret

comparastr:	movl 	(%edi), %eax
			movl 	(%esi), %ebx
			cmpl 	%eax, %ebx
			jnz 	acabou
			addl 	$4, %edi
			addl 	$4, %esi
			loop 	comparastr
			cmpl 	%eax, %eax
acabou:		ret

			.globl	main

main:		pushl	$apresenta
			call	printf
			addl	$4, %esp

le_n:		pushl	$pedetam
			call	printf
			addl	$4, %esp
			call	letam
			movl	%ecx, n

le_vetores: pushl 	$1
			pushl 	$info1
			call 	printf
			addl 	$8, %esp
 			movl 	$vetor1, %edi
 			movl 	n, %ecx
			call 	levet

			pushl 	$2
			pushl 	$info1
			call 	printf
			addl 	$8, %esp
 			movl 	$vetor2, %edi
 			movl 	n, %ecx
			call 	levet


print_vets:	pushl 	$1
 			pushl 	$info2
 			call 	printf
			addl 	$8, %esp
 			movl 	$vetor1, %edi
 			movl 	n, %ecx
 			call 	mostravet
 			pushl 	$2
 			pushl 	$info2
 			call 	printf
			addl 	$8, %esp
 			movl 	$vetor2, %edi
 			movl 	n, %ecx
			call 	mostravet

cmp_vets:	pushl 	$info3
			call 	printf
			addl 	$4, %esp
			movl 	n, %ecx
			movl 	$vetor1, %edi
			movl 	$vetor2, %esi
			call 	comparastr
			jz 		saoiguais
			pushl 	$respdifer
			call 	printf
			addl 	$4, %esp
			jmp 	fim

saoiguais:	pushl 	$respigual
			call 	printf
			addl 	$4, %esp

fim:		pushl 	$pergcont
			call 	printf
			pushl 	$limpabuf
			call 	scanf
			addl 	$8, %esp
			call 	getchar
			cmpl 	$'s', %eax
			jz 		main

			pushl 	$0
			call 	exit
