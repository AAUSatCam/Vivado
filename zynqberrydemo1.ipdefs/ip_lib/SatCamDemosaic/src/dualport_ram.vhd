----------------------------------------------------------------------------------
-- Description: Modified dualport ram block (Increased in size).
-- Author: Stephan
-- (Based on design made by Oleksandr Kiyenko @ Trenz)
----------------------------------------------------------------------------------
library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.STD_LOGIC_unsigned.all;
----------------------------------------------------------------------------------
entity dualport_ram is
generic (
    RAM_ADDR_BYTE_SIZE  : integer               := 11
);
port (
	clk		: in  STD_LOGIC;
	wea		: in  STD_LOGIC;
	addra	: in  STD_LOGIC_VECTOR(RAM_ADDR_BYTE_SIZE-1 downto 0); -- Input addresss
	addrb	: in  STD_LOGIC_VECTOR(RAM_ADDR_BYTE_SIZE-1 downto 0); -- Output address
	addrc	: in  STD_LOGIC_VECTOR(RAM_ADDR_BYTE_SIZE-1 downto 0); -- Output address
	dia		: in  STD_LOGIC_VECTOR(9 downto 0); -- Input data 
	dob		: out STD_LOGIC_VECTOR(9 downto 0); -- Output data
	doc		: out STD_LOGIC_VECTOR(9 downto 0) -- Output data
);
end dualport_ram;
----------------------------------------------------------------------------------
architecture dualport_ram_arch of dualport_ram is
type ram_type is array (4095 downto 0) of STD_LOGIC_VECTOR (9 downto 0);
signal ram : ram_type;
----------------------------------------------------------------------------------
attribute block_ram : boolean;
attribute block_ram of ram : signal is TRUE;
----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------
process (clk)
begin
	if (clk'event and clk = '1') then
		if (wea = '1') then
			ram(conv_integer(addra)) <= dia;
		end if;
		dob <= ram(conv_integer(addrb));
		doc <= ram(conv_integer(addrc));
	end if;
end process;
----------------------------------------------------------------------------------
end dualport_ram_arch;
