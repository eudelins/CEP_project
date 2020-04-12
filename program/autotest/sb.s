# TAG = sb
	.data

mot : .word 50

	.text

  # le registre x0 contient toujours 0
  # syntaxe: sb rs2, immS(rs1)

	la x1, mot
    sb x0, 0(x1)
    lw x31, 0(x1)
	lui x2, 0x0BCDE
    addi x2, x2, 5
	sb x2, 0(x1)
	lw x31, 0(x1)


	# max_cycle 50
	# pout_start
	# 00000000
	# 00000005
	# pout_end
