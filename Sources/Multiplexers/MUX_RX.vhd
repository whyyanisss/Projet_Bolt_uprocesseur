
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity MUX_RX is
    Port ( R : in STD_LOGIC;
           Acc : in STD_LOGIC_VECTOR (15 downto 0);
           Qpin_to_RAM : in STD_LOGIC_VECTOR (15 downto 0);
           Data : out STD_LOGIC_VECTOR (15 downto 0));
end MUX_RX;

architecture Behavioral of MUX_RX is

begin

with R select Data <= 
Qpin_to_RAM when '1' ,
Acc when others;
end Behavioral;
