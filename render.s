###################################
#	Funções de Render	  #
###################################


#---------------Imagens de tela inteira---------------#

ImpressaoTelaInteira:
#Imprime uma imagem com as dimensões da tela. Coloca os pixels de 4 em 4 já que não é 
#necessário se preocupar com byte addressing, como no caso de sprites menores.

#a0 = arquivo.data a ser imprimido
#a1 = endereço inicial de print/frame----> 0xFF000000, endereço inicial no frame 0 / 0xFF100000 no frame 1

LoadIMG:			#Carrega os dados para imprimir a imagem corretamente
	lw t1, 0(a0) 		#x(linhas)
	lw t2, 4(a0) 		#y(colunas)
	mul t3, t1, t2		#numero total de pixels
	addi a0, a0, 8		#Primeiro pixel
	li t4, 0		#contador
	mv t0, a1  		#endereço inicial para imprimir
	
	
#Já com a imagem carregada, ocorre impressao nesse loop	
ImprimeIMG:
	beq t4, t3, TerminaImpressao		#quando finalizar, retorna para onde o programa estava antes de chamar a função
	lw t5, 0(a0)
	sw t5, 0(t0)
	addi a0, a0, 4
	addi t0, t0, 4	
	addi t4, t4, 4	
	j 	ImprimeIMG
	
TerminaImpressao:
	ret



#---------------Imagens de tamanho variável---------------#

ImpressaoPequena:
#Utilizada para imprimir imagens pequenas em qualquer lugar da tela sem ocorrer erro word desalinhada por causa do byte addressing.

#a0 = Endereço da imagem .data a ser impressa
#a1 = Endereço inicial do display onde a imagem vai ser impressa
#a2 = Quantidade de pixels a pular para continuar imprimindo caso imprimir uma imagem pequena (Checar script que retorna esse valor)

LoadPEQ:
	lw t1, 0(a0) 		#x(linhas)
	lw t2, 4(a0) 		#y(colunas)
	lw t6, 0(a0)            #armazena o n de linhas da imagem para incrementar em t1 sem ser alterado
	mul t3, t1, t2		#numero total de pixels
	addi a0, a0, 8		#Primeiro pixel
	li t4, 0		#contador
	mv t0, a1  		#endereço inicial de print
	

	
#Já com a imagem carregada, ocorre impressao nesse loop	
IMPRIMEPEQ:
	beq t4, t3, FimIMP	#quando finalizar, pula para a fun??o desejada
	lb t5, 0(a0)
	sb t5, 0(t0)
	addi a0, a0, 1
	addi t0, t0, 1	
	addi t4, t4, 1
	beq t4, t6, PULAPEQ	#quando chegar ao final de uma linha, pula para a seguinte	
	j 	IMPRIMEPEQ
	
	PULAPEQ:
	add t6, t6, t1		#incrementa o numero de pixels impressos pelo n de linhas para o próximo beq ainda pular linha.
	add t0, t0, a2
	j IMPRIMEPEQ
	
FimIMP:
ret