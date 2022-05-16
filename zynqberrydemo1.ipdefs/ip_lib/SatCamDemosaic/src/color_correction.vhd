----------------------------------------------------------------------------------
-- Company: Stephan
-- Engineer: AAU
-- 
-- Create Date: 11.05.2022 14:33:27
-- Design Name: SatCamDemosaic
-- Module Name: color_correction - Behavioral
-- Project Name: AAU Sat cam
-- Description: Color correction block using constants. 
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity color_correction is
    Port ( M_select : in STD_LOGIC := '0';
           R_out : out STD_LOGIC_VECTOR (9 downto 0);
           G_out : out STD_LOGIC_VECTOR (9 downto 0);
           B_out : out STD_LOGIC_VECTOR (9 downto 0);
           R_in : in STD_LOGIC_VECTOR (9 downto 0);
           G_in : in STD_LOGIC_VECTOR (9 downto 0);
           B_in : in STD_LOGIC_VECTOR (9 downto 0));
end color_correction;

architecture Behavioral of color_correction is

type correction_array is array (0 to 1, 0 to 2, 0 to 2) of integer ;
signal corr : correction_array := ( ((1347, -130, -45), (-116, 1954, -5), (0, 67, 1648)) , (( 1024, 0, 0), (0, 1024, 0), (0, 0, 1024)) );
--signal corr : correction_array := ((0, 0, 0), (0, 0, 0), (0, 0, 1024));

signal R_out_calc : integer;
signal G_out_calc : integer;
signal B_out_calc : integer;
signal M_sel_int  : integer := 0;

begin
    --M_sel_int <= to_integer(unsigned(M_select));
    M_sel_int <= 1 when (M_Select = '1') else 0;

    R_out_calc <= (to_integer(unsigned(R_in)) * corr(M_sel_int, 0,0) + to_integer(unsigned(G_in)) * corr(M_sel_int, 0,1) + to_integer(unsigned(B_in)) * corr(M_sel_int, 0,2))/1024; 
    G_out_calc <= (to_integer(unsigned(R_in)) * corr(M_sel_int, 1,0) + to_integer(unsigned(G_in)) * corr(M_sel_int, 1,1) + to_integer(unsigned(B_in)) * corr(M_sel_int, 1,2))/1024;
    B_out_calc <= (to_integer(unsigned(R_in)) * corr(M_sel_int, 2,0) + to_integer(unsigned(G_in)) * corr(M_sel_int, 2,1) + to_integer(unsigned(B_in)) * corr(M_sel_int, 2,2))/1024;

    R_out <= std_logic_vector(to_unsigned(R_out_calc, R_out'length));
    G_out <= std_logic_vector(to_unsigned(G_out_calc, G_out'length));
    B_out <= std_logic_vector(to_unsigned(B_out_calc, B_out'length));

end Behavioral;
