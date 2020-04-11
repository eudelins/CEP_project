# TAG = bgeu
	.text

  # le registre x0 contient toujours 0
  # syntaxe : bgeu rs1, rs2, label
  # opérations: rs1 >= rs2 => PC <- PC + cst
  # PC vaut initialement 0x00001000


addi x1, x0, 17
addi x2, x0, 22
bgeu x1, x2, label1   # rs1 < rs2 donc PC ne change pas de valeur

auipc x31, 0    # x31 vaut la valeur de PC

addi x1, x0, 25
addi x1, x0, 14
bgeu x1, x2, label1     # rs1 >= r2 donc PC <- PC + cst

label1:
  lui x31, 0x23e5a


	# max_cycle 50
	# pout_start
	# 000010OC
    # 23E5A000
	# pout_end
