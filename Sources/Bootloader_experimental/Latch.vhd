library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Latch is
    Port ( 
        Clk      : in  STD_LOGIC;
        Reset    : in  STD_LOGIC;
        Fetch    : in  STD_LOGIC;                     -- Signal venant de la MAE
        Bincode  : in  STD_LOGIC_VECTOR (15 downto 0);-- Donnée (Taille ou Instruction)
        Code_len : out STD_LOGIC_VECTOR (15 downto 0) -- Sortie verrouillée vers MAE
    );
end Latch;

architecture Behavioral of Latch is
    signal stored_len : STD_LOGIC_VECTOR(15 downto 0);
    signal fetch_prev : STD_LOGIC ;
begin

    process(Clk, Reset)
    begin
        if Reset = '0' then stored_len <= x"0001"; fetch_prev <= '0';
            
        elsif rising_edge(Clk) then
            if Fetch = '1' and fetch_prev = '0' then
                stored_len <= Bincode; 
            end if;
            fetch_prev <= Fetch;
        end if;
    end process;
    Code_len <= stored_len;

end Behavioral;