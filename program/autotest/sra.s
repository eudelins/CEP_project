# TAG = sra
	.text

  # le registre x0 contient toujours 0
  # syntaxe: sra rd, rs1, rs2

	sra x31, x0, x0

	addi x2, x0, 31
	sra x31, x0, x2

	lui x1, 0x01000
	addi x2, x0, 31
	sra x31, x1, x2

	sra x31, x1, x0

	addi x1, x0, 2045
	addi x2, x0, 8
	sra x31, x1, x2

	lui x1, 0x0A5C0
	addi x2, x0, 12
	sra x31, x1, x2

  lui x1, 0xFA5C0
  sra x31, x1, x2


	# max_cycle 50
	# pout_start
	# 00000000
	#	00000000
	# 00000000
	# 01000000
	# 00000007
	# 0000A5C0
  # FFFFA5C0
	# pout_end
