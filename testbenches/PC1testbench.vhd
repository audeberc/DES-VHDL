LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY PC1testbench IS
END PC1testbench;
 
ARCHITECTURE behavior OF PC1testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC1
    PORT(
         key : IN  std_logic_vector(64 downto 1);
         pc1_lh : OUT  std_logic_vector(28 downto 1);
         pc1_rh : OUT  std_logic_vector(28 downto 1)
        );
    END COMPONENT;
    
   signal key : std_logic_vector(64 downto 1) := (others => '0');

   signal pc1_lh : std_logic_vector(28 downto 1);
   signal pc1_rh : std_logic_vector(28 downto 1);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC1 PORT MAP (
          key => key,
          pc1_lh => pc1_lh,
          pc1_rh => pc1_rh
        );


   stim_proc: process
   begin		
   key<="1010101010101010101010101010101010101010101010101010101010101010";
	wait for 100 ns;
	key<="1111000011110000111100001111000011110000111100001111000011110000";
	wait for 100 ns;
	key<="1100001101010111001101010110011001101010001111010100101011111010";
      -- insert stimulus here 

      wait;
   end process;

END;
