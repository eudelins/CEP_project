# TAG = srli
	.text

  # le registre x0 contient toujours 0
  # syntaxe: srli rd, rs1, rs2

	srli x31, x0, 0

	lui x1, 0x01000
	srli x31, x1, 31

	srli x31, x1, 0								# test: valeur extrême inf de rs2

	addi x1, x0, 2045							
	srli x31, x1, 8

	lui x1, 0x0A5C0
	srli x31, x1, 12

	# max_cycle 50
	# pout_start
	# 00000000
	# 00000000
	# 01000000
	# 00000007
	# 0000A5C0
	# pout_end
