# TAG = auipc
	.text

  # le registre x0 contient toujours 0
  # syntaxe: auipc rd, imm

	auipc x31, 0  # test: chargement de la valeur de PC
  auipc x31, 0  # test: chargement de la valeur de PC, on vérifie l'augmentation de 4
  lui x0, 0  # On effectue une instruction quelconque pour augmenter PC de 4
  auipc x31, 0  # test: chargement de la valeur de PC, on vérifie l'augmentation de 8
  auipc x31, -10  # test: addition avec un immédiat quelconque

	# max_cycle 50
	# pout_start
	# 00001000
  # 00001004
  # 0000100C
  # FFFF8000
	# pout_end
