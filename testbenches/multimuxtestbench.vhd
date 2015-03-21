
LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
ENTITY multimuxtestbench IS
END multimuxtestbench;
 
ARCHITECTURE behavior OF multimuxtestbench IS  
    COMPONENT multimux
    PORT(
         data_lh : IN  std_logic_vector(28 downto 1);
         data_rh : IN  std_logic_vector(28 downto 1);
         boucle_lh : IN  std_logic_vector(28 downto 1);
         boucle_rh : IN  std_logic_vector(28 downto 1);
         sel : IN  std_logic;
         out_lh : OUT  std_logic_vector(28 downto 1);
         out_rh : OUT  std_logic_vector(28 downto 1)
        );
    END COMPONENT;
    

   --Inputs
   signal data_lh : std_logic_vector(28 downto 1) := (others => '0');
   signal data_rh : std_logic_vector(28 downto 1) := (others => '0');
   signal boucle_lh : std_logic_vector(28 downto 1) := (others => '0');
   signal boucle_rh : std_logic_vector(28 downto 1) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal out_lh : std_logic_vector(28 downto 1);
   signal out_rh : std_logic_vector(28 downto 1);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multimux PORT MAP (
          data_lh => data_lh,
          data_rh => data_rh,
          boucle_lh => boucle_lh,
          boucle_rh => boucle_rh,
          sel => sel,
          out_lh => out_lh,
          out_rh => out_rh
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
	data_lh<=(others => '1');
	data_rh<=(others => '1');
	boucle_lh<=(others => '0');
	boucle_rh<=(others => '0');
	sel <= '0';
	wait for 100 ns ;
	sel <= '1';
	wait for 100 ns ;
	data_lh<=(others => '1');
	data_rh<=(others => '0');
	boucle_lh<=(others => '0');
	boucle_rh<=(others => '1');
	wait for 100 ns ;
	sel <= '0';
	
	

      wait;
   end process;

END;
