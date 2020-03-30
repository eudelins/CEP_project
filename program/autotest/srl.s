# TAG = srl
	.text

  # le registre x0 contient toujours 0
  # syntaxe: srl rd, rs1, rs2

	srl x31, x0, x0								# test: valeur extrême inf de x2 stockée dans le registre 31

	addi x2, x0, 31								# chargement constante
	srl x31, x0, x2								# test: valeur extrême sup de rs2

	lui x1, 0x01000								# chargement constante
	addi x2, x0, 31								# chargement constante
	srl x31, x1, x2								# test: valeur extrême sup de rs2

	srl x31, x1, x0								# test: valeur extrême inf de rs2

	addi x1, x0, 2045							# chargement constante aléatoire postive
	addi x2, x0, 8								# chargement constante
	srl x31, x1, x2								# test: stock x0 décalé de 8 bits vers la gauche dans le registre 31
																		# les 8 bits de poids faibles étants remplacés par des 0

	lui x1, 0x0A5C0 						# chargement constante aléatoire négative
	addi x2, x0, 12								# chargement constante
	srl x31, x1, x2								# test: idem pour un décalage de 22 bits


	# max_cycle 50
	# pout_start
	# 00000000
	#	00000000
	# 00000000
	# 01000000
	# 00000007
	# 0000A5C0
	# pout_end
