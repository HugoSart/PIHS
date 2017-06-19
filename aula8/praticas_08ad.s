			.section .data

apresenta:	.asciz	"\n*** ACHAR VETOR CONTIDO EM OUTRO *** \n\n"
pedetam:	.asciz	"Digite o tamanho do vetor %d (0 < tam <= %d) => "
pedenum:	.asciz	"Entre com o numero %d => "
info1:		.asciz	"\nLEITURA DO VETOR %d:\n\n"
info2:		.asciz	"\nVetor %d lido : "
info3:		.asciz	"\nComparando ...\n"
formain:	.asciz	"%d"
formaout:	.asciz	" %d"
respigual:	.asciz	"Vetor esta contido!\n\n"
respdifer:	.asciz	"Vetor nao esta contido!\n\n"
pulalinha:	.asciz	"\n"
pergcont:	.asciz	"\nDeseja nova execucao? [S]im ou [N]ao => "
limpabuf:	.string	"%*c"

maxtam:		.int	50
tam1:		.int	0
tam2:		.int	0
n:			.int	0
num:		.int	0
esp:		.int	0
vetor1:		.space	204		# 4 bytes para cada numero a ser armazenado
vetor2:		.space	204		# 4 bytes para cada numero a ser armazenado

			.section .text

letam1:		pushl	$tam1
			pushl	$formain
			call	scanf
			pushl	$pulalinha
			call	printf
			addl	$12, %esp	#desfaz os ultimos 3 push's
			movl	tam1, %ecx
			cmpl	$0, %ecx
			jle		letam1
			cmpl	maxtam,	%ecx
			jg		letam1
			ret

letam2:		pushl	$tam2
			pushl	$formain
			call	scanf
			pushl	$pulalinha
			call	printf
			addl	$12, %esp	#desfaz os ultimos 3 push's
			movl	tam2, %ecx
			cmpl	$0, %ecx
			jle		letam2
			cmpl	tam1, %ecx
			jg		letam2
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

			.globl	main

# --------------- MAIN --------------- # 
main:		pushl	$apresenta
			call	printf
			addl	$4, %esp

le_tam1:	pushl	maxtam
			pushl	$1
			pushl	$pedetam
			call	printf
			addl	$4, %esp
			call	letam1
			movl	%ecx, n

le_tam2:	pushl	tam1
			pushl	$2
			pushl	$pedetam
			call	printf
			addl	$4, %esp
			call	letam2
			movl	%ecx, n

			pushl	$0
			call	exit
