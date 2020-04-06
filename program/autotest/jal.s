# TAG = jal
	.text

  # le registre x0 contient toujours 0
  # syntaxe: jal rd, label
  # opérations: rd <- PC + 4, PC <- PC + 4
  # PC vaut initialement 0x00001000

label1:
  lui x31, 0x00000

label2:
  lui x31, 0xfffff

jal x31, label1   # x31 doit valoir PC + 4

jal x31, label2   # x31 doit valoir PC + 4


	# max_cycle 50
	# pout_start
	# 00001004
  # 00000000
  # 0000100C
  # FFFFF000
	# pout_end
