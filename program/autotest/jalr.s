# TAG = jalr
	.text

  # le registre x0 contient toujours 0
  # syntaxe: jal rd, label
  # opérations: rd <- PC + 4, PC <- PC + 4
  # PC vaut initialement 0x00001000


lui x1, 0x00002
jalr x31, 8(x1)   # x31 doit valoir PC + 4
auipc x31, 0
addi x0, x0, 0
addi x31, x0, 16

	# max_cycle 50
	# pout_start
	# 00001008
    # 00000010
	# pout_end