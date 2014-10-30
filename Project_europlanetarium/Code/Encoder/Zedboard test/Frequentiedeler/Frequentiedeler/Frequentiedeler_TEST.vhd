--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:05:16 10/02/2014
-- Design Name:   
-- Module Name:   F:/Project europlanetarium/Code/Encoder/Zedboard test/Frequentiedeler/Frequentiedeler/Frequentiedeler_TEST.vhd
-- Project Name:  Frequentiedeler
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Frequentiedeler
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Frequentiedeler_TEST IS
END Frequentiedeler_TEST;
 
ARCHITECTURE behavior OF Frequentiedeler_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Frequentiedeler
    PORT(
         ClockIn : IN  std_logic;
         ClockOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ClockIn : std_logic := '0';

 	--Outputs
   signal ClockOut : std_logic;

   -- Clock period definitions
	 constant ClockIn_period : time := 1 ns;
--	  constant ClockOut_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Frequentiedeler PORT MAP (
          ClockIn => ClockIn,
          ClockOut => ClockOut
        );

--    Clock process definitions
   ClockIn_process :process
   begin
		ClockIn <= '0';
		wait for ClockIn_period/2;
		ClockIn <= '1';
		wait for ClockIn_period/2;
   end process;
 
--   ClockOut_process :process
--   begin
--		ClockOut <= '0';
--		wait for ClockOut_period/2;
--		ClockOut <= '1';
--		wait for ClockOut_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for ClockIn_period*10;
		
      -- insert stimulus here 

      wait;
   end process;

END;
