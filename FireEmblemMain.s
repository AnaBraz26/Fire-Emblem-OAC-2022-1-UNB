#######################################################
#		    FIRE EMBLEM	 		      #
#		    OAC 2022/1			      #
#		     Grupo 1			      #							
#######################################################
# Por favor, comente o codigo com clareza
.data
.include "./Imagens/lyn.data"
.include "./Imagens/menubase.data"
.include "./Imagens/Logo.data"
.include "./Imagens/LogoWHITE.data"


.text
j start

.include "render.s"



#Teste de impressão
start:

la a0, menubase
li a1, 0xFF000000
jal ImpressaoTelaInteira

la a0, menubase
li a1, 0xFF100000
jal ImpressaoTelaInteira

la a0, LogoWHITE
li a1, 0xFF104396
li a2, 0x2C
jal ImpressaoPequena

li a5, 0xFF200604	#Carrega o endere?o respons¨¢vel pela troca de frame
lw t1, 0(a5)		#Carrega-o em t1 para manipular
xori t1, t1, 0x001 	#Inverte o valor atual
sw t1, 0(a5)		#Armazena de volta em a5 o valor invertido

segue:
la a0, Logo
li a1, 0xFF004396
li a2, 0x2C
jal ImpressaoPequena

li a5, 0xFF200604	#Carrega o endere?o respons¨¢vel pela troca de frame
lw t1, 0(a5)		#Carrega-o em t1 para manipular
xori t1, t1, 0x001 	#Inverte o valor atual
sw t1, 0(a5)		#Armazena de volta em a5 o valor invertido

li a7, 10
ecall









