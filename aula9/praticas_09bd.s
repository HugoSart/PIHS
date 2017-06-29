			.section 	.dat
#	mensagens de info
msg_main:	.asciz	"**** APLICACAO DE FILA ****\n\n"
msg_fifo:	.asciz  "Pilha -> "
#	mensagens de output
msg_gnname:	.asciz	"  Nome => "
msg_gra:	.asciz	"    RA => "
msg_gsex:	.asciz	"  Sexo => "
msg_gcourse:.asciz	" Curso => "
msg_gstreet:.asciz	"   Rua => "
msg_gnumber:.asciz	"Numero => "
msg_gdist:	.asciz	"Bairro => "
#	mensagens de inputs
msg_pname:	.asciz	"  Nome : %s\n"
msg_pra:	.asciz	"    RA : %d\n"
msg_psex:	.asciz	"  Sexo : %c\n"
msg_pcourse:.asciz	" Curso : %s\n"
msg_pstreet:.asciz	"   Rua : %s\n"
msg_pnumber:.asciz	"Numero : %d\n"
msg_pdist:	.asciz	"Bairro : %s\n"

f_str:		.asciz	"%s"
f_c:		.asciz	"%c"
f_int:		.asciz	"%d"

c_nl:		.asciz	"\n"

NULL:		.int 	0
usr_opt:	.int 	0

name:		.space	44
ra:			.space	8
sex:		.scape	4
course:		.space	24
street:		.space	44
number:		.space	8
dist:		.space	12


prox:		.int 	NULL

naloc:		.int 	84
pt_fifo:	.int 	NULL
pt_reg:		.int 	NULL

			.section	.text
			.globl		.main

scan_rec:	#	ler nome
			pushl	%edi
			pushl	%msg_pname
			call	printf
			addl	$4,	%esp
			call	gets

			popl	%edi
			addl	$44,	%edi
			pushl	%edi

			#	ler ra
			pushl	$msg_gra
			call	printf
			addl	$4,	%esp
			pushl	$f_int
			call 	scanf
			addl	$4,	%esp

			popl	%edi
			addl	$8,	%edi
			pushl	%edi

			pushl	$f_nl
			call	scanf
			addl	$4,	%esp

			#	ler sexo
			pushl	$msg_gsex
			call	printf
			addl	$4,	%esp
			pushl	$f_c
			call 	scanf
			addl	$4,	%esp

			popl	%edi
			addl	$4,	%edi
			pushl	%edi

			pushl	$f_nl
			call	scanf
			addl	$4,	%esp

			#	ler curso
			pushl	%edi
			pushl	%msg_gcourse
			call	printf
			addl	$4,	%esp
			call	gets

			popl	%edi
			addl	$24,	%edi
			pushl	%edi

			pushl	$f_nl
			call	scanf
			addl	$4,	%esp

			#	ler rua
			pushl	%edi
			pushl	%msg_gstreet
			call	printf
			addl	$4,	%esp
			call	gets

			popl	%edi
			addl	$44,	%edi
			pushl	%edi

			#	ler numero
			pushl	$msg_gnumber
			call	printf
			addl	$4,	%esp
			pushl	$f_int
			call 	scanf
			addl	$4,	%esp

			popl	%edi
			addl	$8,	%edi
			pushl	%edi

			pushl	$f_nl
			call	scanf
			addl	$4,	%esp

			#	ler bairro
			pushl	%edi
			pushl	%msg_gdist
			call	printf
			addl	$4,	%esp
			call	gets

			popl	%edi
			addl	$12,	%edi
			#pushl	%edi

			popl	%edi
			addl	$24,	%edi
			movl	$NULL,	(%edi)

			subl	$80,	%edi

			RET