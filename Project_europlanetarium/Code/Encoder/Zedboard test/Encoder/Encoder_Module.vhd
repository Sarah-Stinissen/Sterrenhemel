----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:18:44 09/29/2014 
-- Design Name: 
-- Module Name:    Encoder_Module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Encoder_Module is
    Port ( InVertical : in  STD_LOGIC_VECTOR (6 downto 0);
           InHorizontal : in  STD_LOGIC_VECTOR (7 downto 0);
           OutCode : out  STD_LOGIC_VECTOR (5 downto 0));
end Encoder_Module;

architecture Behavioral of Encoder_Module is

begin

--MatrixCode die nog uitgezocht moet worden
OutCode <= "000000" when   InVertical = "1000000" and InHorizontal = "10000000" else   -- Andromeda en Andromeda Alpha
			  "000001" when	InVertical = "1000000" and InHorizontal = "01000000" else	-- Driehoek
			  "000010" when	InVertical = "" and InHorizontal = "" else	-- Kleine Hond en Kleine Hond Alpha
			  "000011" when	InVertical = "" and InHorizontal = "" else	-- Ossenhoeder
			  "000100" when	InVertical = "" and InHorizontal = "" else	-- Schorpioen
			  "000101" when	InVertical = "" and InHorizontal = "" else	-- Voerman en Voerman Alpha
			  "000110" when	InVertical = "" and InHorizontal = "" else	-- Poolster
			  "000111" when	InVertical = "" and InHorizontal = "" else	-- Circumpolaire Sterrenbeelden
			  "001000" when	InVertical = "0100000" and InHorizontal = "10000000" else	-- Arend en arend alpha
			  "001001" when	InVertical = "0100000" and InHorizontal = "01000000" else	-- Grote Beer
			  "001010" when	InVertical = "" and InHorizontal = "" else	-- Kreeft
			  "001011" when	InVertical = "" and InHorizontal = "" else	-- Pegasus
			  "001100" when	InVertical = "" and InHorizontal = "" else	-- Slang
			  "001101" when	InVertical = "" and InHorizontal = "" else	-- Walvis
			  "001110" when	InVertical = "" and InHorizontal = "" else	-- ????? Heck!!!! (andromedanevel?)
			  "001111" when	InVertical = "" and InHorizontal = "" else	-- Lentesterrenhemel
			  "010000" when	InVertical = "0010000" and InHorizontal = "10000000" else	-- Boogschutter
			  "010001" when	InVertical = "0010000" and InHorizontal = "01000000" else	-- Grote Hond
			  "010010" when	InVertical = "" and InHorizontal = "" else	-- Leeuw
			  "010011" when	InVertical = "" and InHorizontal = "" else	-- Perseus
			  "010100" when	InVertical = "" and InHorizontal = "" else	-- Slangendrager
			  "010101" when	InVertical = "" and InHorizontal = "" else	-- Waterman
			  "010110" when	InVertical = "" and InHorizontal = "" else	-- ????? Heck!!!! (Perseus open cluster?)
			  "010111" when 	InVertical = "" and InHorizontal = "" else	-- Zomersterrenhemel
			  "011000" when	InVertical = "0001000" and InHorizontal = "10000000" else	-- Cassiopeia
			  "011001" when	InVertical = "0001000" and InHorizontal = "01000000" else	-- Haas
			  "011010" when	InVertical = "" and InHorizontal = "" else	-- Lier en Lier Alpha
			  "011011" when	InVertical = "" and InHorizontal = "" else	-- Pijl
			  "011100" when	InVertical = "" and InHorizontal = "" else	-- Steenbok
			  "011101" when	InVertical = "" and InHorizontal = "" else	-- Waterslang
			  "011110" when	InVertical = "" and InHorizontal = "" else	-- ????? Heck!!!! (Oreon nevel?)
			  "011111" when	InVertical = "" and InHorizontal = "" else	-- Herfststerrenhemel
			  "100000" when	InVertical = "0000100" and InHorizontal = "10000000" else	-- Cepheus
			  "100001" when	InVertical = "0000100" and InHorizontal = "01000000" else	-- Hercules
			  "100010" when	InVertical = "" and InHorizontal = "" else	-- Maagd
			  "100011" when	InVertical = "" and InHorizontal = "" else	-- Raaf
			  "100100" when	InVertical = "" and InHorizontal = "" else	-- Stier
			  "100101" when	InVertical = "" and InHorizontal = "" else	-- Weegschaal
			  "100110" when	InVertical = "" and InHorizontal = "" else	-- ????? Heck!!!! (Hercules nevel?)
			  "100111" when	InVertical = "" and InHorizontal = "" else	-- Wintersterrenhemel
			  "101000" when	InVertical = "0000010" and InHorizontal = "10000000" else	-- Dolfijn
			  "101001" when	InVertical = "0000010" and InHorizontal = "01000000" else	-- Jachthonden
			  "101010" when	InVertical = "" and InHorizontal = "" else	-- Noorderkroon
			  "101011" when	InVertical = "" and InHorizontal = "" else	-- Ram
			  "101100" when	InVertical = "" and InHorizontal = "" else	-- Tweelingen
			  "101101" when	InVertical = "" and InHorizontal = "" else	-- Zwaan en Zwaan Alpha
			  "101110" when	InVertical = "" and InHorizontal = "" else	-- ????? Heck!!!! (pleiaden?)
			  "101111" when	InVertical = "" and InHorizontal = "" else	-- Zomersterrenhemel
			  "110000" when	InVertical = "0000001" and InHorizontal = "10000000" else	-- Draak
			  "110001" when	InVertical = "0000001" and InHorizontal = "01000000" else	-- Kleine Beer
			  "110010" when	InVertical = "" and InHorizontal = "" else	-- Orion en Orion Beta
			  "110011" when	InVertical = "" and InHorizontal = "" else	-- Rivier
			  "110100" when	InVertical = "" and InHorizontal = "" else	-- Vissen
	  	     "110101" when	InVertical = "" and InHorizontal = "" else	-- Extra knop
			  "110110" when	InVertical = "" and InHorizontal = "" else	-- ????? Heck!!!! (Krib?)
			  "110111" when	InVertical = "" and InHorizontal = "" else	-- wintersterrenhemel???
		--	  "111000" when	InVertical = "" and InHorizontal = "" else	-- 
		--	  "111001" when	InVertical = "" and InHorizontal = "" else	--
		--	  "111010" when	InVertical = "" and InHorizontal = "" else	--
		--	  "111011" when	InVertical = "" and InHorizontal = "" else	--
		--	  "111100" when	InVertical = "" and InHorizontal = "" else	--
		--	  "111101" when	InVertical = "" and InHorizontal = "" else	--
		--	  "111110" when	InVertical = "" and InHorizontal = "" else	--
			  "111111";
			  -- Voorlopig is de 'default-waarde' onbekend, maar daar geraken we wel nog uit. Bonne Chance!!!

end Behavioral;

