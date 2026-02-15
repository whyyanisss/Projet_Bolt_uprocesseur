
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity Reg_Write is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           W : in STD_LOGIC;
           DRAM_to_pin : in STD_LOGIC_VECTOR (15 downto 0);
           QRAM_to_pin : out STD_LOGIC_VECTOR (15 downto 0));
end Reg_Write;

architecture Behavioral of Reg_Write is

begin

process(Clk, Reset)
begin
    if Reset = '0' then QRAM_to_pin <= (others => '0') ;
    elsif rising_edge(Clk) then 
        if W = '1' then QRAM_to_pin <= DRAM_to_pin; end if;
    end if;
end process;
end Behavioral;
