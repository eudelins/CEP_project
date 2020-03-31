library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.PKG.all;


entity CPU_PC is
    generic(
        mutant: integer := 0
    );
    Port (
        -- Clock/Reset
        clk    : in  std_logic ;
        rst    : in  std_logic ;

        -- Interface PC to PO
        cmd    : out PO_cmd ;
        status : in  PO_status
    );
end entity;

architecture RTL of CPU_PC is
    type State_type is (
      S_Error,
      S_Decode,
      S_LUI,
      S_ADDI,
      S_Init,
      S_Pre_Fetch,
      S_Fetch,
      S_ADD,
      S_AUIPC,
      S_SLL,
      S_BEQ1,
      S_BEQ2,
      S_SLT,
      S_AND,
      S_ORI,
      S_OR,
      S_ANDI,
      S_XOR,
      S_XORI,
      S_SUB,
      S_SRL,
      S_SRA
      );

    signal state_d, state_q : State_type;


begin

    FSM_synchrone : process(clk)
    begin
        if clk'event and clk='1' then
            if rst='1' then
                state_q <= S_Init;
            else
                state_q <= state_d;
            end if;
        end if;
    end process FSM_synchrone;

    FSM_comb : process (state_q, status)
    begin

        -- Valeurs par défaut de cmd à définir selon les préférences de chacun
        cmd.rst               <= '0';
        cmd.ALU_op            <= ALU_plus;
        cmd.LOGICAL_op        <= LOGICAL_or;
        cmd.ALU_Y_sel         <= ALU_Y_immI;

        cmd.SHIFTER_op        <= SHIFT_rl;
        cmd.SHIFTER_Y_sel     <= SHIFTER_Y_rs2;

        cmd.RF_we             <= '0';
        cmd.RF_SIZE_sel       <= RF_SIZE_word;
        cmd.RF_SIGN_enable    <= '0';
        cmd.DATA_sel          <= DATA_from_pc;

        cmd.PC_we             <= '0';
        cmd.PC_sel            <= PC_from_pc;

        cmd.PC_X_sel          <= PC_X_pc;
        cmd.PC_Y_sel          <= PC_Y_immU;

        cmd.TO_PC_Y_sel       <= TO_PC_Y_cst_x04;

        cmd.AD_we             <= '0';
        cmd.AD_Y_sel          <= AD_Y_immI;

        cmd.IR_we             <= '0';

        cmd.ADDR_sel          <= UNDEFINED;
        cmd.mem_we            <= '0';
        cmd.mem_ce            <= '0';

        cmd.cs.CSR_we            <= CSR_none;

        cmd.cs.TO_CSR_sel        <= TO_CSR_from_rs1;
        cmd.cs.CSR_sel           <= CSR_from_mip;
        cmd.cs.MEPC_sel          <= MEPC_from_pc;

        cmd.cs.MSTATUS_mie_set   <= '0';
        cmd.cs.MSTATUS_mie_reset <= '0';

        cmd.cs.CSR_WRITE_mode    <= WRITE_mode_simple;

        state_d <= state_q;

        case state_q is
          when S_Error =>
            -- Etat transitoire en cas d'instruction non reconnue 
            -- Aucune action
            state_d <= S_Init;

          when S_Init =>
            -- PC <- RESET_VECTOR
            cmd.PC_we <= '1';
            cmd.PC_sel <= PC_rstvec;
            state_d <= S_Pre_Fetch;

          when S_Pre_Fetch =>
            -- mem[PC]
            cmd.mem_we   <= '0';
            cmd.mem_ce   <= '1';
            cmd.ADDR_sel <= ADDR_from_pc;
            state_d      <= S_Fetch;

          when S_Fetch =>
            -- IR <- mem_datain
            cmd.IR_we <= '1';
            state_d <= S_Decode;

          when S_Decode =>
            if status.IR(6 downto 0) = "0110111" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_LUI;
            elsif status.IR(14 downto 12) = "000" and status.IR(6 downto 0) = "0010011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_ADDI;
            elsif status.IR(31 downto 25) = "0000000" and status.IR(14 downto 12) = "000" and status.IR(6 downto 0) = "0110011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_ADD;
            elsif status.IR(31 downto 25) = "0100000"  and status.IR(14 downto 12) = "000" and status.IR(6 downto 0) = "0110011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_SUB;
            elsif status.IR(6 downto 0) = "0010111" then
              state_d <= S_AUIPC;
            elsif status.IR(14 downto 12) = "110" and status.IR(6 downto 0) = "0110011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_OR;
            elsif status.IR(14 downto 12) = "110" and status.IR(6 downto 0) = "0010011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_ORI;
            elsif status.IR(14 downto 12) = "111" and status.IR(6 downto 0) = "0110011" then
               -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_AND;
            elsif status.IR(14 downto 12) = "111" and status.IR(6 downto 0) = "0010011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_ANDI;
            elsif status.IR(14 downto 12) = "100" and status.IR(6 downto 0) = "0110011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_XOR;
            elsif status.IR(14 downto 12) = "100" and status.IR(6 downto 0) = "0010011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_XORI;
            elsif status.IR(14 downto 12) = "001" and status.IR(6 downto 0) = "0110011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_SLL;
            elsif status.IR(31 downto 25) = "0000000" and status.IR(14 downto 12) = "101" and status.IR(6 downto 0) = "0110011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_SRL;
            elsif status.IR(31 downto 25) = "0100000" and status.IR(14 downto 12) = "101" and status.IR(6 downto 0) = "0110011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_SRA;
            elsif status.IR(14 downto 12) = "000" and status.IR(6 downto 0) = "1100011" then
              state_d <= S_BEQ1;
            elsif status.IR(14 downto 12) = "010" and status.IR(6 downto 0) = "0110011" then
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              state_d <= S_SLT;
            else
              state_d <= S_Error;
            end if;
              

                -- Décodage effectif des instructions,
                -- à compléter par vos soins

---------- Instructions avec immediat de type U ----------

         when S_LUI =>
              -- rd <- ImmU + 0
              cmd.PC_X_sel <= PC_X_cst_x00;
              cmd.PC_Y_sel <= PC_Y_immU;
              cmd.RF_we <= '1';
              cmd.DATA_sel <= DATA_from_pc;
              -- lecture mem[PC]
              cmd.ADDR_sel <= ADDR_from_pc;
              cmd.mem_ce <= '1';
              cmd.mem_we <= '0';
              -- next state
              state_d <= S_Fetch;


         when S_AUIPC =>
              -- rd <- ImmU + pc
              cmd.PC_X_sel <= PC_X_pc;
              cmd.PC_Y_sel <= PC_Y_immU;
              cmd.RF_we <= '1';
              cmd.DATA_sel <= DATA_from_pc;
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
              -- next state
              state_d <= S_Pre_Fetch;
            

---------- Instructions arithmétiques et logiques ----------

         when S_ADDI =>
              -- rd <- rs1 + ImmI
              cmd.ALU_Y_sel <= ALU_Y_immI;
              cmd.ALU_op <= ALU_plus;
              cmd.DATA_sel <= DATA_from_alu;
              cmd.RF_we <= '1';
              -- lecture mem[PC]
              cmd.ADDR_sel <= ADDR_from_pc;
              cmd.mem_ce <= '1';
              cmd.mem_we <= '0';
              -- next state
              state_d <= S_Fetch;


         when S_ADD =>
              -- mem_addr <- rs1 + rs2
              cmd.ALU_Y_sel <= ALU_Y_rf_rs2;
              cmd.ALU_op <= ALU_plus;
              cmd.DATA_sel <= DATA_from_alu;
              cmd.RF_we <= '1';
              -- lecture mem[PC]
              cmd.ADDR_sel <= ADDR_from_pc;
              cmd.mem_ce <= '1';
              cmd.mem_we <= '0';
              -- next state
              state_d <= S_Fetch;


          when S_SUB =>
            -- rd <- rs1 - rs2
            cmd.ALU_Y_sel <= ALU_Y_rf_rs2;
            cmd.ALU_op <= ALU_minus;
            cmd.DATA_sel <= DATA_from_alu;
            cmd.RF_we <= '1';
            -- lecture mem[PC]
            cmd.ADDR_sel <= ADDR_from_pc;
            cmd.mem_ce <= '1';
            cmd.mem_we <= '0';
            -- next state
            state_d <= S_Fetch;
            
            

          when S_SLL =>
              -- rd <- rs1 << rs2(0:4)
              cmd.SHIFTER_Y_sel <= SHIFTER_Y_rs2;
              cmd.SHIFTER_op <= SHIFT_ll;
              cmd.DATA_sel <= DATA_from_shifter;
              cmd.RF_we <= '1';
              -- lecture mem[PC]
              cmd.ADDR_sel <= ADDR_from_pc;
              cmd.mem_ce <= '1';
              cmd.mem_we <= '0';
              -- next state
              state_d <= S_Fetch;



          when S_SRL =>
            -- rd <- rs1 >> rs2(0:4)
            cmd.SHIFTER_Y_sel <= SHIFTER_Y_rs2;
            cmd.SHIFTER_op <= SHIFT_rl;
            cmd.DATA_sel <= DATA_from_shifter;
            cmd.RF_we <= '1';
            -- lecture mem[PC]
            cmd.ADDR_sel <= ADDR_from_pc;
            cmd.mem_ce <= '1';
            cmd.mem_we <= '0';
            -- next state
            state_d <= S_Fetch;


          when S_SRA =>
            -- rd <- rs1 >> rs2(0:4)
            cmd.SHIFTER_Y_sel <= SHIFTER_Y_rs2;
            cmd.SHIFTER_op <= SHIFT_ra;
            cmd.DATA_sel <= DATA_from_shifter;
            cmd.RF_we <= '1';
            -- lecture mem[PC]
            cmd.ADDR_sel <= ADDR_from_pc;
            cmd.mem_ce <= '1';
            cmd.mem_we <= '0';
            -- next state
            state_d <= S_Fetch;
            
            

         when S_SLT =>
              -- si rs1 < rs2, rd <- 0³¹||1
              -- si rs1 >= rs2, rd <- 0³²
              cmd.ALU_Y_sel <= ALU_Y_rf_rs2;
              cmd.DATA_sel <= DATA_from_slt;
              cmd.RF_we <= '1';
              -- lecture mem[PC]
              cmd.ADDR_sel <= ADDR_from_pc;
              cmd.mem_ce <= '1';
              cmd.mem_we <= '0';
              -- next state
              state_d <= S_Fetch;


         when S_AND =>
              -- rd <- rs1 and rs2
              cmd.ALU_Y_sel <= ALU_Y_rf_rs2;
              cmd.LOGICAL_op <= LOGICAL_and;
              cmd.DATA_sel <= DATA_from_logical;
              cmd.RF_we <= '1';
              -- lecture mem[PC]
              cmd.ADDR_sel <= ADDR_from_pc;
              cmd.mem_ce <= '1';
              cmd.mem_we <= '0';
              -- next state
              state_d <= S_Fetch;


          when S_ANDI =>
            -- rd <- immI and rs1
            cmd.ALU_Y_sel <= ALU_Y_immI;
            cmd.LOGICAL_op <= LOGICAL_and;
            cmd.DATA_sel <= DATA_from_logical;
            cmd.RF_we <= '1';
            -- lecture mem[PC]
            cmd.ADDR_sel <= ADDR_from_pc;
            cmd.mem_ce <= '1';
            cmd.mem_we <= '0';
            -- next state
            state_d <= S_Fetch;                         
            

              
          when S_OR =>
            -- rd <- rs1 or rs2
            cmd.ALU_Y_sel <= ALU_Y_rf_rs2;
            cmd.LOGICAL_op <= LOGICAL_or;
            cmd.DATA_sel <= DATA_from_logical;
            cmd.RF_we <= '1';
            -- lecture mem[PC]
            cmd.ADDR_sel <= ADDR_from_pc;
            cmd.mem_ce <= '1';
            cmd.mem_we <= '0';
            -- next state
            state_d <= S_Fetch;


          when S_ORI =>
            -- rd <- rs1 or immI
            cmd.ALU_Y_sel <= ALU_Y_immI;
            cmd.LOGICAL_op <= LOGICAL_or;
            cmd.DATA_sel <= DATA_from_logical;
            cmd.RF_we <= '1';
            -- lecture mem[PC]
            cmd.ADDR_sel <= ADDR_from_pc;
            cmd.mem_ce <= '1';
            cmd.mem_we <= '0';
            -- next state
            state_d <= S_Fetch;



          when S_XOR =>
            -- rd <- rs1 xor rs2
            cmd.ALU_Y_sel <= ALU_Y_rf_rs2;
            cmd.LOGICAL_op <= LOGICAL_xor;
            cmd.DATA_sel <= DATA_from_logical;
            cmd.RF_we <= '1';
            -- lecture mem[PC]
            cmd.ADDR_sel <= ADDR_from_pc;
            cmd.mem_ce <= '1';
            cmd.mem_we <= '0';
            -- next state
            state_d <= S_Fetch;


          when S_XORI =>
            -- rd <- rs1 xor immI
            cmd.ALU_Y_sel <= ALU_Y_immI;
            cmd.LOGICAL_op <= LOGICAL_xor;
            cmd.DATA_sel <= DATA_from_logical;
            cmd.RF_we <= '1';
            -- lecture mem[PC]
            cmd.ADDR_sel <= ADDR_from_pc;
            cmd.mem_ce <= '1';
            cmd.mem_we <= '0';
            -- next state
            state_d <= S_Fetch;
            

---------- Instructions de saut ----------

          when S_BEQ1 =>
              -- calcul de status.JCOND
              cmd.ALU_Y_sel <= ALU_Y_rf_rs2;
              -- next state
              state_d <= S_BEQ2;


          when S_BEQ2 =>
            if status.JCOND then
              -- PC <- PC + cst
              cmd.TO_PC_Y_sel <= TO_PC_Y_immB;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
            else
              -- PC <- PC + 4
              cmd.TO_PC_Y_sel <= TO_PC_Y_cst_x04;
              cmd.PC_sel <= PC_from_pc;
              cmd.PC_we <= '1';
            end if;
            -- next state
            state_d <= S_Pre_Fetch;
            
            
            
---------- Instructions de chargement à partir de la mémoire ----------

          

            
---------- Instructions de sauvegarde en mémoire ----------

         
                       
            
---------- Instructions d'accès aux CSR ----------

          

          

          
              

              
          when others => null;
        end case;

    end process FSM_comb;

end architecture;
