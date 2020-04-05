# TAG = slli
	.text

  # le registre x0 contient toujours 0
  # syntaxe: sll rd, rs1, imm


	slli x31, x0, 0

  addi x1, x0, 10
	slli x31, x1, 0

	addi x1, x0, 2045
	slli x31, x1, 8

	addi x1, x0, -393
	slli x31, x1, 22								

	# max_cycle 50
	# pout_start
	# 00000000
	# 0000000A
	# 0007FD00
	# 9DC00000
	# pout_end
