# TAG = addi
	.text

  # le registre x0 contient toujours 0
  # syntaxe: addi rd, rs1, imm
  # imm est codé sur 12 bits et est donc ompris entre -2048 et 2047

  addi x31, x0, 0    # test: stock 0 dans le registre 31
  addi x31, x0, 961  # test: avec un imm quelconque
  addi x31, x0, -245
  addi x31, x0, -2048   # test: valeurs extremes de imm
  addi x31, x0, 2047


	# max_cycle 50
	# pout_start
	# 00000000
  # 000003C1
  # FFFFFF0B
  # FFFFF800
  # 000007FF
	# pout_end
