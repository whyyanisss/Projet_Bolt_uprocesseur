
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity Reg_ADR is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Decode : in STD_LOGIC;
           ADR : in STD_LOGIC_VECTOR (11 downto 0);
           Adresse : out STD_LOGIC_VECTOR (11 downto 0));
end Reg_ADR;

architecture Behavioral of Reg_ADR is

begin
process(Clk, Reset)
begin
    if Reset = '0' then Adresse <= (others => '0');
    elsif rising_edge(Clk) then
        if Decode = '1' then Adresse <= ADR;
        end if;
    end if;
end process;
end Behavioral;
