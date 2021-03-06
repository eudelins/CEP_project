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

  signal rs1_op, rs2_op , moins: signed(31 downto 0);
  signal sous, rs1_33, rs2_33 : signed(32 downto 0);
  signal  extension_signe, jc_final, z, s : std_logic;
  
  begin
  extension_signe <= ((not IR(12)) and (not IR(6))) or (IR(6) and (not IR(13)));
  
  rs1_op <= signed(rs1);
  rs2_op <= signed(alu_y);
  rs1_33 <= rs1_op(31) & rs1_op when (extension_signe = '1') else '0' & rs1_op;
  rs2_33 <= rs2_op(31) & rs2_op when (extension_signe = '1') else '0' & rs2_op;
  sous <= rs1_33 - rs2_33;
  
  s <= sous(32);
  z <= '1' when (sous = 0) else '0';
  
  jc_final <= ((not IR(14)) and (IR(12) xor z))  or ((IR(12) xor s) and IR(14));
  jcond <= jc_final;
  slt <= s;
  
end architecture;
