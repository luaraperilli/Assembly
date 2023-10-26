.data
.text
.globl main

main:
# L� o valor inserido pelo usu�rio (N)
	li $v0, 5
	syscall
	move $s0, $v0	# Armazena o valor digitado em $s0
	
	li $t1, 1	# Inicializa o resultado com 1

loop:
# Teste de vari�vel
	beq $s0, $zero, fim

	mul $t1, $t1, $s0	# Multiplica o resultado pelo valor atual do contador
	
	addi $s0, $s0, -1	# Subtrai 1 do contador
	j loop	# Salta para o in�cio do loop

fim:
	move $a0, $t1	# Move o resultado para $a0
	li $v0, 1	# C�digo da chamada do sistema para imprimir um inteiro
	syscall
	
	li $v0, 10	
	syscall