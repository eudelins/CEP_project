# TAG = addi
	.text

  # le registre x0 contient toujours 0
  # syntaxe: addi rd, rs1, imm
  # imm est codé sur 11 bits et est donc ompris entre -2048 et 2047

  addi x31, x0, x0    # test: stock 0 dans le registre 31
  lui x5, 0xfffff
  addi x31, x0, x5  # test: 0 + un nb quelconque


	# max_cycle 50
	# pout_start
	# 00000000
  # 00000000
  # FFFFF000
	# pout_end
