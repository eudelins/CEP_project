# TAG = bltu
	.text

  # le registre x0 contient toujours 0
  # syntaxe: blt rs1, rs2, label
  # opération: rs1 < rs2 => pc <- pc + cst


	addi x1, x0, 1
  bltu x1, x0, plus  # test si rs1 >= rs2
  auipc x31, 0
  addi x1, x0, -1
  bltu x0, x1, plus  # test si rs1 < rs2 en tenant compte de la comparaison non signé
  addi x1, x0, 1
  bltu x0, x1, chargement  # test du cas classique

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
