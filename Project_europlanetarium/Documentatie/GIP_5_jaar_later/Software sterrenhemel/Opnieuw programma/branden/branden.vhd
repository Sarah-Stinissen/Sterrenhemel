library IEEE;															-- Bibliotheek ingeven waar de 
use IEEE.std_logic_1164.all; 											--VHDL codes zich bevinden.	
use IEEE.std_logic_unsigned.all;

entity branden is														-- Beschrijving van schakeling.
	port(																	-- In en uitgangen weergeven.
        	Clock, clear, drukknop:	in std_logic;
			branden:				out std_logic
      	);
end branden;															-- Einde beschrijving.
	
architecture gedrag of branden is								-- Beschrijving van hardware.
signal signaal2: std_logic;											-- Opnoemen van interne signalen.

component tienteller is												-- Beschrijven van component.
  	port(																	-- In- en uitgangen weergeven.
        	drukknop, Clock:	in std_logic;
			teller:		out std_logic
		);
end component;														-- Einde beschrijving component.
	
begin																		-- Begin hardware beschrijving.
teller: component tienteller										-- Oproepen van component.
	port map(															-- Toekennen van in- en uitgangen.
	drukknop	=> drukknop,
	Clock	=> Clock,
	teller	=> signaal2
	);																		-- Einde van toekennen.
branden <= signaal2 and clear;	-- And relatie van reset en uitgang van de teller met als uitgang “branden”.
end gedrag;																-- Einde hardware beschrijving.
