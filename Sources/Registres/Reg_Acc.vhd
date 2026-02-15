library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity Reg_Acc is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Result : in STD_LOGIC_VECTOR (15 downto 0);
           Execute : in STD_LOGIC;
           Acc : out STD_LOGIC_VECTOR (15 downto 0));
end Reg_Acc;

architecture Behavioral of Reg_Acc is

begin
process(Clk, Reset)
begin
    if Reset = '0' then Acc <= (others => '0');
    elsif rising_edge(Clk) then
        if Execute = '1' then Acc <= Result; 
        end if;
    end if;
end process;
end Behavioral;
