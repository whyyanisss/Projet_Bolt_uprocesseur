
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
--use IEEE.NUMERIC_STD.ALL;


entity Reg_IR is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Fetch_data : in STD_LOGIC;
           Instruction : in STD_LOGIC_VECTOR (15 downto 0);
           INST : out STD_LOGIC_VECTOR (15 downto 0));
end Reg_IR;

architecture Behavioral of Reg_IR is

begin
process(Clk, Reset)
begin
    if Reset = '0' then INST <= (others => '0');
    elsif rising_edge(Clk) then
        if Fetch_data = '1' then INST <= Instruction;
        end if;
    end if;
end process;
end Behavioral;
