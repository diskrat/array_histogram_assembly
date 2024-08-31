# Definindo segmento de dados
.data
	msg1: .asciiz "Nivel de cinza: Contagem\n"
# Alinhando a memória para words de 4 bytes
.align 2

   # Array com os 168 elementos (words) para contagem de valores
   I: .word 0, 0,  0,  0,  0,  0,  0,  0,  0, 0,  0,  0,  0,  0,  0,  0,  0, 0, 0,  0,  0,  0,  0,  0
      .word 0, 3,  3,  3,  3,  0,  0,  7,  7, 7,  7,  0,  0, 11, 11, 11, 11, 0, 0, 15, 15, 15, 15,  0
      .word 0, 3,  0,  0,  0,  0,  0,  7,  0, 0,  0,  0,  0, 11,  0,  0,  0, 0, 0, 15,  0,  0, 15,  0
      .word 0, 3,  3,  3,  0,  0,  0,  7,  7, 7,  0,  0,  0, 11, 11, 11,  0, 0, 0, 15, 15, 15, 15,  0
      .word 0, 3,  0,  0,  0,  0,  0,  7,  0, 0,  0,  0,  0, 11,  0,  0,  0, 0, 0, 15,  0,  0,  0,  0
      .word 0, 3,  0,  0,  0,  0,  0,  7,  7, 7,  7,  0,  0, 11, 11, 11, 11, 0, 0, 15,  0,  0,  0,  0
      .word 0, 0,  0,  0,  0,  0,  0,  0,  0, 0,  0,  0,  0,  0,  0,  0,  0, 0, 0,  0,  0,  0,  0,  0

    # Alocação de espaço para o vetor de contagem
    # São 64 bytes para armazenar (4 bytes * 16 posições)
    H: .space 64
# Definindo segmento de texto (instruções)
.text
    
    main:
        la		$a1, I  #salva endereco de I
        la		$a2, H  #salva endereco de H
        li	    $t1, 0          #
        sd	    $t1, 0($a2)		# esta linha e acima setam H pra 0 
        move    $t4, $a1        #Salva a o inicio do array I na variavel $t4 que vai ser incrementada ao fim de cada iteracao do loop
        li		$s1, 168        #numero de iteracoes do for loop de varrer o array
        arrayloop:  move $s0, $zero # i = 0
                    arrayfortst:    slt		$t0, $s0, $s1       #$t0 = 1 if $s0 < $s1
                                    beq		$t0, $zero, exit1   # exit if $s0 >= $s1
                                
                                li $t3, 0
                                lw $t5, ($t4)
                                beq $t5,$t3, case0  #checa se conteudo do elemento do array eh 0

                                li $t3, 1
                                lw $t5, ($t4)
                                beq $t5,$t3, case1  #checa se conteudo do elemento do array eh 1

                                li $t3, 2
                                lw $t5, ($t4)
                                beq $t5,$t3, case2  #checa se conteudo do elemento do array eh 2

                                li $t3, 3
                                lw $t5, ($t4)
                                beq $t5,$t3, case3  #checa se conteudo do elemento do array eh 3

                                li $t3, 4
                                lw $t5, ($t4)
                                beq $t5,$t3, case4  #checa se conteudo do elemento do array eh 4

                                li $t3, 5
                                lw $t5, ($t4)
                                beq $t5,$t3, case5  #checa se conteudo do elemento do array eh 5

                                li $t3, 6
                                lw $t5, ($t4)
                                beq $t5,$t3, case6  #checa se conteudo do elemento do array eh 6

                                li $t3, 7
                                lw $t5, ($t4)
                                beq $t5,$t3, case7  #checa se conteudo do elemento do array eh 7

                                li $t3, 8
                                lw $t5, ($t4)
                                beq $t5,$t3, case8  #checa se conteudo do elemento do array eh 8

                                li $t3, 9
                                lw $t5, ($t4)
                                beq $t5,$t3, case9  #checa se conteudo do elemento do array eh 9

                                li $t3, 10
                                lw $t5, ($t4)
                                beq $t5,$t3, case10 #checa se conteudo do elemento do array eh 10

                                li $t3, 11
                                lw $t5, ($t4)
                                beq $t5,$t3, case11 #checa se conteudo do elemento do array eh 11

                                li $t3, 12
                                lw $t5, ($t4)
                                beq $t5,$t3, case12 #checa se conteudo do elemento do array eh 12

                                li $t3, 13
                                lw $t5, ($t4)
                                beq $t5,$t3, case13 #checa se conteudo do elemento do array eh 13

                                li $t3, 14
                                lw $t5, ($t4)
                                beq $t5,$t3, case14 #checa se conteudo do elemento do array eh 14

                                li $t3, 15
                                lw $t5, ($t4)
                                beq $t5,$t3, case15 #checa se conteudo do elemento do array eh 15


                                arrayforend:
                                addi    $t4,$t4, 4          #incremento no endereco
                                addi	$s0, $s0, 1         #i++
                                j arrayfortst               #volta para checar a condicao de parada

                    case0:  lw      $t5, 0($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 0($a2)
                            j		arrayforend				#Le da memoria na posicao soma 1 e escreve no mesmo local da memoria o novo valor

                    case1:  lw      $t5, 4($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 4($a2)
                            j		arrayforend				# Repete o que foi feito no case0 para cada posicao de H

                    case2:  lw      $t5, 8($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 8($a2)
                            j		arrayforend	
                            
                    case3:  lw      $t5, 12($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 12($a2)
                            j		arrayforend				# Repete o que foi feito no case0 para cada posicao de H

                    case4:  lw      $t5, 16($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 16($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H

                    case5:  lw      $t5, 20($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 20($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H

                    case6:  lw      $t5, 24($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 24($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H
                    
                    case7:  lw      $t5, 28($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 28($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H

                    case8:  lw      $t5, 32($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 32($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H
                    
                    case9:  lw      $t5, 36($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 36($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H
                    
                    case10:  lw      $t5, 40($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 40($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H
                    
                    case11:  lw      $t5, 44($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 44($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H
                    
                    case12:  lw      $t5, 48($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 48($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H

                    case13:  lw      $t5, 52($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 52($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H

                    case14:  lw      $t5, 56($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 56($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H

                    case15:  lw      $t5, 60($a2)
                            addi    $t5, $t5, 1
                            sw      $t5, 60($a2)
                            j		arrayforend	            # Repete o que foi feito no case0 para cada posicao de H
                    exit1:






        li      $s1, 16         # numero de iteracoes do for loop de printar
        la      $a0, msg1       
        li      $v0, 4          
        syscall                 # std::cout >> "Nivel de cinza: Contagem\n"

        move      $t2, $a2
        
        printloop:  move    $s0, $zero
                    forprinttst:    slt		$t0, $s0, $s1       #t0 = 1 if $s0 < $s1
                                    beq		$t0, $zero, exit2   #exit if $s0 >= $s1
                                    
                                la      $a0, ($s0)
                                li      $v0, 1
                                syscall         #std::cout >> i

                                li      $a0, 58 
                                li      $v0, 11
                                syscall         #std:: cout >> ':'

                                li      $a0, 32 
                                li      $v0, 11
                                syscall         #std:: cout >> ' '

                                lw      $a0, ($t2)
                                li      $v0, 1
                                syscall         #std:: cout >> a2[t0]

                                li      $a0, 10 
                                li      $v0, 11
                                syscall         #std:: cout >> '\n'
                                
                                addi    $t2,$t2, 4          # move o ponteiro d leitura do array para a proxima palavra
                                addi	$s0, $s0, 1         #i++
                                j       forprinttst
                    exit2:
                                    
                    
        
        li $v0, 10
	    syscall

        
        



