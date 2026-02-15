
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;


entity RAM is
    Port ( Store : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (15 downto 0);
           Adresse : in STD_LOGIC_VECTOR (11 downto 0);
           Dout : out STD_LOGIC_VECTOR (15 downto 0));
end RAM;

architecture Behavioral of RAM is 
type tableau is array (0 to (2**12) - 1) of std_logic_vector(15 downto 0);
signal MEM : tableau := (others => (others => '0'));
begin

process(Store, data, Adresse )
begin
    if Store = '1' then  MEM(conv_integer(Adresse)) <= data ;
    else
    Dout <= MEM(conv_integer(Adresse));
    end if;
end process;
end Behavioral;
