----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.04.2022 15:47:20
-- Design Name: 
-- Module Name: demosaic_tb - testbench
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity demosaic_tb is
    --  Port ( );
end demosaic_tb;

architecture testbench of demosaic_tb is

type sm_state_type is (ST_IDLE, ST_BEGIN, ST_SEND, ST_EOL);
signal sm_state				: sm_state_type := ST_IDLE;

constant ACLK_PERIODE : time := 6.25 ns;
constant RST : std_logic := '1'; 
constant C_IN_TYPE : integer := 1;
constant height : integer := 1079;
constant width : integer := 1919;

signal aclk : std_logic := '1';
signal axis_out_tready : std_logic := 'X';
signal axis_out_tvalid : std_logic;
signal axis_out_tdata : std_logic_vector (15 downto 0);

signal axis_out_tuser : std_logic;
signal axis_out_tlast : std_logic;

signal x_cnt : integer := 0;
signal y_cnt : integer := 0;

component axis_raw_demosaic_v1_0 is
    port (
        axis_aclk				: in  STD_LOGIC;
        axis_aresetn			: in  STD_LOGIC;

        colors_mode				: in  STD_LOGIC;

        s_axis_tready			: out STD_LOGIC;
        s_axis_tdata			: in  STD_LOGIC_VECTOR(C_IN_TYPE*16-1 downto 0);
        s_axis_tuser			: in  STD_LOGIC;
        s_axis_tlast			: in  STD_LOGIC;
        s_axis_tvalid			: in  STD_LOGIC;

        m_axis_tvalid			: out STD_LOGIC;
        m_axis_tdata			: out STD_LOGIC_VECTOR(C_IN_TYPE*32-1 downto 0);
        m_axis_tuser			: out STD_LOGIC;
        m_axis_tlast			: out STD_LOGIC;
        m_axis_tready			: in  STD_LOGIC := '1'
    );
end component;
    begin

UUT : axis_raw_demosaic_v1_0 
    port map (
        axis_aclk			=> aclk,
        axis_aresetn		=> '1',

        colors_mode			=> '0',

        s_axis_tready		=> axis_out_tready,
        s_axis_tdata		=> axis_out_tdata,
        s_axis_tuser		=> axis_out_tuser,
        s_axis_tlast		=> axis_out_tlast,
        s_axis_tvalid		=> axis_out_tvalid, 

        m_axis_tvalid		=> open,
        m_axis_tdata		=> open,
        m_axis_tuser		=> open,
        m_axis_tlast		=> open,
        m_axis_tready		=> open
    );
    
aclk <= not aclk after ACLK_PERIODE / 2;


process (aclk)
begin

    if (aclk'event and aclk = '1') then
    
        if (sm_state = ST_BEGIN) then
            if (axis_out_tready = '1') then
                axis_out_tuser <= '1';
                axis_out_tdata <= x"0001";
                axis_out_tvalid <= '1';
                sm_state <= ST_SEND;
            end if;
        end if;

        if (sm_state = ST_SEND) then
            if (axis_out_tready = '1') then
                axis_out_tvalid <= '1';        
                axis_out_tuser <= '0';
                axis_out_tdata <= std_logic_vector( unsigned(axis_out_tdata) + 1 );
            
                if (x_cnt < width) then
                    x_cnt <= x_cnt + 1;
                else
                    x_cnt <= 0;
                    y_cnt <= y_cnt + 1;
                    axis_out_tlast <= '1';
                    sm_state <= ST_EOL;
                end if;
            end if;
            
        end if;    
        
        if (sm_state = ST_EOL) then
            if (axis_out_tready = '1') then
                axis_out_tvalid <= '0';
                axis_out_tlast <= '0';
                
                if (y_cnt > height) then
                    y_cnt <= 0;
                    x_cnt <= 0;
                    sm_state <= ST_IDLE;
                else 
                    sm_state <= ST_SEND;
                end if;
            end if;
        end if;
    
        if (sm_state = ST_IDLE) then
            axis_out_tlast <= '0';
            axis_out_tvalid <= '0';
            axis_out_tuser <= '0';
            axis_out_tdata <= x"0000";
            if (axis_out_tready = '1') then
                sm_state <= ST_BEGIN after 10ns;
            end if;
        end if;
        
    end if;

end process;


end testbench;
