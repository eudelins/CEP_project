# TAG = sltu
	.text

  	# le registre x0 contient toujours 0
  	# syntaxe: sltu rd, rs1, rs2
	# rs1 et rs2 continnent des valeurs codées sur 32 bits


	addi x1, x0, 354
	addi x2, x0, 24
  	sltu x31, x1, x2  # test si rs1 > rs2

	addi x1, x0, 123
	addi x2, x0, 123
  	sltu x31, x1, x2  # test si rs1 = rs2

	addi x1, x0, 67
	addi x2, x0, 298
 	sltu x31, x1, x2  # test si rs1 < rs2

	addi x2, x0, -1
 	sltu x31, x2, x0  # test si rs1 >= rs2 pour une comparaison non signée

	# max_cycle 50
	# pout_start
	# 00000000
  	# 00000000
	# 00000001
	# 00000000
	# pout_end
