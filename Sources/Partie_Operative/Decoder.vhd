
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Decoder is
    Port ( INST : in STD_LOGIC_VECTOR (15 downto 0);
           z,n,p : in STD_LOGIC;
           Opcode : out STD_LOGIC_VECTOR (3 downto 0);
           ADR : out STD_LOGIC_VECTOR (11 downto 0);
           INIT : out STD_LOGIC;
           Store : out STD_LOGIC;
           JUMP : out STD_LOGIC;
           HALT : out STD_LOGIC;
           R, W : out STD_LOGIC
           );
end Decoder;

architecture Behavioral of Decoder is

begin

Opcode <= INST(15 downto 12);
ADR <= INST(11 downto 0);
INIT <= '1' when INST(15 downto 12) = "0000" else '0';
Store <= '1' when INST(15 downto 12) = "0010" else '0';
JUMP <= '1' when INST(15 downto 12) = "0011" or (INST(15 downto 12) = "0100" AND z = '1') or (INST(15 downto 12) = "0101" AND n = '1') or (INST(15 downto 12) = "0110" AND p = '1') else '0';
HALT <= '1' when INST(15 downto 12) = "1111" else '0';
R <= '1' when INST(15 downto 12) = "0010" AND INST(11 downto 0) = x"FFE" else '0';
W <= '1' when INST(15 downto 12) = "0010" AND INST(11 downto 0) = x"FFF" else '0';
end Behavioral;

