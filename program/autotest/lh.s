# TAG = lh

  .data

mot : .word 50

	.text

  # le registre x0 contient toujours 0
  # syntaxe: lh rd, imm(rs1)
  # opération: rd <- mem[rs1 + immI]

  add x0, x0, x0
  lui x1, 1
  lh x31, 0(x1)

  la x1, mot
  lui x2, 0x0BCDE
  sw x2, 0(x1)
  lh x31, 0(x1)
  
  addi x2, x0, 16
  sw x2, 0(x1)
  lh x31, 0(x1)

  # max_cycle 50
  # pout_start
  # 00000033
  # FFFFE000
  # 00000010
  # pout_end
