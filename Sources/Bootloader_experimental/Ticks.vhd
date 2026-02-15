library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Ticks is
    Port (
        clk       : in  STD_LOGIC;
        Reset     : in  STD_LOGIC;
        Bitstream_rx  : in  STD_LOGIC; 
        tick      : out STD_LOGIC 
    );
end Ticks;

architecture Behavioral of Ticks is
    constant MAX_COUNT_HALF : integer := 2604;
    constant MAX_COUNT_FULL : integer := 5208;
    
    signal counter : integer range 0 to MAX_COUNT_FULL := 0;
    type state_type is (IDLE, WAIT_HALF, WAIT_FULL);
    signal state : state_type := IDLE;

begin

    process(clk, Reset)
    begin
        -- CORRECTION : Reset Actif Bas ('0') pour correspondre au testbench
        if Reset = '0' then 
            state   <= IDLE;
            counter <= 0;
            tick    <= '0';
        elsif rising_edge(clk) then
            
            tick <= '0'; 

            case state is
                when IDLE =>
                    counter <= 0;
                    if Bitstream_rx = '0' then
                        state <= WAIT_HALF;
                    end if;

                -- Etat 2: Attente du milieu du Start Bit (2604 cycles)
                when WAIT_HALF =>
                    if counter >= MAX_COUNT_HALF - 1 then
                        counter <= 0;
                        -- CORRECTION ICI : On ne lève PAS le tick !
                        tick    <= '0'; 
                        -- On passe juste à l'attente du premier vrai bit
                        state   <= WAIT_FULL;
                    else
                        counter <= counter + 1;
                    end if;

                when WAIT_FULL =>
                    if counter >= MAX_COUNT_FULL - 1 then
                        counter <= 0;
                        tick    <= '1';
                    else
                        counter <= counter + 1;
                    end if;
            end case;

        end if;
    end process;

end Behavioral;