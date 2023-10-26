.data
idade: .asciiz "Digite a idade do trabalhador:"
trabalho: .asciiz "Digite o tempo de serviço do trabalhador: "
sim: .asciiz "Sim"
nao: .asciiz "Nao"

.text
.globl main

main:
# Solicitar a idade ao usuário 
	li $v0, 4 		# Carregar o valor 4 para imprimir na tela 
	la $a0, idade 		# Carregar o endereço da string que pergunta a idade do trabalhador
	syscall 			# Fazer a chamada do sistema para imprimir a string
	
# Ler a idade inserida pelo usuário
	li $v0, 5		# Carregar o valor 5 para ler um inteiro 
	syscall 		# Fazer a chamada do sistema para ler a idade
	move $t0, $v0 	# Mover o valor lido para o registrador $t0
	
# Solicitar o tempo de serviço ao usuário
	li $v0, 4
	la $a0, trabalho	# Carregar o endereço da string que pergunta o tempo de serviço
	syscall 			# Fazer a chamada do sistema para imprimir a string 
	
# Ler o tempo de serviço inserido pelo usuário 
	li $v0, 5 			# Carregar o valor 5 para ler um inteiro
	syscall			# Fazer a chamada do sistema para ler o tempo de serviço 
	move $t1, $v0 	# Mover o valor lido para o registrador $t1
	
# Verificar as condições de aposentadoria
	li $t2, 65 		# Carregar o valor 65 em $t2
	li $t3, 35		# Carregar o valor 35 em $t3 
	li $t4, 60		# Carregar o valor 60 em $t4
	li $t5, 30 		# Carregar o valor 30 em $t5

# $t0 = idade e $t1 = tempo de serviço

	bge $t0, $t2, cond1 	# Verificar se a idade é maior que 65 anos
	bge $t1, $t3, cond2	# Verificar se o tempo de serviço é maior ou igual a 35 anos
	j cond3				# Pular para a condição 3
	
cond1: 
	la $a0, sim 	# Carregar o endereço da string "sim" em $a0
	li $v0, 4 		# Carregar o valor 4 para imprimir a resposta na tela
	syscall 		# Fazer a chamada do sistema para imprimir a string
	j end		# Pular para o final
	
cond2:
	la $a0, sim	# Carregar o endereço da string "sim" em $a0
	li $v0, 4		# Carregar o valor 4 para imprimir na tela
	syscall		# Fazer a chamada do sistema para imprimir uma string 
	j end 		# Pular para o final
	
cond3: 
	bge $t0, $t4, cond4 	# Se a idade ($t0) for maior ou igual a 60 anos ($t4) pula para a condição 4
	j nao_aposenta	# Pular para a mensagem "não"
	
cond4:
	bge $t1, $t5, cond5	# Se o tempo de serviço ($t1) for maior ou igual a 30 anos ($t5) pula para a condição 5
	j nao_aposenta	# Pular para a mensagem "não"
	
cond5:
	la $a0, sim	# Carregar o endereço da string "sim" em $a0
	li $v0, 4		# Carregar o valor 4 para imprimir na tela
	syscall		# Fazer a chamada do sistema para imprimir uma string 
	j end		# Pular para o final
	
nao_aposenta:
	la $a0, nao	# Carregar o endereço da string "nao" em $a0
	li $v0, 4		# Carregar o valor 4 para imprimir na tela
	syscall		# Fazer a chamada do sistema para imprimir uma string 

end:
	li $v0, 10		# Carregar o valor 10 para encerrar o programa
	syscall		# Fazer a chamada do sistema para encerrar o programa
