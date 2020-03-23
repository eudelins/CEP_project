# TAG = sll
	.text

  # le registre x0 contient toujours 0
  # syntaxe: sll rd, rs1, rs2
  # les 5 dernier bits de poids faible de rs2 sont compris entre 0 et 31
	# rs1 est compris entre -2147483648 et 2147483647


	sll x31, x0, 0								# test: valeur extrême inf de x1 stockée dans le registre 31
	sll x31, x0, 31								# test: valeur extrême sup de x1
	sll x31, -2147483648, 31			# test: valeur extrême inf de x0
	sll x31, 2147483647, 0				# test: valeur extrême sup de x0
	sll x31, 2945, 8							# test: stock x0 décalé de 8 bits vers la gauche dans le registre 31
																		# les 8 bits de poids faibles étants remplacés par des 0
	sll x31, -393956, 22								#test: idem pour un décalage de 22 bits


	# max_cycle 50
	# pout_start
	# 00000000
  # 00000000
  #	00000000
  #	7FFFFFFF
	# 000B8100
	# 47000000
	# pout_end
