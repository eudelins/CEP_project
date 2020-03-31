# TAG = srai
	.text

  # le registre x0 contient toujours 0
  # syntaxe: sra rd, rs1, rs2

	srai x31, x0, 0

	addi x1, x0, 2045
	srai x31, x1, 8

	lui x1, 0x0A5C0
	srai x31, x1, 12

  lui x1, 0xFA5C0
  srai x31, x1, 12


	# max_cycle 50
	# pout_start
	# 00000000
	# 00000007
	# 0000A5C0
  # FFFFA5C0
	# pout_end
