# TAG = slt
	.text

  # le registre x0 contient toujours 0
  # syntaxe: slt rd, rs1, rs2
  # rs1 et rs2 sont codés sur 5 bits


	addi x1, x0, 354
	addi x2, x0, 24
  slt x31, x1, x2  # test si rs1 > rs2

	addi x1, x0, 123
	addi x2, x0, 123
  slt x31, x1, x2  # test si rs1 = rs2

	addi x1, x0, 67
	addi x2, x0, 298
  slt x31, x1, x2  # test si rs1 < rs2

	# max_cycle 50
	# pout_start
	# 00000000
  # 00000000
	# 00000001
	# pout_end
