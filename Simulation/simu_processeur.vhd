
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simu_processeur is
--  Port ( );
end simu_processeur;

architecture Behavioral of simu_processeur is


signal CLK :  STD_LOGIC:='1';
signal HALT :  STD_LOGIC;
signal RES :  STD_LOGIC_VECTOR ( 15 downto 0 );
signal RESET :  STD_LOGIC:='0';
signal START :  STD_LOGIC;
signal input_pins :  STD_LOGIC_VECTOR ( 15 downto 0 );
signal n :  STD_LOGIC;
signal output_pins :  STD_LOGIC_VECTOR ( 15 downto 0 );
signal p :  STD_LOGIC;
signal z :  STD_LOGIC;

begin

micr_proc : entity work. micro_processeur_wrapper
            port map(CLK, HALT, RES, RESET, START, input_pins,  n, output_pins, p,z);
            
CLK <= not CLK after 10ns;
RESET <= '1' after 20ns;
Start <= '0', '1' after 30ns, '0' after 60ns;
input_pins <= x"ABCD";
end Behavioral;
