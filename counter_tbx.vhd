--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:19:55 07/01/2016
-- Design Name:   
-- Module Name:   C:/users/ALU/counter_tbx.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
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
 
ENTITY counter_tbx IS
END counter_tbx;
 
ARCHITECTURE behavior OF counter_tbx IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         CLOCK : IN  std_logic;
         DIRECTION : IN  std_logic;
         COUNT_OUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal DIRECTION : std_logic := '0';

 	--Outputs
   signal COUNT_OUT : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          CLOCK => CLOCK,
          DIRECTION => DIRECTION,
          COUNT_OUT => COUNT_OUT
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLOCK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
