# TAG = addi
	.text

  # 000003C1
  # le registre x0 contient toujours 0
  # syntaxe: addi rd, rs1, imm
  # imm est codé sur 11 bits et est donc ompris entre -2048 et 2047

  addi x31, x0, 0    # test: stock 0 dans le registre 31
  # addi x31, x0, 961  # test: son stock un nb quelconque dans x31
  addi x31, x0, -2048   # test: valeur extreme de imm


	# max_cycle 50
	# pout_start
	# 00000000
  # F8000000
	# pout_end
