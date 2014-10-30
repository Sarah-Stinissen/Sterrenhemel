library IEEE;														-- Bibliotheek ingeven waar de
use IEEE.std_logic_1164.all;										-- VHDL codes zich bevinden.
use IEEE.std_logic_unsigned.all;

entity knipperen is												-- Beschrijving van schakeling.
	port(																-- In en uitgangen weergeven.
        	Clock, clear, drukknop:	in std_logic;
	knipperen:				out std_logic
      	);
end knipperen;													-- Einde beschrijving.

architecture gedrag of knipperen is							-- Beschrijving van hardware.

signal signaal2: std_logic;										-- Opnoemen van interne signalen.

component tienteller is											-- Beschrijven van component.
  	port(																-- In- en uitgangen weergeven.
        drukknop, Clock:	in std_logic;
		teller:		out std_logic
		);
end component;													-- Einde beschrijving component.

begin																	-- Begin hardware beschrijving.

teller: component tienteller									-- Oproepen van component.
	port map(														-- Toekennen van in- en uitgangen.
		drukknop	=> drukknop,
		Clock	=> Clock,
		teller	=> signaal2
		);																-- Einde van toekennen.

knipperen <= signaal2 and clear and Clock;				-- And relatie van reset, uitgang van de 																		teller en de secondenklok met als 																				uitgang “led”.
end gedrag;															-- Einde hardware beschrijving.
