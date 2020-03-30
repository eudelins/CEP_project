# TAG = sub
	.text

  # le registre x0 contient toujours 0
  # syntaxe: sub rd, rs1, rs2

  sub x31, x0, x0
  lui x5, 0xfffff
  add x31, x5, x0
  addi x5, x0, 961
  addi x6, x0, 1
  sub x31, x5, x6
  addi x6, x0, 256
  sub x31, x5, x6


	# max_cycle 50
	# pout_start
	# 00000000
  # FFFFF000
  # 000003C0
  # 000002C1
	# pout_end
