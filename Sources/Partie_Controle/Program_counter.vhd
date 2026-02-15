
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
--use IEEE.NUMERIC_STD.ALL;


entity Program_counter is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           INC : in STD_LOGIC;
           Fetch : in STD_LOGIC;
           JUMP : in STD_LOGIC;
           Adresse : in STD_LOGIC_VECTOR (11 downto 0);
           POINT : out STD_LOGIC_VECTOR (15 downto 0));
end Program_counter;

architecture Behavioral of Program_counter is
signal P: STD_LOGIC_VECTOR (15 downto 0);
signal Q: STD_LOGIC_VECTOR (15 downto 0);
begin
process(Clk, Reset)
begin
    if Reset = '0' then Q <= x"0001"; P <= x"0001" ;
    elsif rising_edge(Clk) then
        if JUMP = '1' then P <= "0000"& Adresse; Q <= "0000"& Adresse;
        elsif Fetch  ='1' then Q <= P; 
        elsif JUMP = '0' and INC = '1' then P <= P +1; 
        end if;
    end if;
end process;
POINT <= Q;
end Behavioral;
