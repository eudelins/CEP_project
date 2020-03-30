# TAG = beq
	.text

  # le registre x0 contient toujours 0
  # syntaxe: beq rs1, rs2, label
  # opération: rs1 = rs2 => pc <- pc + cst


	addi x1, x0, 1
  beq x1, x0, plus
  auipc x31, 0

plus:
  add x31, x1, x0

	# max_cycle 50
	# pout_start
	# 00001008
	# pout_end
