.data
equi: .asciiz "Equilatero"
iso: .asciiz "Isosceles"
esc: .asciiz "Escaleno"

.text
.globl main

main:
# Ler o primeiro lado do tri�ngulo
	li $v0, 5	# Carregar o valor 5 em $v0 para ler um inteiro
	syscall	# Realizar a syscall para ler o primeiro lado do tri�ngulo
	move $t0, $v0	# Mover o valor lido para o registrador $t0
	
# Ler o segundo lado do tri�ngulo
	li $v0, 5
	syscall	# Realizar a syscall para ler o segundo lado do tri�ngulo 
	move $t1, $v0	# Mover o valor lido para o registrador $t1
	
# Ler o terceiro lado do tri�ngulo
	li $v0, 5
	syscall	# Realizar a syscall para ler o terceiro lado do tri�ngulo
	move $t2, $v0	# Mover o valor lido para o registrador $t2
	
# Verificar o tipo de tri�ngulo 
	bne $t0, $t1, verifica_tipo	# Se o lado 1 for diferente do lado 2, pular para verifica_tipo
	bne $t1, $t2, verifica_tipo	# Se o lado 2 for diferente do lado 3, pular para verifica_tipo
	j equilatero
	
equilatero:
# Imprimir o tipo de tri�ngulo
	li $v0, 4
	la $a0, equi	# Carregar o endere�o da mensagem equil�tero em $a0
	syscall	# Realizar a syscall para imprimir a mensagem
	j fim
	
verifica_tipo: 
# Verificar se o tri�ngulo � is�sceles
	beq $t0, $t1, triangulo_isosceles	# Se o lado 1 for igual ao lado 2 o tri�ngulo � is�sceles
	beq $t0, $t2, triangulo_isosceles	# Se o lado 1 for igual ao lado 3 o tri�ngulo � is�sceles
	beq $t1, $t2, triangulo_isosceles	# Se o lado 2 for igual ao lado 3 o tri�ngulo � is�sceles
	j triangulo_escaleno 
	
triangulo_isosceles: 
# Imprimir o tipo de tri�ngulo
	li $v0, 4
	la $a0, iso	# Carregar o endere�o da mensagem is�sceles em $a0
	syscall	# Realizar a syscall para imprimir a mensagem
	j fim
	
triangulo_escaleno:
# Imprimir o tipo de tri�ngulo
	li $v0, 4
	la $a0, esc	# Carregar o endere�o da mensagem escaleno em $a0
	syscall	# Realizar a syscall para imprimir a mensagem

fim: 
	li $v0, 10		# Carregar o valor 10 para encerrar o programa
	syscall		# Fazer a chamada do sistema para encerrar o programa
