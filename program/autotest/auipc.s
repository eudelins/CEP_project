# TAG = auipc
	.text

  # le registre x0 contient toujours 0
  # syntaxe: auipc rd, imm

	auipc x31, 0  # test: chargement de la valeur de PC

	# max_cycle 50
	# pout_start
	# 000002E8
	# pout_end
