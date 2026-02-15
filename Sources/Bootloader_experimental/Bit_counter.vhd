
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity Bit_counter is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           update : in STD_LOGIC;
           octet : out  std_logic);
end Bit_counter;

architecture Behavioral of Bit_counter is
signal nb_bit : std_logic_vector(2 downto 0) ;
begin
process (Clk, Reset)
begin 
    if Reset = '0' then nb_bit <= (others => '0');
    elsif rising_edge(Clk) then 
        if update ='1' then nb_bit <= nb_bit +1 ; 
        ELSIF nb_bit = "111" then nb_bit <= (others => '0');  end if;
    end if; 
end process;
octet <= '1' when nb_bit = "111" else '0';
end Behavioral;
