# TAG = jalr
	.text

  # le registre x0 contient toujours 0
  # syntaxe: jal rd, label
  # opérations: rd <- PC + 4, PC <- PC + 4
  # PC vaut initialement 0x00001000


addi x1, x0, 307  # stock l'instruction add x2, x0, x0, dans x1
lui x3, 0x00003
sw x1, 0(x3),   # stock l'instruction add x2, x0, x0 à l'adresse 3000
jalr x31, 8(x1)   # x31 doit valoir PC + 4
auipc x31, 0
addi x0, x0, 0
addi x31, x0, 16

	# max_cycle 50
	# pout_start
	# 00001010
    # 00000010
	# pout_end