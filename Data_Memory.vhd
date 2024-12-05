library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity Data_Memory is
		port
	(
		address : in std_logic_vector(7 downto 0);
		data_in : in std_logic_vector(7 downto 0);
		clock : in std_logic;
		writen : in std_logic;

		data_out : out std_logic_vector(7 downto 0)
	);
end Data_Memory;


architecture Arch_Data_Memory of Data_Memory is

	type rw_type is array (128 to 223) of std_logic_vector(7 downto 0);

   signal RW : rw_type;
	signal EN : std_logic;
	
begin

  enable : process (address)
  begin
    if ( (to_integer(unsigned(address)) >= 128) and
         (to_integer(unsigned(address)) <= 223)) then
      EN <= '1';
    else
      EN <= '0';
    end if;
end process;

memory : process (clock)
  begin
    if (clock'event and clock='1') then
       if (EN='1' and writen='1') then
        RW(to_integer(unsigned(address))) <= data_in;
       elsif (EN='1' and writen='0') then
             data_out <= RW(to_integer(unsigned(address)));
       end if;
    end if;
end process;
  	

end arch_Data_Memory;


