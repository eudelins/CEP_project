# TAG = lhu

  # le registre x0 contient toujours 0
  # syntaxe: lhu rd, imm(rs1)
  # opérations: rd <- mem[immI + rs1]15...0 + extension de signe sur les 24 bits de poids faible


  .data

mot : .word 56

  .text

  la x1, mot   # dans x1 on met l'@ de mot
  lb x31, 0(x1)

	# max_cycle 50
	# pout_start
    # 00000038
	# pout_end

