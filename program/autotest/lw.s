# TAG = lw
	.text

  # le registre x0 contient toujours 0
  # syntaxe: lw rd, imm(rs1)
	# opération: rd <- mem[immI + rs1]

	addi x5, x0, 0x01C
	sw x5, 5(x0)
	lw x31, 5(x0)



	# max_cycle 50
	# pout_start
	# 0000001C
	# pout_end
