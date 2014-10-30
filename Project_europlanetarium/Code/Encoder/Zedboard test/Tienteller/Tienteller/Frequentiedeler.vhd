----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:26 10/02/2014 
-- Design Name: 
-- Module Name:    Frequentiedeler - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Frequentiedeler is
    Port ( ClockIn : in  STD_LOGIC;
           ClockOut : out  STD_LOGIC);
end Frequentiedeler;

architecture Behavioral of Frequentiedeler is
	signal Teller : integer range 0 to 99999999 := 0;
	signal ClockoutSig : std_logic :='0';
	
begin

Process(ClockIn)
Begin
	If Rising_edge(ClockIn) and Teller = 99999999 then
			ClockOutSig <= not ClockOutSig;
			Teller <= 0;
		else
			Teller <= Teller + 1;
	end if;
End Process;

ClockOut <= ClockOutSig;

end Behavioral;

