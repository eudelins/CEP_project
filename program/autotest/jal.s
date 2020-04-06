# TAG = jal
	.text

  # le registre x0 contient toujours 0
  # syntaxe: jal rd, label
  # opérations: rd <- PC + 4, PC <- PC + 4
  # PC vaut initialement 0x00001000

label1:
  lui x31, 0x00000

label2;
  lui x31, 0xfffff

jal x31, label1   # x31 doit valoir PC + 4
auipc x31, 0      # x31 doit valoir PC + label1 = PC

jal x31, label2   # x31 doit valoir PC + 4
auipc x31, 0      # x31 doit valoir PC + label2 = PC + Oxfffff


	# max_cycle 50
	# pout_start
  # 00000000
  # FFFFF000
	# 00001004
  # 00001004
  # 0000100C
  # OOOOOOOC
	# pout_end
