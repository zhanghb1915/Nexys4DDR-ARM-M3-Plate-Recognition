-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reduce_opr is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    src_rows_V_read : IN STD_LOGIC_VECTOR (31 downto 0);
    src_cols_V_read : IN STD_LOGIC_VECTOR (31 downto 0);
    src_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    src_data_stream_V_empty_n : IN STD_LOGIC;
    src_data_stream_V_read : OUT STD_LOGIC;
    dst_data_stream_V_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    dst_data_stream_V_full_n : IN STD_LOGIC;
    dst_data_stream_V_write : OUT STD_LOGIC );
end;


architecture behav of reduce_opr is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv33_1FFFFFFFF : STD_LOGIC_VECTOR (32 downto 0) := "111111111111111111111111111111111";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal src_data_stream_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal dst_data_stream_V_blk_n : STD_LOGIC;
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal tmp_3_reg_237 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_3_reg_237_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal t_V_1_reg_122 : STD_LOGIC_VECTOR (31 downto 0);
    signal r_V_fu_142_p2 : STD_LOGIC_VECTOR (32 downto 0);
    signal r_V_reg_214 : STD_LOGIC_VECTOR (32 downto 0);
    signal exitcond1_fu_148_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal i_V_fu_153_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_V_reg_223 : STD_LOGIC_VECTOR (31 downto 0);
    signal exitcond_fu_159_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal j_V_fu_164_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal tmp_3_fu_174_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_6_reg_241 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal t_V_reg_111 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal internal_val_0_fu_185_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal tmp_1_fu_82 : STD_LOGIC_VECTOR (15 downto 0);
    signal lhs_V_cast_fu_138_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal tmp_cast_fu_170_p1 : STD_LOGIC_VECTOR (32 downto 0);
    signal tmp_9_fu_182_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((exitcond1_fu_148_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then
                    if ((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3)) then 
                        ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state3);
                    elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                        ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                elsif (((exitcond1_fu_148_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    t_V_1_reg_122_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (exitcond_fu_159_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                t_V_1_reg_122 <= j_V_fu_164_p2;
            elsif (((exitcond1_fu_148_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                t_V_1_reg_122 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;

    t_V_reg_111_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
                t_V_reg_111 <= i_V_reg_223;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                t_V_reg_111 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;

    tmp_1_fu_82_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_3_reg_237_pp0_iter1_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
                tmp_1_fu_82 <= internal_val_0_fu_185_p2;
            elsif ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_3_reg_237_pp0_iter1_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
                tmp_1_fu_82 <= ap_const_lv16_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                i_V_reg_223 <= i_V_fu_153_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                r_V_reg_214 <= r_V_fu_142_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (exitcond_fu_159_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_3_reg_237 <= tmp_3_fu_174_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_3_reg_237_pp0_iter1_reg <= tmp_3_reg_237;
                tmp_6_reg_241 <= src_data_stream_V_dout;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, exitcond1_fu_148_p2, ap_CS_fsm_state2, exitcond_fu_159_p2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((exitcond1_fu_148_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((exitcond_fu_159_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) and not(((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif ((((exitcond_fu_159_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state6 <= ap_CS_fsm(3);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(src_data_stream_V_empty_n, dst_data_stream_V_full_n, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, tmp_3_reg_237_pp0_iter1_reg)
    begin
                ap_block_pp0_stage0_01001 <= (((tmp_3_reg_237_pp0_iter1_reg = ap_const_lv1_1) and (dst_data_stream_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((src_data_stream_V_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(src_data_stream_V_empty_n, dst_data_stream_V_full_n, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, tmp_3_reg_237_pp0_iter1_reg)
    begin
                ap_block_pp0_stage0_11001 <= (((tmp_3_reg_237_pp0_iter1_reg = ap_const_lv1_1) and (dst_data_stream_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((src_data_stream_V_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(src_data_stream_V_empty_n, dst_data_stream_V_full_n, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, tmp_3_reg_237_pp0_iter1_reg)
    begin
                ap_block_pp0_stage0_subdone <= (((tmp_3_reg_237_pp0_iter1_reg = ap_const_lv1_1) and (dst_data_stream_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((src_data_stream_V_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;

        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter1_assign_proc : process(src_data_stream_V_empty_n)
    begin
                ap_block_state4_pp0_stage0_iter1 <= (src_data_stream_V_empty_n = ap_const_logic_0);
    end process;


    ap_block_state5_pp0_stage0_iter2_assign_proc : process(dst_data_stream_V_full_n, tmp_3_reg_237_pp0_iter1_reg)
    begin
                ap_block_state5_pp0_stage0_iter2 <= ((tmp_3_reg_237_pp0_iter1_reg = ap_const_lv1_1) and (dst_data_stream_V_full_n = ap_const_logic_0));
    end process;


    ap_condition_pp0_exit_iter0_state3_assign_proc : process(exitcond_fu_159_p2)
    begin
        if ((exitcond_fu_159_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, exitcond1_fu_148_p2, ap_CS_fsm_state2)
    begin
        if ((((exitcond1_fu_148_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(exitcond1_fu_148_p2, ap_CS_fsm_state2)
    begin
        if (((exitcond1_fu_148_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    dst_data_stream_V_blk_n_assign_proc : process(dst_data_stream_V_full_n, ap_block_pp0_stage0, ap_enable_reg_pp0_iter2, tmp_3_reg_237_pp0_iter1_reg)
    begin
        if (((tmp_3_reg_237_pp0_iter1_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            dst_data_stream_V_blk_n <= dst_data_stream_V_full_n;
        else 
            dst_data_stream_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    dst_data_stream_V_din <= std_logic_vector(unsigned(tmp_1_fu_82) + unsigned(tmp_9_fu_182_p1));

    dst_data_stream_V_write_assign_proc : process(ap_enable_reg_pp0_iter2, tmp_3_reg_237_pp0_iter1_reg, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_3_reg_237_pp0_iter1_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            dst_data_stream_V_write <= ap_const_logic_1;
        else 
            dst_data_stream_V_write <= ap_const_logic_0;
        end if; 
    end process;

    exitcond1_fu_148_p2 <= "1" when (t_V_reg_111 = src_rows_V_read) else "0";
    exitcond_fu_159_p2 <= "1" when (t_V_1_reg_122 = src_cols_V_read) else "0";
    i_V_fu_153_p2 <= std_logic_vector(unsigned(t_V_reg_111) + unsigned(ap_const_lv32_1));
    internal_val_0_fu_185_p2 <= std_logic_vector(unsigned(tmp_1_fu_82) + unsigned(tmp_9_fu_182_p1));
    j_V_fu_164_p2 <= std_logic_vector(unsigned(t_V_1_reg_122) + unsigned(ap_const_lv32_1));
    lhs_V_cast_fu_138_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(src_cols_V_read),33));
    r_V_fu_142_p2 <= std_logic_vector(unsigned(lhs_V_cast_fu_138_p1) + unsigned(ap_const_lv33_1FFFFFFFF));

    src_data_stream_V_blk_n_assign_proc : process(src_data_stream_V_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            src_data_stream_V_blk_n <= src_data_stream_V_empty_n;
        else 
            src_data_stream_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    src_data_stream_V_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            src_data_stream_V_read <= ap_const_logic_1;
        else 
            src_data_stream_V_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_3_fu_174_p2 <= "1" when (tmp_cast_fu_170_p1 = r_V_reg_214) else "0";
    tmp_9_fu_182_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_6_reg_241),16));
    tmp_cast_fu_170_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(t_V_1_reg_122),33));
end behav;