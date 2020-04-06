# TAG = jal
	.text

  # le registre x0 contient toujours 0
  # syntaxe: jal rd, label
  # opérations: rd <- PC + 4, PC <- PC + 4
  # PC vaut initialement 0x00001000


jal x31, label1   # x31 doit valoir PC + 4

label1:
  lui x31, 0xff320


	# max_cycle 50
	# pout_start
	# 00001004
  # FF320000
	# pout_end
