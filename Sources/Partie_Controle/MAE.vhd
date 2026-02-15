
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;

entity MAE is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Start : in STD_LOGIC;
           HALT : in STD_LOGIC;
           JUMP : in STD_LOGIC;
           Fetch : out STD_LOGIC;
           Fetch_data : out STD_LOGIC;
           Decode : out STD_LOGIC;
           Execute : out STD_LOGIC;
           INC : out STD_LOGIC);
end MAE;

architecture Behavioral of MAE is
type state is (SLEEP, FETCH_PC, FETCH_IR, DECODE_INST, EXECUTE_INST, UPDATE_PC);
signal EF,EP : state := SLEEP;
begin

process(Clk, Reset)
begin
    if Reset = '0' then EP <= SLEEP; 
    elsif rising_edge(Clk) then EP <= EF; end if;
end process;

process(EP, Start, JUMP, HALT)
begin

    Fetch   <= '0';
    Fetch_data <= '0';
    Decode <= '0';
    Execute <= '0';
    INC <= '0';
    
    case EP is
    when SLEEP          => if Start = '0' then EF <= SLEEP; else EF <= FETCH_PC; end if;
    when FETCH_PC       => Fetch <= '1'; EF <= FETCH_IR;
    when FETCH_IR       => Fetch_data <= '1'; EF <= DECODE_INST;
    when DECODE_INST    => Decode <= '1';  
                           if JUMP = '1' then EF <= FETCH_PC; 
                           else EF <= EXECUTE_INST; end if;
                           
    when EXECUTE_INST   => Execute <= '1';  
                           if HALT = '1' then  EF <= SLEEP; 
                           else EF <= UPDATE_PC;
                           end if;
    when UPDATE_PC     => EF <= FETCH_PC;
                          INC <= '1';
                            
    end case;      
end process;
end Behavioral;
