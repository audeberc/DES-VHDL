LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY pc2testbench IS
END pc2testbench;
 
ARCHITECTURE behavior OF pc2testbench IS 
    COMPONENT PC2
    PORT(
         subkey : OUT  std_logic_vector(48 downto 1);
         pc2_lh : IN  std_logic_vector(28 downto 1);
         pc2_rh : IN  std_logic_vector(28 downto 1)
        );
    END COMPONENT;
   --Inputs
   signal pc2_lh : std_logic_vector(28 downto 1) := (others => '0');
   signal pc2_rh : std_logic_vector(28 downto 1) := (others => '0');

 	--Outputs
   signal subkey : std_logic_vector(48 downto 1);
BEGIN
   uut: PC2 PORT MAP (
          subkey => subkey,
          pc2_lh => pc2_lh,
          pc2_rh => pc2_rh
        );
 
   stim_proc: process
   begin		

      wait for 10 ns;	
		pc2_lh<="0000000000000000000000000000";
		pc2_rh<="0000000000000000000000000001";
		wait for 3 ns;
			pc2_rh<="0000000000000000000000000010";
		wait for 3 ns;
			pc2_rh<="0000000000000000000000000100";
		wait for 3 ns;
		wait for 3 ns;
			pc2_rh<="0000000000000000000000000100";
		wait for 3 ns;
		wait for 3 ns;
			pc2_rh<="0000000000000000000000001000";
		wait for 3 ns;
		wait for 3 ns;
			pc2_rh<="0000000000000000000000010000";
		wait for 3 ns;
		wait for 3 ns;
			pc2_rh<="0000000000000000000000100000";
		wait for 3 ns;
		wait for 3 ns;
			pc2_rh<="0000000000000000000001000000";
		wait for 3 ns;
		wait for 3 ns;
			pc2_rh<="0000000000000000000010000000";
		wait for 3 ns;
		wait for 3 ns;
			pc2_rh<="0000000000000000000100000000";
		wait for 3 ns;
		wait for 3 ns;
			pc2_rh<="0000000000000000001000000000";
		wait for 3 ns;
		wait for 3 ns;
			pc2_rh<="0000000000000000010000000000";
		wait for 3 ns;


      wait;
   end process;

END;
