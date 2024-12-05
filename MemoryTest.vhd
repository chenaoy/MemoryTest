library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryTest is
    
    port
    (
        -- Input ports
        address, data_in    : in  std_logic_vector (7 downto 0);
        port_in_00, port_in_01, port_in_02, port_in_03,
        port_in_04, port_in_05, port_in_06, port_in_07,
        port_in_08, port_in_09, port_in_10, port_in_11,
        port_in_12, port_in_13, port_in_14, port_in_15  : in std_logic_vector(7 downto 0);
        clock, reset, writen : in std_logic;

        -- Output ports
        port_out_00, port_out_01    : out std_logic_vector(7 downto 0);
        O0, O1, O2, O3 : out std_logic_vector(6 downto 0)
    );
end MemoryTest;


architecture arch_memorytest of MemoryTest is

    component FullMemory 
        port
        (
            -- Input ports
            address, data_in    : in  std_logic_vector (7 downto 0);
            port_in_00, port_in_01, port_in_02, port_in_03,
            port_in_04, port_in_05, port_in_06, port_in_07,
            port_in_08, port_in_09, port_in_10, port_in_11,
            port_in_12, port_in_13, port_in_14, port_in_15  : in std_logic_vector(7 downto 0);
            clock, reset, writen : in std_logic;

            -- Output ports
            data_out, port_out_00, port_out_01    : out std_logic_vector(7 downto 0)
        );
    end component;
    
    component FullDeco
        port
        (
            -- Input ports
            A, B, C, D    : in  std_logic;

            -- Output ports
            S    : out std_logic_vector(6 downto 0)

        );
    end component;

    signal T: std_logic_vector(7 downto 0);
    --signal T0, T1, T2, T3, T4, T5, T6, T7 : std_logic;

begin

    U0 : FullMemory port map (address, data_in, port_in_00, port_in_01, port_in_02, port_in_03,
                                 port_in_04, port_in_05, port_in_06, port_in_07,
                                 port_in_08, port_in_09, port_in_10, port_in_11,
                                 port_in_12, port_in_13, port_in_14, port_in_15,
                                 clock, reset, writen, 
                                 T, port_out_00, port_out_01);
                                 
    U1 : FullDeco port map (T(7), T(6), T(5), T(4), O0);
    U2 : FullDeco port map (T(3), T(2), T(1), T(0), O1);
    U3 : FullDeco port map (address(7), address(6), address(5), address(4), O2);
    U4 : FullDeco port map (address(3), address(2), address(1), address(0), O3);


end arch_memorytest;