library IEEE;															-- Bibliotheek ingeven waar de
use IEEE.std_logic_1164.all;											--VHDL codes zich bevinden.
use IEEE.std_logic_unsigned.all;

entity tienteller is														-- Beschrijving van schakeling.
	port(																	-- In en uitgangen weergeven.
        	drukknop, Clock:	in std_logic;
			teller:			out std_logic
	);
end tienteller;															-- Einde beschrijving.

architecture gedrag of tienteller is								-- Beschrijving van hardware.
signal tel: std_logic_vector(3 downto 0);							-- Opnoemen van interne signalen.

begin																		-- Begin hardware beschrijving.
process(drukknop, Clock, tel)											-- Process voor het tellen tot 10
	begin
		if drukknop = '0' then 	
			tel <= "0000";
			teller <= '1';
    elsif rising_edge(clock) then
		if tel = "1001" then
			teller <= '0';
			tel <= "0000";							
		else 
			tel <= tel + 1;
		end if;
	end if;
end process;															-- Einde process
end gedrag;																-- Einde hardware beschrijving.
