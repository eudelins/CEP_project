# TAG = beq
	.text

  # le registre x0 contient toujours 0
  # syntaxe: beq rs1, rs2, label
  # opération: rs1 = rs2 => pc <- pc + cst


	addi x1, x0, 1
  beq x1, x0, 0
  auipc x31, 0

	# max_cycle 50
	# pout_start
	# 00001004
	# pout_end
