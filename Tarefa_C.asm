.data
idade: .asciiz "Digite a idade do trabalhador:"
trabalho: .asciiz "Digite o tempo de servi�o do trabalhador: "
sim: .asciiz "Sim"
nao: .asciiz "Nao"

.text
.globl main

main:
# Solicitar a idade ao usu�rio 
	li $v0, 4 		# Carregar o valor 4 para imprimir na tela 
	la $a0, idade 		# Carregar o endere�o da string que pergunta a idade do trabalhador
	syscall 			# Fazer a chamada do sistema para imprimir a string
	
# Ler a idade inserida pelo usu�rio
	li $v0, 5		# Carregar o valor 5 para ler um inteiro 
	syscall 		# Fazer a chamada do sistema para ler a idade
	move $t0, $v0 	# Mover o valor lido para o registrador $t0
	
# Solicitar o tempo de servi�o ao usu�rio
	li $v0, 4
	la $a0, trabalho	# Carregar o endere�o da string que pergunta o tempo de servi�o
	syscall 			# Fazer a chamada do sistema para imprimir a string 
	
# Ler o tempo de servi�o inserido pelo usu�rio 
	li $v0, 5 			# Carregar o valor 5 para ler um inteiro
	syscall			# Fazer a chamada do sistema para ler o tempo de servi�o 
	move $t1, $v0 	# Mover o valor lido para o registrador $t1
	
# Verificar as condi��es de aposentadoria
	li $t2, 65 		# Carregar o valor 65 em $t2
	li $t3, 35		# Carregar o valor 35 em $t3 
	li $t4, 60		# Carregar o valor 60 em $t4
	li $t5, 30 		# Carregar o valor 30 em $t5

# $t0 = idade e $t1 = tempo de servi�o

	bge $t0, $t2, cond1 	# Verificar se a idade � maior que 65 anos
	bge $t1, $t3, cond2	# Verificar se o tempo de servi�o � maior ou igual a 35 anos
	j cond3				# Pular para a condi��o 3
	
cond1: 
	la $a0, sim 	# Carregar o endere�o da string "sim" em $a0
	li $v0, 4 		# Carregar o valor 4 para imprimir a resposta na tela
	syscall 		# Fazer a chamada do sistema para imprimir a string
	j end		# Pular para o final
	
cond2:
	la $a0, sim	# Carregar o endere�o da string "sim" em $a0
	li $v0, 4		# Carregar o valor 4 para imprimir na tela
	syscall		# Fazer a chamada do sistema para imprimir uma string 
	j end 		# Pular para o final
	
cond3: 
	bge $t0, $t4, cond4 	# Se a idade ($t0) for maior ou igual a 60 anos ($t4) pula para a condi��o 4
	j nao_aposenta	# Pular para a mensagem "n�o"
	
cond4:
	bge $t1, $t5, cond5	# Se o tempo de servi�o ($t1) for maior ou igual a 30 anos ($t5) pula para a condi��o 5
	j nao_aposenta	# Pular para a mensagem "n�o"
	
cond5:
	la $a0, sim	# Carregar o endere�o da string "sim" em $a0
	li $v0, 4		# Carregar o valor 4 para imprimir na tela
	syscall		# Fazer a chamada do sistema para imprimir uma string 
	j end		# Pular para o final
	
nao_aposenta:
	la $a0, nao	# Carregar o endere�o da string "nao" em $a0
	li $v0, 4		# Carregar o valor 4 para imprimir na tela
	syscall		# Fazer a chamada do sistema para imprimir uma string 

end:
	li $v0, 10		# Carregar o valor 10 para encerrar o programa
	syscall		# Fazer a chamada do sistema para encerrar o programa
