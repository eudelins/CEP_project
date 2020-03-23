# TAG = add
	.text

  # le registre x0 contient toujours 0
  # syntaxe: add rd, rs1, rs2
  # imm est codé sur 11 bits et est donc ompris entre -2048 et 2047

  add x31, x0, x0    # test: stock 0 dans le registre 31
  lui x5, 0xfffff
  add x31, x0, x5  # test: 0 + un nb quelconque
  addi x5, x0, 961
  addi x6, x0, 1
  add x31, x5, x6  # test: incrémentation de x5 stocké dans x6
  addi x6, x0, -256
  add x31, x5, x6  # test: somme de 2 nb quelconque


	# max_cycle 50
	# pout_start
	# 00000000
  # FFFFF000
  # 000003C2
  # 000002C1
	# pout_end
