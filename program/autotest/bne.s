# TAG = bne
	.text

  # le registre x0 contient toujours 0
  # syntaxe: bne rs1, rs2, label
  # opération: rs1 != rs2 => pc <- pc + cst


	addi x1, x0, 1
  bne x0, x0, plus  # test si rs1 != rs2
  auipc x31, 0
  bne x1, x0, plus  # test si rs1 = rs2
  bne x1, x0, chargement

plus:
  add x31, x1, x0

chargement:
  lui x31, 0xfffff

	# max_cycle 50
	# pout_start
	# 00001008
  # 00000001
	# FFFFF000
	# pout_end
