# TAG = lw
	.text

  # le registre x0 contient toujours 0
  # syntaxe: lw rd, imm(rs1)
  # opération: rd <- mem[rs1 + immI]

  add x0, x0, x0
  lui x1, 1
  lw x31, 0(x1)

  # sw x0, 0(x1)
  # lw x31, 0(x1)
  # 00000000
  # lui x2, 0x0BCDE
  # sw x2, 0(x1)
  # 0BCDE000


	# max_cycle 50
	# pout_start
  # 00000033
  # pout_end
