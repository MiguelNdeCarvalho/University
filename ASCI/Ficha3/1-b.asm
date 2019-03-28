#if (x < 0)
#y = -x;
#else
#y = x;
# $t0= x
# $t1= y
#Do it in assembly

	#addi $t0, $zero, 4
	#addi $t1, $zero, 4
	addi $t3, $zero, 1
	
	slt $t2 , $t0, $zero
	beq $t2,$zero, ELSE
	nop
	
	sub $t1, $zero, $t0
	j END
	nop
		
ELSE: add $t1, $t0, $zero
END:
