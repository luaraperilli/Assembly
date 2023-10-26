.data
msg_positivo: .asciiz "positivo"	# String para imprimir "positivo"
msg_negativo: .asciiz "negativo"	# String para imprimir "negativo"

.text
.globl main

main:
# Ler o valor inteiro inserido pelo usu�rio
	li $v0, 5	# C�digo do syscall para ler um inteiro
	syscall
	move $t0, $v0	# Armazenar o valor lido em $t0

# Verificar se o n�mero � positivo ou negativo
	bge $t0, $zero, numero_positivo	# Se o n�mero for maior que zero � positivo
	li $v0, 4	# C�digo do syscall para imprimir uma string
 	la $a0, msg_negativo	# Endere�o da mensagem "negativo"
    	syscall
    	j fim	# Pular para o final

numero_positivo:
    	li $v0, 4	# C�digo do syscall para imprimir uma string
    	la $a0, msg_positivo	# Endere�o da mensagem "positivo"
    	syscall

fim:
    	li $v0, 10	# C�digo do syscall para sair do programa
  	syscall
