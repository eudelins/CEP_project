# TAG = sll
	.text

  # le registre x0 contient toujours 0
  # syntaxe: sll rd, rs1, rs2
  # les 5 dernier bits de poids faible de rs2 sont compris entre 0 et 31
	# rs1 est compris entre -2147483648 et 2147483647

	sll x31, x0, x0								# test: valeur extrême inf de x2 stockée dans le registre 31

	addi x2, x0, 31								# chargement constante
	sll x31, x0, x2								# test: valeur extrême sup de rs2

	addi x1, x0, 10								# chargement constante
	addi x2, x0, 31								# chargement constante
	sll x31, x1, x2								# test: valeur extrême sup de rs2

	sll x31, x1, x0								# test: valeur extrême inf de rs2

	# addi x1, x0, 2045							# chargement constante aléatoire postive
	# addi x2, x0, 8								# chargement constante
	# sll x31, x1, x2								# test: stock x0 décalé de 8 bits vers la gauche dans le registre 31
	# 0007FD00
																		# les 8 bits de poids faibles étants remplacés par des 0

	# addi x1, x0, -393 						# chargement constante aléatoire négative
	# addi x2, x0, 22								# chargement constante
	# sll x31, x1, x2								# test: idem pour un décalage de 22 bits
	# FFFFFE77


	# max_cycle 50
	# pout_start
	# 00000000
	#	00000000
	# 00000000
	# 0000000A
	# pout_end
