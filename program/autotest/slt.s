# TAG = slt
	.text

  # le registre x0 contient toujours 0
  # syntaxe: slt rd, rs1, rs2
  # rs1 et rs2 sont codés sur 5 bits

  slt x31, 011001, 00110  # test si rs1 > rs2
  slt x31, 101101, 101101  # test si rs1 = rs2
  slt x31, 000101, 111100  # test si rs1 < rs2

	# max_cycle 50
	# pout_start
	# 00000000
  # 00000000
  # 00000001
	# pout_end
