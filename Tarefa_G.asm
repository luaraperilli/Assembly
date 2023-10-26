.data
.text
.globl main

main:
# L� o valor inserido pelo usu�rio (N)
	li $v0, 5
	syscall
	move $s0, $v0	# Armazena o valor digitado em $s0
	
# Verificar se o valor � menor ou igual a zero
	slt $t0, $s0, $zero	# Se o valor inserido for menor que zero
	bne $t0, $zero, main
	
	beq $s0, $zero, main	# Se o valor inserido for igual a zero
	
	li $s1, 0	# Inicializa o acumuldor da soma com 0
	li $t0, 1	# Inicializa o contador (i) com 1
	
loop:
# Teste de vari�vel (verifica se o contador (i) � menor que N
	slt $t1, $t0, $s0   # Compara se o contador � menor que N
	beq $t1, $zero, fim   # Se for igual a zero, encerra o loop
	
	add $s1, $s1, $t0	# Adiciona o contador � soma
	addi $t0, $t0, 1	# Incrementa o contador
	
	j loop
	
fim: 
	move $a0, $s1	# Passa a soma para $a0
	li $v0, 1	# C�digo da chamada do sistema para imprimir um inteiro
	syscall
	
	li $v0, 10	
	syscall