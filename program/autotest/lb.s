# TAG = lb
	.text

  # le registre x0 contient toujours 0
  # syntaxe: lb rd, imm(rs1)
  # opérations: rd <- mem[immI + rs1]7...0 + extension de signe sur les 24 bits de poids faible
  

lb x31, 

	# max_cycle 50
	# pout_start
	# 
    # 
	# pout_end



  .data

mot : .word 50

	.text

  # le registre x0 contient toujours 0
  # syntaxe: lw rd, imm(rs1)
  # opération: rd <- mem[rs1 + immI]

  add x0, x0, x0
  lui x1, 1
  lw x31, 0(x1)

  la x1, mot
  lui x2, 0x0BCDE
  sw x2, 0(x1)
  lw x31, 0(x1)

	# max_cycle 50
	# pout_start
  # 00000033
  # 0BCDE000
  # pout_end
