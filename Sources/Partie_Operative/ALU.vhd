
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity ALU is
    Port ( Val : in STD_LOGIC_VECTOR (15 downto 0);
           Acc : in STD_LOGIC_VECTOR (15 downto 0);
           Opcode : in STD_LOGIC_VECTOR (3 downto 0);
           Result : out STD_LOGIC_VECTOR (15 downto 0);
           z : out STD_LOGIC;
           n : out STD_LOGIC;
           p : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is
signal R :  STD_LOGIC_VECTOR (15 downto 0);
signal ZERO : STD_LOGIC;
begin

process(Opcode,Val, Acc)
begin
       case Opcode is
       when "0000" =>  R <= Val ;                   --INIT (Valeur imediate non signé!)
       when "0001" =>  R <= Val ;                   --Load (RAM)
       when "0111" =>  R <= Val + Acc;              --ADD
       when "1000" =>  R <= Acc - Val;              --SUB
       when "1001" =>  R <= Val(7 downto 0)*Acc(7 downto 0) ;               --MULT
       when "1010" =>  R <= Val AND Acc;            --AND
       when "1011" =>  R <= Not Acc;                --NOT
       when "1100" =>  R <= Val Xor Acc;            --XOR
       when "1101" =>  R <= Acc(14 downto 0)&'0' ;  --Shift left
       when "1110" =>  R <= '0'&Acc(15 downto 1) ;  --Shift right
       when others =>  R <= Acc;
       end case;
end process;
Result <= R;
ZERO <= '1' when Acc = x"0000" else '0';
z <= ZERO;
n <= Acc(7);
p <= (not Acc(7)) and (not ZERO);
end Behavioral;
