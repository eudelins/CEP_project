# TAG = or
	.text

  # le registre x0 contient toujours 0
  # syntaxe: and rd, rs1, rs2
  # rs1 et rs2 continnent des valeurs codées sur 32 bits


	addi x1, x0, 12
	addi x2, x0, 5
  or x31, x1, x2  # test de rs1 and rs2
					# les différents bits des registres donnent
					# les 4 configurations possibles des bits (00, 01, 11, 10)


	# max_cycle 50
	# pout_start
	# 0000000D
	# pout_end
