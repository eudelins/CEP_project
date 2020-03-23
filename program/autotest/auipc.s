# TAG = auipc
	.text

  # le registre x0 contient toujours 0
  # syntaxe: auipc rd, imm

  # 0000200C
  # auipc x31, 0x00001  # test: addition avec un immédiat quelconque

  auipc x31, 0  # test: chargement de la valeur de PC
  auipc x31, 0  # test: chargement de la valeur de PC
  addi x0, x0, 0  # On effectue une instruction quelconque pour augmenter PC de 4
  auipc x31, 0  # test: chargement de la valeur de PC, on vérifie l'augmentation de 4

	# max_cycle 50
	# pout_start
	# 00001000
  # 00001004
  # 00001008
	# pout_end
