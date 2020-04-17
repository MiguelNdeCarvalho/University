############################################################################################################
# Redução de Ruído                                                                                         #
# Autores: Miguel de Carvalho & Ricardo Oliveira                                                           #
############################################################################################################

.data

MENU: .asciiz "Remoção de Ruído\n Escolha uma das opções seguintes:\n 1 - Media \n 2 - Mediana \n 3 - Sair\n"
IMAGE_A: .asciiz "/home/ricardo/Desktop/ASCFinal/lena.gray"
IMAGE_B: .asciiz "/home/ricardo/Desktop/ASCFinal/Output.gray"
BUFFER_A: .space 262144  # Alocamento de espaço para o Buffer A
BUFFER_B: .space 262144  # Alocamento de espaço para o Buffer B
BUFFER_C: .space 9  # Alocamento de espaço para o Buffer C (auxiliar para a mediana)

############################################################################################################
############################################################################################################

.text

main:
	la $a0, MENU
	li $v0, 4
	syscall  # Mostra o menu ao utilizador

	li $v0, 5
	syscall  # Le a opcao do utilizador

	beq $v0, 1, MEDIA  # Se o utilizador escolher a opcao 1 vai utilzar a media
	nop

	beq $v0, 2, MEDIANA  # Se o utilizador escolher a opcao 2 vai utilzar a mediana
	nop

	beq $v0, 3, EXIT  # Se o utilizador escolher a opcao 3 vai sair do programa
	nop

	j main
	nop

############################################################################################################
#						Media						           #
############################################################################################################
MEDIA:
	jal READ_GRAY_IMAGE  # Abre a imagem em .rgb
	nop

	jal MEAN_FILTER  # Executa a função da media
	nop

	jal WRITE_GRAY_IMAGE  # Volta a escrever a imagem em .gray
	nop

	jal CLOSE_GRAY_IMAGE  # Fecha a imagem
	nop

	j main  # Volta para o menu (main)
	nop

############################################################################################################
#						Mediana						           #
############################################################################################################
MEDIANA:
	jal READ_GRAY_IMAGE  # Abre a imagem em .rgb
	nop

	jal MEDIAN_FILTER  # Executa a função da mediana
	nop

	jal WRITE_GRAY_IMAGE  # Volta a escrever a imagem em .gray
	nop

	jal CLOSE_GRAY_IMAGE  # Fecha a imagem
	nop

	j main  # Volta para o menu (main)
	nop

############################################################################################################
#						Exit						           #
############################################################################################################
EXIT:
	li $v0, 10
	syscall

############################################################################################################

READ_GRAY_IMAGE:

	la $a0, IMAGE_A  # String que contem a localizacao do ficheiro
	li $a1, 0
	li $a2, 0  # So le
	li $v0, 13  # Abre o ficheiro
	syscall
	
	move $a0, $v0
	la $a1, BUFFER_A
	li $a2, 262144
	li $v0, 14
	syscall  # Vai criar o buffer para a imagem

	jr $ra  # Volta para a Media, onde a funcao e chamada
	nop

############################################################################################################

WRITE_GRAY_IMAGE:

	la $a0, IMAGE_B  # String que contem a localicazacao do ficheiro que vamos escrever
	li $a1, 1
	li $a2, 0
	li $v0, 13  # Escreve o ficheiro, caso nao exista cria-o
	syscall

	move $a0, $v0
	la $a1, BUFFER_B
	li $a2, 262144
	li $v0, 15
	syscall  # Vai criar o buffer para a imagem

	jr $ra  # Volta para a Media, onde a funcao e chamada
	nop

############################################################################################################
#Vai fechar as duas Imagens
CLOSE_GRAY_IMAGE:
	la $a0, IMAGE_A
	li $v0, 16
	syscall

	la $a0, IMAGE_B
	li $v0, 16
	syscall

	jr $ra
	nop

############################################################################################################
MEAN_FILTER:
	addi $sp, $sp, -20
	sw $s0, 0($sp)  # Guarda na primeira posição da pilha o $s0
	sw $s1, 4($sp)  # Guarda na segunda posição da pilha o $s1
	sw $s2, 8($sp)  # Guarda na terceira posição da pilha o $s2
	sw $s3, 12($sp)  # Guarda na quarta posição da pilha o $s3
	sw $s4, 16($sp)  # Guarda na quinta posição da pilha o $s4
	
	la $s0, BUFFER_A  # Guarda o primeiro endereço do Buffer A

	la $s1, BUFFER_B  # Guarda o primeiro endereço do Buffer B
	
	li $s2, 512  # Define $s2 = 512 (sizeLinha)
	
	li $s3, 0  # Define $s3 = 0 (i)
	
	li $s4, 9  # Define $s4 = 9 


	FOR:
		bgt $s3, $a2, ENDFOR  # Acaba de percorrer o Buffer quando i > size
		nop
	
		move $t0, $s3  # Guarda o valor de i no registo $t0
		
		addi $t1, $t0, 1  # i+1
		addi $t2, $t0, -1  # i-1
		
		add $t3, $t0, $s2  # i+sizeLinha
		addi $t4, $t3, 1  # i+sizeLinha+1
		addi $t5, $t3, -1  # i+sizeLinha-1
		
		sub $t6, $t0, $s2  # i-sizeLinha
		addi $t7, $t6, 1  # i-sizeLinha+1
		addi $t8, $t6, -1  # i-sizeLinha-1
		
		
		add $t0, $t0, $s0  # Desloca o BUFFER_A i posições
		lbu $t0, 0($t0)  # Guarda o valor que está no endereço $t0 no registo $t0
		
		add $t1, $t1, $s0  # Desloca o BUFFER_A i posições
		lbu $t1, 0($t1)  # Guarda o valor que está no endereço $t1 no registo $t1
		
		add $t2, $t2, $s0  # Desloca o BUFFER_A i posições
		lbu $t2, 0($t2)  # Guarda o valor que está no endereço $t2 no registo $t2
		
		add $t3, $t3, $s0  # Desloca o BUFFER_A i posições
		lbu $t3, 0($t3)  # Guarda o valor que está no endereço $t3 no registo $t3
		
		add $t4, $t4, $s0  # Desloca o BUFFER_A i posições
		lbu $t4, 0($t4)  # Guarda o valor que está no endereço $t4 no registo $t4
		
		add $t5, $t5, $s0  # Desloca o BUFFER_A i posições
		lbu $t5, 0($t5)  # Guarda o valor que está no endereço $t5 no registo $t5
		
		add $t6, $t6, $s0  # Desloca o BUFFER_A i posições
		lbu $t6, 0($t6)  # Guarda o valor que está no endereço $t6 no registo $t6
	
		add $t7, $t7, $s0  # Desloca o BUFFER_A i posições
		lbu $t7, 0($t7)  # Guarda o valor que está no endereço $t7 no registo $t7
		
		add $t8, $t8, $s0  # Desloca o BUFFER_A i posições
		lbu $t8, 0($t8)  # Guarda o valor que está no endereço $t8 no registo $t8
		
		
		add $t0, $t0, $t1  # Soma = $t0 + $t1
		add $t0, $t0, $t2  # Soma = Soma + $t2
		add $t0, $t0, $t3  # Soma = Soma + $t3
		add $t0, $t0, $t4  # Soma = Soma + $t4
		add $t0, $t0, $t5  # Soma = Soma + $t5
		add $t0, $t0, $t6  # Soma = Soma + $t6
		add $t0, $t0, $t7  # Soma = Soma + $t7
		add $t0, $t0, $t8  # Soma = Soma + $t8
		
		div $t0, $s4  # Mean = Soma / 9
		mflo $t0  # Guarda o Mean no $t0
		
		add $t1, $s3, $s1
		sb $t0, 0($t1)
		
		addi $s3, $s3, 1
		j FOR
		nop
		
		
	ENDFOR:
		lw $s0, 0($sp)  # Remove do $sp o valor $s0
		lw $s1, 4($sp)  # Remove do $sp o valor $s1
		lw $s2, 8($sp)  # Remove do $sp o valor $s2
		lw $s3, 12($sp)  # Remove do $sp o valor $s3
		lw $s4, 16($sp)  # Remove do $sp o valor $s4
		
		addi $sp, $sp, 20  # Remove todo o espaço alocado no $sp
		
		jr $ra
		nop


############################################################################################################
#						Mediana						           #
############################################################################################################
MEDIAN_FILTER:
	addi $sp, $sp, -20
	sw $s0, 0($sp)  # Guarda na primeira posição da pilha o $s0
	sw $s1, 4($sp)  # Guarda na segunda posição da pilha o $s1
	sw $s2, 8($sp)  # Guarda na terceira posição da pilha o $s2
	sw $s3, 12($sp)  # Guarda na quarta posição da pilha o $s3
	sw $s4, 16($sp)  # Guarda na quinta posição da pilha o $s4
	
	la $s0, BUFFER_A  # Guarda o primeiro endereço do Buffer A

	la $s1, BUFFER_B  # Guarda o primeiro endereço do Buffer B
	
	la $s2, BUFFER_C  # Guarda o primeiro endereço do Buffer B
	
	li $s3, 512  # Define $s2 = 512 (sizeLinha)
	
	li $s4, 0  # Define $s4 = 0 (i)

	FOR_MEDIAN:
		bgt $s4, $a2, END_MEDIAN  # Acaba de percorrer o Buffer quando i > size
		nop
	
		move $t0, $s4  # Guarda o valor de i no registo $t0
		
		addi $t1, $t0, 1  # i+1
		addi $t2, $t0, -1  # i-1
		
		add $t3, $t0, $s3  # i + sizeLinha
		addi $t4, $t3, 1  # i + sizeLinha + 1
		addi $t5, $t3, -1  # i + sizeLinha -1
		
		sub $t6, $t0, $s3  # i - sizeLinha
		addi $t7, $t6, 1  # i - sizeLinha + 1
		addi $t8, $t6, -1  # i - sizeLinha - 1
		
		
		add $t0, $t0, $s0  # Desloca o BUFFER_A i posições
		lbu $t0, 0($t0)  # Guarda o valor que está no endereço $t0 no registo $t0
		
		add $t1, $t1, $s0  # Desloca o BUFFER_A i posições
		lbu $t1, 0($t1)  # Guarda o valor que está no endereço $t1 no registo $t1
		
		add $t2, $t2, $s0  # Desloca o BUFFER_A i posições
		lbu $t2, 0($t2)  # Guarda o valor que está no endereço $t2 no registo $t2
		
		add $t3, $t3, $s0  # Desloca o BUFFER_A i posições
		lbu $t3, 0($t3)  # Guarda o valor que está no endereço $t3 no registo $t3
		
		add $t4, $t4, $s0  # Desloca o BUFFER_A i posições
		lbu $t4, 0($t4)  # Guarda o valor que está no endereço $t4 no registo $t4
		
		add $t5, $t5, $s0  # Desloca o BUFFER_A i posições
		lbu $t5, 0($t5)  # Guarda o valor que está no endereço $t5 no registo $t5
		
		add $t6, $t6, $s0  # Desloca o BUFFER_A i posições
		lbu $t6, 0($t6)  # Guarda o valor que está no endereço $t6 no registo $t6
	
		add $t7, $t7, $s0  # Desloca o BUFFER_A i posições
		lbu $t7, 0($t7)  # Guarda o valor que está no endereço $t7 no registo $t7
		
		add $t8, $t8, $s0  # Desloca o BUFFER_A i posições
		lbu $t8, 0($t8)  # Guarda o valor que está no endereço $t8 no registo $t8
		
		
		sb $t8, 0($s2)  # Guarda o valor da 1ªL, 1ªP do BUFFER_C 
		sb $t6, 1($s2)  # Guarda o valor da 1ªL, 2ªP do BUFFER_C
		sb $t7, 2($s2)  # Guarda o valor da 1ªL, 3ªP do BUFFER_C
		sb $t2, 3($s2)  # Guarda o valor da 2ªL, 1ªP do BUFFER_C
		sb $t0, 4($s2)  # Guarda o valor da 2ªL, 2ªP do BUFFER_C
		sb $t1, 5($s2)  # Guarda o valor da 2ªL, 3ªP do BUFFER_C
		sb $t5, 6($s2)  # Guarda o valor da 3ªL, 1ªP do BUFFER_C
		sb $t3, 7($s2)  # Guarda o valor da 3ªL, 2ªP do BUFFER_C
		sb $t4, 8($s2)  # Guarda o valor da 3ªL, 3ªP do BUFFER_C
		
	#############################
	#        Comparações        #
	#############################
	COMPARE_0:
	#Comparar o valor do registo $t8 com os outros registos
		bgt $t8, $t6, TRADE8_1 
		nop
		
		bgt $t8, $t7, TRADE8_2
		nop
		
		bgt $t8, $t2, TRADE8_3
		nop
		
		bgt $t8, $t0, TRADE8_4
		nop
		
		bgt $t8, $t1, TRADE8_5
		nop
		
		bgt $t8, $t5, TRADE8_6
		nop
		
		bgt $t8, $t3, TRADE8_7
		nop
		
		bgt $t8, $t4, TRADE8_8
		nop
		
	COMPARE_1:
		#Comparar o registo $t6 com os outros registos
		bgt $t6, $t7, TRADE6_1
		nop
		
		bgt $t6, $t2, TRADE6_2
		nop
		
		bgt $t6, $t0, TRADE6_3
		nop
		
		bgt $t6, $t1, TRADE6_4
		nop
		
		bgt $t6, $t5, TRADE6_5
		nop
		
		bgt $t6, $t3, TRADE6_6
		nop
		
		bgt $t6, $t4, TRADE6_7
		nop
		
	COMPARE_2:
		#Comparar o registo $t7 com os outros registos
		bgt $t7, $t2, TRADE7_1
		nop
		
		bgt $t7, $t0, TRADE7_2
		nop
		
		bgt $t7, $t1, TRADE7_3
		nop
		
		bgt $t7, $t5, TRADE7_4
		nop
		
		bgt $t7, $t3, TRADE7_5
		nop
		
		bgt $t7, $t4, TRADE7_6
		nop
		
	COMPARE_3:
		#Comparar o registo $t2 com os outros registos
		bgt $t2, $t0, TRADE2_1
		nop
		
		bgt $t2, $t1, TRADE2_2
		nop
		
		bgt $t2, $t5, TRADE2_3
		nop
		
		bgt $t2, $t3, TRADE2_4
		nop
		
		bgt $t2, $t4, TRADE2_5
		nop
		
	COMPARE_4:
		#Comparar o registo $t0 com os outros registos
		bgt $t0, $t1, TRADE0_1
		nop
		
		bgt $t0, $t5, TRADE0_2
		nop
		
		bgt $t0, $t3, TRADE0_3
		nop
		
		bgt $t0, $t4, TRADE0_4
		nop
		
	COMPARE_5:
		#Comparar o registos $t1 com os outros registos
		bgt $t1, $t5, TRADE1_1
		nop
		
		bgt $t1, $t3, TRADE1_2
		nop
		
		bgt $t1, $t4, TRADE1_3
		nop
		
	COMPARE_6:
		#Comparar o registo $t5 com os outros registos
		bgt $t5, $t3, TRADE5_1
		nop
		
		bgt $t5, $t4, TRADE5_2
		nop
		
	COMPARE_7:
		#Comparar o registo $t3 com os outros registos 
		bgt $t3, $t4, TRADE3_1
		nop 
		
		j ENDFOR_MEDIAN
		nop
		
		#############################
		#   Trocas (Comparações)    #
		#############################
		TRADE8_1:
		xor $t8, $t8, $t6
		xor $t6, $t6, $t8
		xor $t8, $t8, $t6
		sb $t8, 1($s2)
		sb $t6, 0($s2)
		j COMPARE_0
		nop
		
		TRADE8_2:
		xor $t8, $t8, $t7
		xor $t7, $t7, $t8
		xor $t8, $t8, $t7
		sb $t8, 2($s2)
		sb $t7, 0($s2)
		j COMPARE_0
		nop
		
		TRADE8_3:
		xor $t8, $t8, $t2
		xor $t2, $t2, $t8
		xor $t8, $t8, $t2
		sb $t8, 3($s2)
		sb $t2, 0($s2)
		j COMPARE_0
		nop
		
		TRADE8_4:
		xor $t8, $t8, $t0
		xor $t0, $t0, $t8
		xor $t8, $t8, $t0
		sb $t8, 4($s2)
		sb $t0, 0($s2)
		j COMPARE_0
		nop
		
		TRADE8_5:
		xor $t8, $t8, $t1
		xor $t1, $t1, $t8
		xor $t8, $t8, $t1
		sb $t8, 5($s2)
		sb $t1, 0($s2)
		j COMPARE_0
		nop
		
		TRADE8_6:
		xor $t8, $t8, $t5
		xor $t5, $t5, $t8
		xor $t8, $t8, $t5
		sb $t8, 6($s2)
		sb $t5, 0($s2)
		j COMPARE_0
		nop
		
		TRADE8_7:
		xor $t8, $t8, $t3
		xor $t3, $t3, $t8
		xor $t8, $t8, $t3
		sb $t8, 7($s2)
		sb $t3, 0($s2)
		j COMPARE_0
		nop
		
		TRADE8_8:
		xor $t8, $t8, $t4
		xor $t4, $t4, $t8
		xor $t8, $t8, $t4
		sb $t8, 8($s2)
		sb $t4, 0($s2)
		j COMPARE_0
		nop
		
		#############################
		
		TRADE6_1:
		xor $t6, $t6, $t7
		xor $t7, $t7, $t6
		xor $t6, $t6, $t7
		sb $t6, 2($s2)
		sb $t7, 1($s2)
		j COMPARE_1
		nop
		
		TRADE6_2:
		xor $t6, $t6, $t2
		xor $t2, $t2, $t6
		xor $t6, $t6, $t2
		sb $t6, 3($s2)
		sb $t2, 1($s2)
		j COMPARE_1
		nop
		
		TRADE6_3:
		xor $t6, $t6, $t0
		xor $t0, $t0, $t6
		xor $t6, $t6, $t0
		sb $t6, 4($s2)
		sb $t0, 1($s2)
		j COMPARE_1
		nop
		
		TRADE6_4:
		xor $t6, $t6, $t1
		xor $t1, $t1, $t6
		xor $t6, $t6, $t1
		sb $t6, 5($s2)
		sb $t1, 1($s2)
		j COMPARE_1
		nop
		
		TRADE6_5:
		xor $t6, $t6, $t5
		xor $t5, $t5, $t6
		xor $t6, $t6, $t5
		sb $t6, 6($s2)
		sb $t5, 1($s2)
		j COMPARE_1
		nop
		
		TRADE6_6:
		xor $t6, $t6, $t3
		xor $t3, $t3, $t6
		xor $t6, $t6, $t3
		sb $t6, 7($s2)
		sb $t3, 1($s2)
		j COMPARE_1
		nop
		
		TRADE6_7:
		xor $t6, $t6, $t4
		xor $t4, $t4, $t6
		xor $t6, $t6, $t4
		sb $t7, 8($s2)
		sb $t4, 1($s2)
		j COMPARE_1
		nop
		
		#############################
		
		TRADE7_1:
		xor $t7, $t7, $t2
		xor $t2, $t2, $t7
		xor $t7, $t7, $t2
		sb $t7, 3($s2)
		sb $t2, 2($s2)
		j COMPARE_2
		nop
		
		TRADE7_2:
		xor $t7, $t7, $t0
		xor $t0, $t0, $t7
		xor $t7, $t7, $t0
		sb $t7, 4($s2)
		sb $t0, 2($s2)
		j COMPARE_2
		nop
		
		TRADE7_3:
		xor $t7, $t7, $t1
		xor $t1, $t1, $t7
		xor $t7, $t7, $t1
		sb $t7, 5($s2)
		sb $t1, 2($s2)
		j COMPARE_2
		nop
		
		TRADE7_4:
		xor $t7, $t7, $t5
		xor $t5, $t5, $t7
		xor $t7, $t7, $t5
		sb $t7, 6($s2)
		sb $t5, 2($s2)
		j COMPARE_2
		nop
		
		TRADE7_5:
		xor $t7, $t7, $t3
		xor $t3, $t3, $t7
		xor $t7, $t7, $t3
		sb $t7, 7($s2)
		sb $t3, 2($s2)
		j COMPARE_2
		nop
		
		TRADE7_6:
		xor $t7, $t7, $t4
		xor $t4, $t4, $t7
		xor $t7, $t7, $t4
		sb $t7, 8($s2)
		sb $t4, 2($s2)
		j COMPARE_2
		nop
		
		#############################
		
		TRADE2_1:
		xor $t2, $t2, $t0
		xor $t0, $t0, $t2
		xor $t2, $t2, $t0
		sb $t2, 4($s2)
		sb $t0, 3($s2)
		j COMPARE_3
		nop
		
		TRADE2_2:
		xor $t2, $t2, $t1
		xor $t1, $t1, $t2
		xor $t2, $t2, $t1
		sb $t2, 5($s2)
		sb $t1, 3($s2)
		j COMPARE_3
		nop
		
		TRADE2_3:
		xor $t2, $t2, $t5
		xor $t5, $t5, $t2
		xor $t2, $t2, $t5
		sb $t2, 6($s2)
		sb $t5, 3($s2)
		j COMPARE_3
		nop
		
		TRADE2_4:
		xor $t2, $t2, $t3
		xor $t3, $t3, $t2
		xor $t2, $t2, $t3
		sb $t2, 7($s2)
		sb $t3, 3($s2)
		j COMPARE_3
		nop
		
		TRADE2_5:
		xor $t2, $t2, $t4
		xor $t4, $t4, $t2
		xor $t2, $t2, $t4
		sb $t2, 8($s2)
		sb $t4, 3($s2)
		j COMPARE_3
		nop
		
		#############################
		
		TRADE0_1:
		xor $t0, $t0, $t1
		xor $t1, $t1, $t0
		xor $t0, $t0, $t1
		sb $t0, 5($s2)
		sb $t1, 4($s2)
		j COMPARE_4
		nop
		
		TRADE0_2:
		xor $t0, $t0, $t5
		xor $t5, $t5, $t0
		xor $t0, $t0, $t5
		sb $t0, 6($s2)
		sb $t5, 4($s2)
		j COMPARE_4
		nop
		
		TRADE0_3:
		xor $t0, $t0, $t3
		xor $t3, $t3, $t0
		xor $t0, $t0, $t3
		sb $t0, 7($s2)
		sb $t3, 4($s2)
		j COMPARE_4
		nop
		
		TRADE0_4:
		xor $t0, $t0, $t4
		xor $t4, $t4, $t0
		xor $t0, $t0, $t4
		sb $t0, 8($s2)
		sb $t4, 4($s2)
		j COMPARE_4
		nop
		
		#############################
		
		TRADE1_1:
		xor $t1, $t1, $t5
		xor $t5, $t5, $t1
		xor $t1, $t1, $t5
		sb $t1, 6($s2)
		sb $t5, 5($s2)
		j COMPARE_5
		nop
		
		TRADE1_2:
		xor $t1, $t1, $t3
		xor $t3, $t3, $t1
		xor $t1, $t1, $t3
		sb $t1, 7($s2)
		sb $t3, 5($s2)
		j COMPARE_5
		nop
		
		TRADE1_3:
		xor $t1, $t1, $t4
		xor $t4, $t4, $t1
		xor $t1, $t1, $t4
		sb $t1, 8($s2)
		sb $t4, 5($s2)
		j COMPARE_5
		nop
		
		#############################
		
		TRADE5_1:
		xor $t5, $t5, $t3
		xor $t3, $t3, $t5
		xor $t5, $t5, $t3
		sb $t5, 7($s2)
		sb $t3, 6($s2)
		j COMPARE_6
		nop
		
		TRADE5_2:
		xor $t5, $t5, $t4
		xor $t4, $t4, $t5
		xor $t5, $t5, $t4
		sb $t5, 8($s2)
		sb $t4, 6($s2)
		j COMPARE_6
		nop
		
		#############################
		
		TRADE3_1:
		xor $t3, $t3, $t4
		xor $t4, $t4, $t3
		xor $t3, $t3, $t4
		sb $t3, 8($s2)
		sb $t4, 7($s2)
		j COMPARE_7
		nop
	
		#############################
	ENDFOR_MEDIAN:
		lbu $t0, 4($s2)  # Guarda no $t0 o valor do centro do BUFFER_C
		add $t1, $s4, $s1  # Soma i posições ao BUFFER_B
		sb $t0, 0($t1)  # Guarda no endereço do $t1 o valor do registo $t0
		addi $s4, $s4, 1  # i++
		j FOR_MEDIAN     # Salta para o FOR_MEDIAN
		nop	

	
	END_MEDIAN:
		lw $s0, 0($sp)  # Remove do $sp o valor $s0
		lw $s1, 4($sp)  # Remove do $sp o valor $s1
		lw $s2, 8($sp)  # Remove do $sp o valor $s2
		lw $s3, 12($sp)  # Remove do $sp o valor $s3
		lw $s4, 16($sp)  # Remove do $sp o valor $s4
		
		addi $sp, $sp, 20  # Remove todo o espaço alocado no $sp
		
		jr $ra
		nop

