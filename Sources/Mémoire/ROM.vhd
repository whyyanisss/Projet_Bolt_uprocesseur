
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;


entity ROM is
    Port ( Point : in STD_LOGIC_VECTOR (15 downto 0);
           Instruction : out STD_LOGIC_VECTOR (15 downto 0));
end ROM;

architecture Behavioral of ROM is 
type tableau is array (0 to (2**16) - 1) of std_logic_vector(15 downto 0);
signal MEM : tableau := (others => (others => '0'));
begin

Instruction <= MEM(conv_integer(Point));

------------- CODE 5 + 3 -1   
--    
--0  INIT 5           000 00101  
--1  STORE x00        010 00000
--2  INIT 3           000 00011
--3  ADD x00          100 00000     RESULTAT = 8
--4  STORE x01        010 00001
--5  INIT 1           000 00001
--6  SUB x01          101 00001     RESULTAT = 7
-----------------------------

--MEM(0) <= "00000101";
--MEM(1) <= "01000000";
--MEM(2) <= "00000011";
--MEM(3) <= "10000000";
--MEM(4) <= "01000001";
--MEM(5) <= "00000001";
--MEM(6) <= "10100001";


------------- Test JUMP ====> Resultat = 0
--    
--0  INIT 5           000 00101  
--1  STORE x00        010 00000
--2  INIT 3           000 00011     RESULTAT = 3
--3  JUMP 6           011 00110
--4  ADD x00          100 00000     
--5  STORE x01        010 00001
--6  INIT 1           000 00001     RESULTAT = 1
--7  SUB x01          101 00001     RESULTAT = 0      SUB = Res - Acc 
-----------------------------

--MEM(0) <= "00000101";
--MEM(1) <= "01000000";
--MEM(2) <= "00000011";
--MEM(3) <= "01100110";
--MEM(4) <= "10000000";
--MEM(5) <= "01000001";
--MEM(6) <= "00000001";
--MEM(7) <= "10100001";


-------------------------------------------------------------
-- Multiplication + Shift + GPIO
-------------------------------------------------------------

-- 0  INIT 10          0000000000001010  (Acc = 10)
-- 1  STORE x005       0010000000000101  (RAM[5] = 10)
-- 2  INIT 3           0000000000000011  (Acc = 3)
-- 3  Jp 8             0110000000001001  (Jump ligne 9)
-- 4  MULT x005        1001000000000101  (Acc = 3 * 10 = 30)
-- 5  Shift Left       1101000000000000  (Acc = 30 * 2 = 60)
-- 6  XOR x005         1100000000000101  (Acc = 60 XOR 10)
-- 7  STORE xFFF       0010111111111111  (Envoi au GPIO)
-- 8  HALT             1111000000000000  (Fin du programme)
-- 9  Shift Right      1110000000000000





MEM(0) <= x"0" & x"00A";        -- INIT  10
MEM(1) <= x"2" & x"005";        -- STORE x005
MEM(2) <= x"0" & x"003";        -- INIT  x003
MEM(3) <= x"9" & x"005";        -- MULT  x005
MEM(4) <= x"2" & x"FFE";        -- STORE xFFE
MEM(5) <= x"1" & x"FFE";        -- LOAD  xFFE
MEM(6) <= x"F" & x"000";        -- HALT
end Behavioral;

