# TAG = and
	.text

  # le registre x0 contient toujours 0
  # syntaxe: and rd, rs1, rs2
  # rs1 et rs2 sont codés sur 5 bits


	addi x1, x0, 354
	addi x2, x0, 24
  slt x31, x1, x2  # test de rs1 and rs2
					# les différents bits des registres donnent
					# les 4 configurations possibles des bits (00, 01, 11, 10)


	# max_cycle 50
	# pout_start
	# 00000004
	# pout_end
