library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity klok is
	port(
		clock_in, reset:	in std_logic;
		clock_uit:		out std_logic
		);
end klok;

architecture gedrag of klok is
	signal s_klok: std_logic; 
	
	begin
	deler: process(clock_in, reset, s_klok)
	variable cnt: integer :=0;
	
	begin
	if reset = '0' then
		cnt := 0;
		elsif clock_in'event and clock_in = '1' then
		if cnt = 25000000 then
			s_klok <= not s_klok;
			cnt := 0;
		else
			cnt := cnt +1;
			end if;
		end if;
		clock_uit <= s_klok;
		
	end process;
end gedrag;

			
			