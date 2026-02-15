
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;


entity MUX is
    Port ( Dout : in STD_LOGIC_VECTOR (15 downto 0);
           Adresse : in STD_LOGIC_VECTOR (11 downto 0);
           INIT : in STD_LOGIC;
           Val : out STD_LOGIC_VECTOR (15 downto 0));
end MUX;

architecture Behavioral of MUX is 
signal Valeur_imediate : STD_LOGIC_VECTOR (15 downto 0);
begin

Valeur_imediate <= "0000" & Adresse;

with INIT select Val <= 
Valeur_imediate when '1',
Dout when others;

end Behavioral;

