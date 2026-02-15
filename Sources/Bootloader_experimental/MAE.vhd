
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MAE is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Tick : in STD_LOGIC;
           Boot : in STD_LOGIC;
           RX_Bitstream : in STD_LOGIC;
           
           RAZ_COUNT : out STD_LOGIC;
           COUNT : out STD_LOGIC;
           nboctet : in STD_LOGIC_VECTOR (1 downto 0);
           
           update : out STD_LOGIC;
           octet : in STD_LOGIC;
           
           INC : out STD_LOGIC;
           COUNTER : in STD_LOGIC_VECTOR (15 downto 0);
           
           TX_IDLE : out STD_LOGIC;
           
           READY : out STD_LOGIC;
           Bitstream : out STD_LOGIC;
           
           fetch : out STD_LOGIC;
           code_len : in STD_LOGIC_VECTOR (15 downto 0));
end MAE;

architecture Behavioral of MAE is
type state is (S0, IDLE, VOID, UPDATE_SHIFT, COUNT_octets, INST_Ready, INC_PCi);
signal EP, EF : state := S0;
signal F : std_logic;
begin

    process(CLk, Reset) 
    begin   
        if Reset = '0' then EP <= S0;
        elsif rising_edge(Clk) then EP <= EF;
        end if;
    end process;
    fetch <= F  ;
    process(EP, Tick, Boot, RX_Bitstream, nboctet, octet, COUNTER, code_len)
    begin
    RAZ_COUNT <= '0';
    COUNT <= '0';
    update <= '0';
    INC <= '0';
    TX_IDLE <= '0';
    READY <= '0';
    Bitstream <= RX_Bitstream;
    F <= F ;
    
    case EP is 
    when S0 =>  F <= '0'; 
                if Boot = '1' then EF <= IDLE; end if;
    when IDLE => TX_IDLE <= '1';
                 if Tick = '1' and RX_Bitstream = '0' then EF <= VOID; 
                 elsif Code_len = COUNTER then EF <= S0;
                 end if;
    when VOID => if octet = '1' then EF <= COUNT_octets;
                 elsif Tick = '1' then EF <= UPDATE_SHIFT;
                 end if; 
    when UPDATE_SHIFT => update <= '1'; 
                         if octet = '1' then EF <= COUNT_octets;
                         else EF <= VOID; end if;
    when COUNT_octets =>  COUNT <= '1'; 
                          if Tick = '1' and RX_Bitstream = '1' then EF <= IDLE;
                          elsif nboctet = "10" then EF <= INST_Ready; end if;                     
    when INST_Ready => READY <= '1'; RAZ_COUNT <= '1'; F <= '1';
                       EF <= INC_PCi;
    when INC_PCi => INC <= '1'; EF <= IDLE;
    end case;
    end process;
end Behavioral;
