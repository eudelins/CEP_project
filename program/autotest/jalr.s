# TAG = jalr
  .data

mot : .word 50

	.text


  # le registre x0 contient toujours 0
  # syntaxe: jal rd, label
  # opérations: rd <- PC + 4, PC <- PC + 4
  # PC vaut initialement 0x00001000

la x3, mot
addi x1, x0, 307  # stock l'instruction add x2, x0, x0, dans x1
sw x1, 0(x3)  # stock l'instruction add x2, x0, x0, dans mot
jalr x31, 0(x1)   # x31 doit valoir PC + 4

# lui x3, 0x00003
# sw x1, 0(x3),   # stock l'instruction add x2, x0, x0 à l'adresse 3000
# auipc x31, 0
# addi x0, x0, 0
# addi x31, x0, 16

	# max_cycle 50
	# pout_start
	# 00001010
  # 00000000
	# pout_end