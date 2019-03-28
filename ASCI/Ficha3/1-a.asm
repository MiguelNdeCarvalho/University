#if (x == y)
#x = 0;
#else
#x = y;
#Do it in assembly

	addi $t0, $zero, 4
	addi $t1, $zero, 4

	beq $t0, $t1 , equal
	nop
	or $t0, $t1, $zero
	j END
	nop

equal:
	or $t0,$zero,$zero
	
END:
