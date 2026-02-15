
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity Reg is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           tick : in STD_LOGIC;
           Ready : in STD_LOGIC;
           Bitstream : in STD_LOGIC;
           Bincode : out STD_LOGIC_VECTOR (15 downto 0));
end Reg;

architecture Behavioral of Reg is
signal bin_shift : STD_LOGIC_VECTOR(15 downto 0);
begin

 process(Clk, Reset)
 begin
    if Reset = '0' then  bin_shift <= (others => '0'); Bincode <= (others => '0');
    elsif rising_edge(Clk) then 
        if tick = '1' then 
        bin_shift <= Bitstream & bin_shift(15 downto 1);
        end if;
    elsif Ready = '1' then Bincode <= bin_shift; 
    end if;
 end process;

end Behavioral;
