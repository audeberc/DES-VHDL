LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY topmodulebench IS
END topmodulebench;
 
ARCHITECTURE behavior OF topmodulebench IS 
 
    COMPONENT topmodule
    PORT(
         start : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         data_l : IN  std_logic_vector(28 downto 1);
         data_r : IN  std_logic_vector(28 downto 1);
         rotated_out_l : OUT  std_logic_vector(28 downto 1);
         rotated_out_r : OUT  std_logic_vector(28 downto 1)
        );
    END COMPONENT;
    

   --Inputs
   signal start : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';
   signal data_l : std_logic_vector(28 downto 1) := (others => '0');
   signal data_r : std_logic_vector(28 downto 1) := (others => '0');

 	--Outputs
   signal rotated_out_l : std_logic_vector(28 downto 1);
   signal rotated_out_r : std_logic_vector(28 downto 1);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: topmodule PORT MAP (
          start => start,
          clk => clk,
          rst => rst,
          data_l => data_l,
          data_r => data_r,
          rotated_out_l => rotated_out_l,
          rotated_out_r => rotated_out_r
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
		rst <= '0';
		start<='1';
		data_l <= "101010101010101010101000010";
      wait for clk_period*10;
		

      -- insert stimulus here 

      wait;
   end process;

END;
