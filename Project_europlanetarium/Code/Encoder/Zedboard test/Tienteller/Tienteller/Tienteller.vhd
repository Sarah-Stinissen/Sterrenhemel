----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:40:59 10/20/2014 
-- Design Name: 
-- Module Name:    Tienteller - Behavioral 
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

entity Tienteller is
    Port ( CodeIN : in  STD_LOGIC_VECTOR (5 downto 0);
           CodeOUT : out  STD_LOGIC_VECTOR (5 downto 0));
end Tienteller;

architecture Behavioral of Tienteller is

	component Frequentiedeler is 
		Port( ClockIn : in  STD_LOGIC;
           ClockOut : out  STD_LOGIC);
	end component;
signal code :std_logic_vector (5 downto 0);
signal teller : integer range 0 to 9 :=0;

begin


end Behavioral;

