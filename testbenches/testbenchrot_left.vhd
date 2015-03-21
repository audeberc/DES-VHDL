
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testbenchrot_left IS
END testbenchrot_left;
 
ARCHITECTURE behavior OF testbenchrot_left IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rot_left
    PORT(
         clk : IN  std_logic;
         data_l : IN  std_logic_vector(28 downto 1);
         data_r : IN  std_logic_vector(28 downto 1);
         rotated_out_l : OUT  std_logic_vector(28 downto 1);
         rotated_out_r : OUT  std_logic_vector(28 downto 1);
         num_rot , en_rot : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal data_l : std_logic_vector(28 downto 1) := (others => '0');
   signal data_r : std_logic_vector(28 downto 1) := (others => '0');
   signal num_rot : std_logic := '0';
   signal en_rot : std_logic := '0';

 	--Outputs
   signal rotated_out_l : std_logic_vector(28 downto 1);
   signal rotated_out_r : std_logic_vector(28 downto 1);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rot_left PORT MAP (
          clk => clk,
          data_l => data_l,
          data_r => data_r,
          rotated_out_l => rotated_out_l,
          rotated_out_r => rotated_out_r,
          num_rot => num_rot,
			 en_rot => en_rot
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
    data_l<="1010101100101010101010101010";
	 data_r<="0101011111010101010101010101";
	 num_rot<='0';
	 wait for 20 ns;
	 en_rot<='1';
	 wait for 50 ns;
	 en_rot<='0';
	 wait for 20 ns;
	 en_rot<='1';
	 num_rot<='1';
      wait;
   end process;

END;
