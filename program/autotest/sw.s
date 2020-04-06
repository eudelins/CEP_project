# TAG = sw
	.data

.word 50

	.text

  # le registre x0 contient toujours 0
  # syntaxe: sw rs2, immS(rs1)
  # opération: mem[cst + rs1] <- rs2

	addi x1, x0, 50
  sw x0, 0(x1)
  lw x31, 0(x1)
	lui x2, 0x0BCDE
	sw x2, 0(x1)
	lw x31, 0(x1)


	# max_cycle 50
	# pout_start
	# 00000000
	# 0BCDE000
	# pout_end
