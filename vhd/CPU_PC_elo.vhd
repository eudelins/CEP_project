S_LHU1,
S_LHU2,
S_LHU3,


-- dans le décode
elsif status.IR(14 downto 12) = '101' and status.IR(6 downto 0) = '0000011' then
    -- PC <- PC + 4
    cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
    cmd.PC_sel <= PC_from_pc;
    cmd.PC_we <= '1';
    state_d <= S_LHU1;

-- code
when S_LHU1 =>
    -- calcul de l'@ qui vaut immI + rs1
    cmd.AD_Y_select <= AD_Y_immI;
    cmd.AD_we <= '1';
    -- next state
    state_d <= S_LHU2;

when S_LHU2 =>
    -- lecture de la mémoire à l'@
    cmd.ADDR_sel <= ADDR_from_ad;
    cmd.mem_ce <= '1';
    cmd.mem_we <= '0';
    -- next state
    state_d <= S_LHU3;

when S_LHU3 =>
    -- rd <- mem[@]
    cmd.RF_SIZE_sel <= RF_SIZE_half;
    cmd.RF_SIGN_enable <= '0';
    cmd.DATA_sel <= DATA_from_mem,
    cmd.RF_we <= '1';
    -- lecture de la mémoire à PC
    cmd.ADDR_sel <= ADDR_from_pc;
    cmd.mem_ce <= '1';
    cmd.mem_we <= '0';
    -- next state
    state_d <= S_Fetch;

