# TAG = jalr
	.text


  # le registre x0 contient toujours 0
  # syntaxe: jal rd, label
  # opérations: rd <- PC + 4, PC <- PC + 4
  # PC vaut initialement 0x00001000

la x3, label2
jalr x31, 0(x3)   # x31 doit valoir PC + 4

label1:
  lui x31, 0xfffff

label2:
  lui x31, 0xffff0
	
  # max_cycle 50
	# pout_start
	# 0000100C
  # FFFF0000
	# pout_end