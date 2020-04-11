# TAG = slti
	.text

  	# le registre x0 contient toujours 0
  	# syntaxe: slti rd, rs1, imm
	# rs1 et rs2 continnent des valeurs codées sur 32 bits


	addi x1, x0, 354
  	slti x31, x1, -24  # test si rs1 > rs2

	addi x1, x0, 123
  	slti x31, x1, 123  # test si rs1 = rs2

	addi x1, x0, 67
 	slt x31, x1, 298  # test si rs1 < rs2

	# max_cycle 50
	# pout_start
	# 00000000
  	# 00000000
	# 00000001
	# pout_end
