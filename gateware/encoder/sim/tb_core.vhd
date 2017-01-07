--------------------------------------------------------------------------------
--   Copyright (C) ENJOY-DIGITAL ALL rights reserved.
--------------------------------------------------------------------------------
--   Filename      : tb_core.vhd
--   Authors       : Florent Kermarrec
--   Projects      : Test JPEG Encoder core
--   Purpose       :
--
--   Notes         :
--
--------------------------------------------------------------------------------


--******************************************************************************
--  Package Declaration Part
--******************************************************************************
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;

library STD;
use STD.textio.all;

use WORK.pkg_txt_util.all;

--******************************************************************************
--  Entity Declaration Part
--******************************************************************************
entity tb_core is
end;

architecture test of tb_core is
  --===================================--
  -- Constants Declaration
  --===================================--
  --===================================--
  -- Signals Declaration
  --===================================--
  signal sys_clock : std_logic := '0';
  signal sys_reset : std_logic;
  
  signal encoder_clock : std_logic := '0';
  signal encoder_reset : std_logic;
  
  signal wishbone_stb   : std_logic;
  signal wishbone_sel   : std_logic_vector(3 downto 0);
  signal wishbone_we    : std_logic;
  signal wishbone_ack   : std_logic;
  signal wishbone_err   : std_logic;
  signal wishbone_cyc   : std_logic;
  signal wishbone_adr   : std_logic_vector(31 downto 0);
  signal wishbone_dat_w : std_logic_vector(31 downto 0);
  signal wishbone_dat_r : std_logic_vector(31 downto 0);

  signal sink_valid : std_logic;
  signal sink_ready : std_logic;
  signal sink_data  : std_logic_vector(15 downto 0);

  signal source_valid : std_logic;
  signal source_ready : std_logic;
  signal source_data  : std_logic_vector(7 downto 0);

begin

  --=========================================================================--
  -- Sys Clock / Reset Generation
  --=========================================================================--
  p_sys_clock : process
  begin
    while true loop
      wait for 5 ns;
      sys_clock <= not sys_clock;
    end loop;
  end process;

  p_sys_reset : process
  begin
    sys_reset <= '1';
    wait for 100 ns;
    sys_reset <= '0';
    wait;
  end process;

  --=========================================================================--
  -- Encoder Clock / Reset Generation
  --=========================================================================--
  p_encoder_clock : process
  begin
    while true loop
      wait for 5 ns;
      encoder_clock <= not encoder_clock;
    end loop;
  end process;

  p_encoder_reset : process
  begin
    encoder_reset <= '1';
    wait for 100 ns;
    encoder_reset <= '0';
    wait;
  end process;

  --=========================================================================--
  -- Encoder Core (generated with gen_core.py)
  --=========================================================================--
  core : entity work.core
    port map (
      sys_clock => sys_clock,
      sys_reset => sys_reset,
      
      encoder_clock => encoder_clock,
      encoder_reset => encoder_reset,
      
      wishbone_stb   => wishbone_stb,
      wishbone_sel   => wishbone_sel,
      wishbone_we    => wishbone_we,
      wishbone_ack   => wishbone_ack,
      wishbone_err   => wishbone_err,
      wishbone_cyc   => wishbone_cyc, 
      wishbone_adr   => wishbone_adr,
      wishbone_dat_w => wishbone_dat_w,
      wishbone_dat_r => wishbone_dat_r,
  
      sink_valid => sink_valid,
      sink_ready => sink_ready,
      sink_data  => sink_data,
  
      source_valid => source_valid,
      source_ready => source_ready,
      source_data  => source_data
    );

  --=========================================================================--
  -- Encoder Init
  --=========================================================================--
  p_encoder_init : process
  begin
    wishbone_stb   <= '0';
    wishbone_sel   <= X"f";
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wishbone_adr   <= X"0000_0000";
    wishbone_dat_w <= X"0000_0000";
    wait for 1000 ns;

    -- configure luma/chroma ram (quality = 100) & start
    -- auto-generated from gen_wishone.py

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000040";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000041";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000042";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000043";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000044";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000045";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000046";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000047";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000048";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000049";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000004a";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000004b";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000004c";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000004d";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000004e";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000004f";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000050";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000051";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000052";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000053";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000054";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000055";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000056";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000057";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000058";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000059";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000005a";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000005b";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000005c";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000005d";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000005e";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000005f";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000060";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000061";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000062";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000063";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000064";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000065";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000066";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000067";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000068";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000069";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000006a";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000006b";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000006c";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000006d";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000006e";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000006f";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000070";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000071";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000072";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000073";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000074";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000075";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000076";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000077";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000078";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000079";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000007a";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000007b";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000007c";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000007d";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000007e";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000007f";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000080";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000081";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000082";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000083";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000084";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000085";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000086";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000087";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000088";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000089";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000008a";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000008b";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000008c";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000008d";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000008e";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000008f";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000090";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000091";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000092";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000093";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000094";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000095";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000096";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000097";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000098";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000099";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000009a";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000009b";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000009c";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000009d";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000009e";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"0000009f";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000a0";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000a1";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000a2";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000a3";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000a4";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000a5";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000a6";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000a7";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000a8";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000a9";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000aa";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000ab";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000ac";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000ad";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000ae";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000af";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000b0";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000b1";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000b2";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000b3";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000b4";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000b5";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000b6";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000b7";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000b8";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000b9";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000ba";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000bb";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000bc";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000bd";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000be";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"000000bf";
    wishbone_dat_w <= X"00000001";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000001";
    wishbone_dat_w <= X"00400040";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);
    

    wishbone_stb   <= '1';
    wishbone_we    <= '1';
    wishbone_cyc   <= '1';
    wishbone_adr   <= X"00000000";
    wishbone_dat_w <= X"00000007";
    wait until rising_edge(wishbone_ack);
    wishbone_stb   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wait until rising_edge(sys_clock);

    wait;
  end process;

  --=========================================================================--
  -- Sink
  --=========================================================================--
  p_sink : process
    variable i: natural;
  begin
    i := 0;
    sink_valid     <= '0';
    sink_data      <= X"0000";
    while true loop
      wait until rising_edge(sys_clock);
      sink_valid <= '1';
      if sink_ready = '1' then
        if (i mod 128) = 0 then
           sink_data <= X"8000";
        elsif (i mod 128) = 64 then
           sink_data <= X"80ff";
        end if;
        i := i + 1;
      end if;
    end loop;
    wait;
  end process;

  --=========================================================================--
  -- Source (Write data to file)
  --=========================================================================--
  p_source : process
    file file_log   : text;
    variable v_line : line;
  begin
    source_ready <= '1';
    wait until rising_edge(encoder_clock) and encoder_reset = '0';
    file_open(file_log, "tb_core.out", write_mode);
    while true loop
      wait until rising_edge(encoder_clock);
      if source_valid = '1' and source_ready = '1' then
        HWrite(v_line, source_data);
        WriteLine(file_log, v_line);
      end if;
    end loop;
  end process;

end test;
