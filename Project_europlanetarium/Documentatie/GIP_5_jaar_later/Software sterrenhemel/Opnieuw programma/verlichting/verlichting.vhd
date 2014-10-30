library IEEE;																-- Bibliotheek ingeven waar de
use IEEE.std_logic_1164.all;												-- VHDL codes zich bevinden.
use IEEE.std_logic_unsigned.all;

entity verlichting is														-- Beschrijving van schakeling.
	port(																		-- In en uitgangen weergeven.
        		clock, clear	:in std_logic;
		code		:in std_logic_vector (5 downto 0);
		cassiopeia				:out std_logic;							-- Uitgangen voor sterrenbeelden.
		cepheus					:out std_logic;
		draak					:out std_logic;
		grote_beer				:out std_logic;
		kleine_beer				:out std_logic;
		poolster				:out std_logic;
		andromeda				:out std_logic;
		andromeda_alpha			:out std_logic;
		andromedanevel			:out std_logic;
		pegasus					:out std_logic;
		driehoek				:out std_logic;
		ram						:out std_logic;
		vissen					:out std_logic;
		walvis					:out std_logic;
		waterman				:out std_logic;
		jachthonden				:out std_logic;
		leeuw					:out std_logic;
		maagd					:out std_logic;
		raaf					:out std_logic;
		waterslang				:out std_logic;
		weegschaal				:out std_logic;
		ossehoeder				:out std_logic;
		noorderkroon			:out std_logic;
		slang					:out std_logic;
		perseus					:out std_logic;
		perseus_cluster			:out std_logic;
		voerman					:out std_logic;
		voerman_alpha			:out std_logic;
		stier					:out std_logic;
		stier_alpha				:out std_logic;
		stier_beta				:out std_logic;
		stier_pleiaden			:out std_logic;
		orion					:out std_logic;
		orion_beta				:out std_logic;
		orionnevel				:out std_logic;
		haas					:out std_logic;
		rivier					:out std_logic;
		grote_hond				:out std_logic;
		grote_hond_alpha		:out std_logic;
		kleine_hond				:out std_logic;
		kleine_hond_alpha		:out std_logic;
		tweelingen				:out std_logic;
		tweelingen_alpha		:out std_logic;
		kreeft					:out std_logic;
		krib					:out std_logic;
		hercules				:out std_logic;
		hercules_M13			:out std_logic;
		slangendrager			:out std_logic;
		schorpioen				:out std_logic;
		lier					:out std_logic;
		lier_alpha				:out std_logic;
		zwaan					:out std_logic;
		zwaan_alpha				:out std_logic;
		pijl					:out std_logic;
		dolfijn					:out std_logic;
		arend					:out std_logic;
		arend_alpha				:out std_logic;
		boogschutter			:out std_logic;
		steenbok				:out std_logic
      		);
end verlichting;																-- Einde beschrijving.

architecture gedrag of verlichting is	-- Beschrijving van de hardware.

signal signaal1			: std_logic;						-- Interne signalen weergeven.
signal code_intern		: std_logic_vector (63 downto 0);
signal Uitgang1			: std_logic;						-- Van iedere sterrenbeeld dat met
signal Uitgang2			: std_logic;						-- meerdere drukknoppen aangestuurd kan 
signal Uitgang3			: std_logic;						-- worden moeten we de drukknoppen een 
signal Uitgang4			: std_logic;						-- intern signaal toekennen.
signal Uitgang5			: std_logic;
signal Uitgang6			: std_logic;
signal Uitgang7			: std_logic;
signal Uitgang9			: std_logic;
signal Uitgang10		: std_logic;
signal Uitgang11		: std_logic;
signal Uitgang12		: std_logic;
signal Uitgang13		: std_logic;
signal Uitgang14		: std_logic;
signal Uitgang16		: std_logic;
signal Uitgang17		: std_logic;
signal Uitgang18		: std_logic;
signal Uitgang19		: std_logic;
signal Uitgang20		: std_logic;
signal Uitgang21		: std_logic;
signal Uitgang22		: std_logic;
signal Uitgang23		: std_logic;
signal Uitgang24		: std_logic;
signal Uitgang25		: std_logic;
signal Uitgang27		: std_logic;
signal Uitgang28		: std_logic;
signal Uitgang30		: std_logic;
signal Uitgang32		: std_logic;
signal Uitgang33		: std_logic;
signal Uitgang34		: std_logic;
signal Uitgang35		: std_logic;
signal Uitgang36		: std_logic;
signal Uitgang37		: std_logic;
signal Uitgang39		: std_logic;
signal Uitgang41		: std_logic;
signal Uitgang42		: std_logic;
signal Uitgang43		: std_logic;
signal Uitgang44		: std_logic;
signal Uitgang45		: std_logic;
signal Uitgang46		: std_logic;
signal Uitgang47		: std_logic;
signal Uitgang48		: std_logic;
signal Uitgang49		: std_logic;
signal Uitgang50		: std_logic;	-- Deze uitgang duid de circumpolaire sterrenbeelden aan.
signal Uitgang51		: std_logic;	-- Deze uitgang duid de herfststerrenhemel aan.
signal Uitgang52		: std_logic;	-- Deze uitgang duid de lentesterrenhemel aan.
signal Uitgang53		: std_logic;	-- Deze uitgang duid de wintersterrenhemel aan.
signal Uitgang54		: std_logic;	-- Deze uitgang duid de zomersterrenhemel aan.
signal Uitgang55		: std_logic;	-- Deze uitgang duid de winterzeshoek aan.
signal Uitgang56		: std_logic;	-- Deze uitgang duide de zomerdriehoek aan.

component klok is				-- Componenten oproepen die nodig zijn.
  	port(
        	Clock_in, reset:	in std_logic;
			Clock_uit:	out std_logic
      		);
	end component;

component branden is
	port(
		Clock, clear, drukknop:	in std_logic;
		branden:				out std_logic
      		);
	end component;

component knipperen is
	port(
		Clock, clear, drukknop:	in std_logic;
		knipperen:				out std_logic
      	);
	end component;

component decoder is
	port(
		code_in: 	in std_logic_vector (5 downto 0);
		code_uit:	out std_logic_vector (63 downto 0)
      	);
	end component;
	
begin																-- Begin hardware beschrijving.
cl: component klok												-- Inwendige klok van 50Mhz omzetten
	port map(														--naar een klok van 1Hz.
		Clock_in		=> clock,
		reset		=> clear,
		Clock_uit	=> signaal1
		);

ASCII: component decoder										-- Decoder van 6-bits naar 64-bits, elk bit
	port map(													--voor één drukknop.
		code_in	=> code,
		code_uit	=> code_intern
		);

Knop1: component branden										-- Iedere drukknop heeft zijn component
	port map(													-- om de sterrenbeelden aan te sturen.
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(0),
		branden		=> Uitgang1	
		);
Knop2: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(1),
		branden		=> Uitgang2
		);

Knop3: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(2),
		branden		=> Uitgang3
		);

Knop4: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(3),
		branden		=> Uitgang4
		);

Knop5: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(4),
		branden		=> Uitgang5
		);

Knop6: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(5),
		branden		=> Uitgang6
		);

Knop7: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(6),
		branden		=> Uitgang7
		);

Knop8: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(7),
		knipperen		=> andromedanevel							-- Toekennen van sterrenbeeld dat alleen
		);														--door deze drukknop gestuurd wordt.

Knop9: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(8),
		branden		=> Uitgang9
		);

Knop10: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(9),
		branden		=> Uitgang10
		);

 
Knop11: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop	=> code_intern(10),
		branden		=> Uitgang11
		);

Knop12: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(11),
		branden		=> Uitgang12
		);
		
Knop13: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(12),
		branden		=> Uitgang13
		);		

Knop14: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(13),
		branden		=> Uitgang14
		);
		

Knop16: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(15),
		branden		=> Uitgang16
		);

 
Knop17: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(16),
		branden		=> Uitgang17
		);

Knop18: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(17),
		branden		=> Uitgang18
		);

Knop19: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(18),
		branden		=> Uitgang19
		);

Knop20: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(19),
		branden		=> Uitgang20
		);

Knop21: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(20),
		branden		=> Uitgang21
		);			

Knop22: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(21),
		branden		=> Uitgang22
		);

 
Knop23: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(22),
		branden		=> Uitgang23
		);

Knop24: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(23),
		branden		=> Uitgang24
		);

Knop25: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(24),
		branden		=> Uitgang25
		);

Knop26: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(25),
		knipperen		=> perseus_cluster							-- Toekennen van sterrenbeeld dat alleen
		);														--	door deze drukknop gestuurd wordt.

Knop27: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(26),
		branden		=> Uitgang27
		);

Knop28: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(27),
		branden		=> Uitgang28
		);

 
Knop29: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(28),
		knipperen		=> stier_pleiaden						-- Toekennen van sterrenbeeld dat alleen
		);													-- door deze drukknop gestuurd wordt.

Knop30: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(29),
		branden		=> Uitgang30
		);

Knop31: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(30),
		knipperen		=> orionnevel							-- Toekennen van sterrenbeeld dat alleen
		);													-- door deze drukknop gestuurd wordt.

Knop32: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(31),
		branden		=> Uitgang32
		);

Knop33: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(32),
		branden		=> Uitgang33
		);

Knop34: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(33),
		branden		=> Uitgang34
		);

 
Knop35: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop	=> code_intern(34),
		branden		=> Uitgang35
		);

Knop36: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(35),
		branden		=> Uitgang36
		);

Knop37: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(36),
		branden		=> Uitgang37
		);

Knop38: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(37),
		knipperen		=> krib										-- Toekennen van sterrenbeeld dat alleen
		);														-- door deze drukknop gestuurd wordt.

Knop39: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(38),
		branden		=> Uitgang39
		);

Knop40: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(39),
		knipperen		=> hercules_M13							-- Toekennen van sterrenbeeld dat alleen
		);													-- door deze drukknop gestuurd wordt.

 
Knop41: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(40),
		branden		=> Uitgang41
		);

Knop42: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(41),
		branden		=> Uitgang42
		);

Knop43: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(42),
		branden		=> Uitgang43
		);

Knop44: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(43),
		branden		=> Uitgang44
		);

Knop45: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(44),
		branden		=> Uitgang45
		);

Knop46: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(45),
		branden		=> Uitgang46
		);

 
Knop47: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(46),
		branden		=> Uitgang47
		);

Knop48: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(47),
		branden		=> Uitgang48
		);

Knop49: component branden
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop		=> code_intern(48),
		branden		=> Uitgang49
		);

Knop50: component knipperen							-- Bij deze component gaan de uitgangen
	port map(										-- 10 seconden knipperen.
		Clock	=> signaal1,
		clear		=> clear,
		drukknop	=> code_intern(49),
		knipperen		=> Uitgang50
		);

Knop51: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop	=> code_intern(50),
		knipperen		=> Uitgang51
		);

Knop52: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop	=> code_intern(51),
		knipperen		=> Uitgang52
		);

 
Knop53: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop	=> code_intern(52),
		knipperen		=> Uitgang53
		);

Knop54: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop	=> code_intern(53),
		knipperen		=> Uitgang54
		);

Knop55: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop	=> code_intern(54),
		knipperen		=> Uitgang55
		);

Knop56: component knipperen
	port map(
		Clock	=> signaal1,
		clear		=> clear,
		drukknop	=> code_intern(55),
		knipperen		=> Uitgang56
		);

-- Alle sterrenbeelden die nog niet
--toegekend waren doordat ze met meerdere
--drukknoppen aangestuurd konden worden
--zijn hier toegekend aan hun drukknoppen
--in een OF relatie.

cassiopeia <= Uitgang1 or Uitgang50;		-- hoort bij de circumpolaire sterrenbeelden			
cepheus <= Uitgang2 or Uitgang50;				
draak <= Uitgang3 or Uitgang50;					
grote_beer <= Uitgang4 or Uitgang50;			
kleine_beer <= Uitgang5 or Uitgang50;			
poolster <= Uitgang6 or Uitgang50;
andromeda <= Uitgang7 or Uitgang51;			-- hoort bij de herststerrenhemel
andromeda_alpha <= Uitgang7 or Uitgang51;
pegasus <= Uitgang9 or Uitgang51;
driehoek <= Uitgang10 or Uitgang51;
ram <= Uitgang11 or Uitgang51;
vissen <= Uitgang12 or Uitgang51;
walvis <= Uitgang13 or Uitgang51;
waterman <= Uitgang14 or Uitgang51;
jachthonden  <= Uitgang16 or Uitgang52;		-- hoort bij de lentesterrenhemel
leeuw <= Uitgang17 or Uitgang52;			
maagd <= Uitgang18 or Uitgang52;			
raaf <= Uitgang19 or Uitgang52;				
waterslang <= Uitgang20 or Uitgang52;		
weegschaal <= Uitgang21 or Uitgang52;		
ossehoeder <= Uitgang22 or Uitgang52;		
noorderkroon <= Uitgang23 or Uitgang52;		
slang <= Uitgang24 or Uitgang52;			
perseus <= Uitgang25 or Uitgang53;			-- hoort bij de wintersterrenhemel
voerman <= Uitgang27 or Uitgang53;			
voerman_alpha <= Uitgang27 or Uitgang53 or Uitgang55;	
stier <= Uitgang28 or Uitgang53;						
stier_alpha <= Uitgang28 or Uitgang53 or Uitgang55;		
stier_beta <= Uitgang28 or Uitgang53;					
orion <= Uitgang30 or Uitgang53;						
orion_beta <= Uitgang30 or Uitgang53 or Uitgang55;		
haas <= Uitgang32 or Uitgang53;							
rivier <= Uitgang33 or Uitgang53;						
grote_hond <= Uitgang34 or Uitgang53;					
grote_hond_alpha <= Uitgang34 or Uitgang53 or Uitgang55;	
kleine_hond <= Uitgang35 or Uitgang53;					
kleine_hond_alpha <= Uitgang35 or Uitgang53 or Uitgang55; 
tweelingen <= Uitgang36 or Uitgang53;					
tweelingen_alpha <= Uitgang36 or Uitgang53 or Uitgang55;
kreeft <= Uitgang37 or Uitgang53;						
hercules <= Uitgang39 or Uitgang54;						-- hoort bij de zomersterrenhemel
slangendrager <= Uitgang41 or Uitgang54;				
schorpioen <= Uitgang42 or Uitgang54;					
lier <= Uitgang43 or Uitgang54;							
lier_alpha <= Uitgang43 or Uitgang54 or Uitgang56;		
zwaan <= Uitgang44 or Uitgang54;						
zwaan_alpha <= Uitgang44 or Uitgang54 or Uitgang56;		
pijl <= Uitgang45 or Uitgang54;							
dolfijn <= Uitgang46 or Uitgang54;						
arend <= Uitgang47 or Uitgang54;						 
arend_alpha <= Uitgang47 or Uitgang54 or Uitgang56;		 
boogschutter <= Uitgang48 or Uitgang54;					 
steenbok <= Uitgang49 or Uitgang54;						

end gedrag;						-- Einde beschrijving van hardware.
