library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.PKG.all;

entity CPU_CND is
    generic (
        mutant      : integer := 0
    );
    port (
        rs1         : in w32;
        alu_y       : in w32;
        IR          : in w32;
        slt         : out std_logic;
        jcond       : out std_logic
    );
end entity;

architecture RTL of CPU_CND is

  signal IR_logic : unsigned(31 downto 0);
  signal  extension_signe, jc_final, z, s : std_logic;
  
begin
  IR_logic <= unsigned(IR);
  extension_signe <= (not IR(12) and not IR(6)) or (IR(6) and not IR(13));
  s <= '0' when rs1 < alu_y else '1';
  z <= '1' when rs1 = alu_y else '0';
  jc_final <= (not IR(14) and (IR(12) xor z))  or ((IR[12] xor s) and IR(14));
  jcond <= jc_final;
  slt <= s;
  
end architecture;
