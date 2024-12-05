library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity FullMemory is
	port
	(
		-- Input ports
		clock, reset, writen	: in  std_logic;
      address, data_in, port_in_00, port_in_01, port_in_02, port_in_03, port_in_04, port_in_05, port_in_06, port_in_07, port_in_08, port_in_09, port_in_10, port_in_11, port_in_12, port_in_13, port_in_14, port_in_15 : in std_logic_vector(7 downto 0);
		
		-- Output ports
		data_out, port_out_00, port_out_01	: out std_logic_vector(7 downto 0);
	   O0, O1, O2, O3 : out std_logic_vector (6 downto 0) 	
	);
end FullMemory;

architecture arch_FullMemory of FullMemory is

component memmory 
    Port (
        clock   : in  STD_LOGIC;
        --writen   : in  STD_LOGIC;
        address : in  STD_LOGIC_VECTOR (7 downto 0);
        --data_in : in  STD_LOGIC_VECTOR (7 downto 0);
        data_out: out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

component Dataout_Bus is

	port
	(
		
		address, rom_data_out, rw_data_out,
       port_in_00, port_in_01, port_in_02, port_in_03,
       port_in_04, port_in_05, port_in_06, port_in_07,
       port_in_08, port_in_09, port_in_10, port_in_11,
       port_in_12, port_in_13, port_in_14, port_in_15: in  std_logic_vector(7 downto 0);
		
		data_out	: out std_logic_vector(7 downto 0)

	);
end component;

component Data_Memory is
		port
	(
		address : in std_logic_vector(7 downto 0);
		data_in : in std_logic_vector(7 downto 0);
		clock : in std_logic;
		writen : in std_logic;

		data_out : out std_logic_vector(7 downto 0)
	);
end component;

component Output_ports is
	port
	(
		-- Input ports
		clock, reset, writen	: in  std_logic;
      address, data_in : in std_logic_vector(7 downto 0);
		
		-- Output ports
		port_out_00, port_out_01	: out std_logic_vector(7 downto 0)		
	);
end component;

signal S0, S1 :std_logic_vector(7 downto 0);

begin

U0 : memmory port map (clock, address, S0);
U1 : Data_Memory port map (address, data_in, clock, writen, S1);
U2 : Output_ports port map (clock, reset, writen, address, data_in, port_out_00, port_out_01);
U3 : Dataout_Bus port map (address, S0, S1, port_in_00, port_in_01, port_in_02, port_in_03, port_in_04, port_in_05, port_in_06, port_in_07, port_in_08, port_in_09, port_in_10, port_in_11, port_in_12, port_in_13, port_in_14, port_in_15, data_out);

end arch_FullMemory;
