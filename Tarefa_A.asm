.data
msg_positivo: .asciiz "positivo"	# String para imprimir "positivo"
msg_negativo: .asciiz "negativo"	# String para imprimir "negativo"

.text
.globl main

main:
# Ler o valor inteiro inserido pelo usuário
	li $v0, 5	# Código do syscall para ler um inteiro
	syscall
	move $t0, $v0	# Armazenar o valor lido em $t0

# Verificar se o número é positivo ou negativo
	bge $t0, $zero, numero_positivo	# Se o número for maior que zero é positivo
	li $v0, 4	# Código do syscall para imprimir uma string
 	la $a0, msg_negativo	# Endereço da mensagem "negativo"
    	syscall
    	j fim	# Pular para o final

numero_positivo:
    	li $v0, 4	# Código do syscall para imprimir uma string
    	la $a0, msg_positivo	# Endereço da mensagem "positivo"
    	syscall

fim:
    	li $v0, 10	# Código do syscall para sair do programa
  	syscall
