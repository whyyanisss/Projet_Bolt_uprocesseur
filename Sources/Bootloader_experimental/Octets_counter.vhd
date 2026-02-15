
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity Octets_counter is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           COUNT : in STD_LOGIC;
           RAZ_count : in STD_LOGIC;
           nboctet : out STD_LOGIC_VECTOR (1 downto 0));
end Octets_counter;

architecture Behavioral of Octets_counter is
signal nb :  STD_LOGIC_VECTOR (1 downto 0);
begin
process (Clk, Reset)
begin 
    if Reset = '0' then nb <= (others => '0');
    elsif rising_edge(Clk) then 
        if RAZ_count = '1' then nb <= (others => '0');
        elsif COUNT = '1' then nb <= nb +1; 
        end if;
    end if; 
end process;
nboctet <= nb;
end Behavioral;
