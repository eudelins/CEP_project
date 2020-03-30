# TAG = lw
	.text

  # le registre x0 contient toujours 0
  # syntaxe: lw rd, imm(rs1)
	# opération: rd <- mem[immI + rs1]

	add x0, x0, x0
	lui x5, 1
	lw x31, 0(x5)



	# max_cycle 50
	# pout_start
	# 00000033
	# pout_end
