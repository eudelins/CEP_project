# TAG = xori
	.text

  # le registre x0 contient toujours 0
  # syntaxe: xori rd, rs1, imm

  xori x31, x0, 0
  addi x1, x0, 0xf0f
  xori x31, x1, 0x333


	# max_cycle 50
	# pout_start
	# 00000000
  # 00000C3C
	# pout_end
