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
  signal wishbone_sel   : std_logic;
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
    wishbone_sel   <= '0';
    wishbone_we    <= '0';
    wishbone_cyc   <= '0';
    wishbone_adr   <= X"0000_0000";
    wishbone_dat_w <= X"0000_0000";
    wait for 1000 ns;
    wait;
  end process;

  --=========================================================================--
  -- Sink
  --=========================================================================--
  p_sink : process
  begin
    sink_valid     <= '0';
    sink_data      <= X"0000";
    wait;
  end process;

  --=========================================================================--
  -- Source
  --=========================================================================--
  p_source : process
  begin
    source_ready <= '0';
    wait;
  end process;

end test;
