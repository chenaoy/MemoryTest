library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Output_ports is
	port
	(
		-- Input ports
		clock, reset, writen	: in  std_logic;
      address, data_in : in std_logic_vector(7 downto 0);
		
		-- Output ports
		port_out_00, port_out_01	: out std_logic_vector(7 downto 0)		
	);
end Output_ports;

architecture arch_Outports of Output_ports is

	
begin

-- port_out_00 description : ADDRESS x"E0"
U3 : process (clock, reset)
begin
if (reset = '0') then
port_out_00 <= x"00";
elsif (clock'event and clock='1') then
if (address = x"E0" and writen = '1') then
port_out_00 <= data_in;
end if;
end if;
end process;

-- port_out_01 description : ADDRESS x"E1"
U4 : process (clock, reset)
begin
if (reset = '0') then
port_out_01 <= x"00";
elsif (clock'event and clock='1') then
if (address = x"E1" and writen = '1') then
port_out_01 <= data_in;
end if;
end if;
end process;
	
end arch_Outports;


