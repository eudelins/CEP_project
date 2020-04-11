# TAG = jalr
	.text

  # le registre x0 contient toujours 0
  # syntaxe: jal rd, label
  # opérations: rd <- PC + 4, PC <- PC + 4
  # PC vaut initialement 0x00001000


jal x31, 16(x0)   # x31 doit valoir PC + 4
auipc x31, 0


	# max_cycle 50
	# pout_start
	# 00001004
    # 00000010
	# pout_end