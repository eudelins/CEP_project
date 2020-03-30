# TAG = andi
	.text

  # le registre x0 contient toujours 0
  # syntaxe: andi rd, rs1, imm


  andi x31, x0, 112
  addi x1, x0, Ox111
  andi x31, x1, 0x111


	# max_cycle 50
	# pout_start
	# 00000000
  # 00000111
	# pout_end
