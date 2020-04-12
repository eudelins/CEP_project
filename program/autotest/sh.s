# TAG = sh
	.data

mot : .word 50

	.text

  # le registre x0 contient toujours 0
  # syntaxe: sh rs2, immS(rs1)

	la x1, mot
    sh x0, 0(x1)
    lw x31, 0(x1)
	lui x2, 0x0BCDE
	sh x2, 0(x1)
	lh x31, 0(x1)


	# max_cycle 50
	# pout_start
	# 00000000
	# 0000E000
	# pout_end
