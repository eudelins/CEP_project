# TAG = bltu
	.text

  # le registre x0 contient toujours 0
  # syntaxe: bltu rs1, rs2, label
  # opération: rs1 < rs2 => pc <- pc + cst


	addi x1, x0, 1
  bltu x1, x0, chargement  # test si rs1 >= rs2
  auipc x31, 0
  # addi x1, x0, -1
  # bltu x0, x1, chargement  # test si rs1 < rs2 en tenant compte de la comparaison non signé
  # FFFFF000
  addi x1, x0, 1
  bltu x0, x1, chargement  # test du cas classique


chargement:
  lui x31, 0xfffff

	# max_cycle 50
	# pout_start
	# 00001008
	# FFFFF000
	# pout_end
