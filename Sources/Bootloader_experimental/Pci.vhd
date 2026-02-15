

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity Pci is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           INC_Pci : in STD_LOGIC;
           COUNTER : out STD_LOGIC_VECTOR (15 downto 0));
end Pci;

architecture Behavioral of Pci is
signal adr_pci : STD_LOGIC_VECTOR (15 downto 0);
begin
process(Clk, Reset)
begin
    if Reset = '0' then adr_pci <= (others => '0'); 
    elsif rising_edge(Clk) then
    if INC_Pci = '1' then adr_pci <= adr_pci +1;   end if;
    end if;
end process;
COUNTER <= adr_pci;
end Behavioral;
