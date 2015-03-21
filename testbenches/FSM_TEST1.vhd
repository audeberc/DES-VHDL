LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FSM_TEST1 IS
END FSM_TEST1;
 
ARCHITECTURE behavior OF FSM_TEST1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM
    PORT(
         start : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         --etat : OUT  unsigned(4 downto 1);
			num_rot , en_rot : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal start : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';
    	--Outputs
 --  signal ----etat : unsigned(4 downto 1);

signal en_rot: std_logic ;
signal num_rot: std_logic ;

   -- Clock period definitions
	constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM PORT MAP (
          start => start,
          clk => clk,
          rst => rst,
			 num_rot=>num_rot,
			 en_rot=>en_rot
          ----etat => --etat
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst<='0';
		start <= '1';
		wait for 250 ns;
	
		
      

      -- insert stimulus here 

      wait;
   end process;

END;
