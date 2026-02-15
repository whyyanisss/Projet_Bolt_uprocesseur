
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity Reg_Read is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           R : in STD_LOGIC;
           Dpin_to_RAM : in STD_LOGIC_VECTOR (15 downto 0);
           Qpin_to_RAM : out STD_LOGIC_VECTOR (15 downto 0));
end Reg_Read;

architecture Behavioral of Reg_Read is

begin

process(Clk, Reset)
begin
    if Reset = '0' then Qpin_to_RAM <= (others => '0') ;
    elsif rising_edge(Clk) then 
        if R = '1' then Qpin_to_RAM <= Dpin_to_RAM; end if;
    end if;
end process;
end Behavioral;
