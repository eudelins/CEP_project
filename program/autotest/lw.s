# TAG = lw
	.text

  # le registre x0 contient toujours 0
  # syntaxe: lw rd, imm(rs1)
  # opération: rd <- mem[rs1 + immI]

  addi x1, x0, 50
  sw x0, 0(x1)
  lw x31, 0(x1)



	# max_cycle 50
	# pout_start
	# 00000000
	# pout_end
