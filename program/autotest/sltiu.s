# TAG = sltiu
	.text

  	# le registre x0 contient toujours 0
  	# syntaxe: sltiu rd, rs1, imm
	# rs1 et rs2 continnent des valeurs codées sur 32 bits


	addi x1, x0, 354
  	sltiu x31, x1, 24  # test si rs1 > rs2

	addi x1, x0, 123
  	sltiu x31, x1, 123  # test si rs1 = rs2

	addi x1, x0, 67
 	sltiu x31, x1, 298  # test si rs1 < rs2

 	sltiu x31, x0, -1  # test si rs1 < rs2 pour une comparaison non signée

	# max_cycle 50
	# pout_start
	# 00000000
  	# 00000000
	# 00000001
	# 00000001
	# pout_end
