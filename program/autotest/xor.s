# TAG = xor
	.text

  # le registre x0 contient toujours 0
  # syntaxe: xor rd, rs1, rs2


  xor x31, x0, x0
  addi x1, x0, 0xf0f
  addi x2, x0, 0x333


	# max_cycle 50
	# pout_start
	# 00000000
  # 00000C3C
	# pout_end
