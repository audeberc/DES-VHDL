
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY SIPOtestbench IS
END SIPOtestbench;
 
ARCHITECTURE behavior OF SIPOtestbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SIPO
    PORT(
         en_decal : IN  std_logic;
         clk : IN  std_logic;
         data_in : IN  std_logic_vector(48 downto 1);
         subkey_1 : OUT  std_logic_vector(48 downto 1);
         subkey_2 : OUT  std_logic_vector(48 downto 1);
         subkey_3 : OUT  std_logic_vector(48 downto 1);
         subkey_4 : OUT  std_logic_vector(48 downto 1);
         subkey_5 : OUT  std_logic_vector(48 downto 1);
         subkey_6 : OUT  std_logic_vector(48 downto 1);
         subkey_7 : OUT  std_logic_vector(48 downto 1);
         subkey_8 : OUT  std_logic_vector(48 downto 1);
         subkey_9 : OUT  std_logic_vector(48 downto 1);
         subkey_10 : OUT  std_logic_vector(48 downto 1);
         subkey_11 : OUT  std_logic_vector(48 downto 1);
         subkey_12 : OUT  std_logic_vector(48 downto 1);
         subkey_13 : OUT  std_logic_vector(48 downto 1);
         subkey_14 : OUT  std_logic_vector(48 downto 1);
         subkey_15 : OUT  std_logic_vector(48 downto 1);
         subkey_16 : OUT  std_logic_vector(48 downto 1)
        );
    END COMPONENT;
    

   --Inputs
   signal en_decal : std_logic := '0';
   signal clk : std_logic := '0';
   signal data_in : std_logic_vector(48 downto 1) := (others => '0');

 	--Outputs
   signal subkey_1 : std_logic_vector(48 downto 1);
   signal subkey_2 : std_logic_vector(48 downto 1);
   signal subkey_3 : std_logic_vector(48 downto 1);
   signal subkey_4 : std_logic_vector(48 downto 1);
   signal subkey_5 : std_logic_vector(48 downto 1);
   signal subkey_6 : std_logic_vector(48 downto 1);
   signal subkey_7 : std_logic_vector(48 downto 1);
   signal subkey_8 : std_logic_vector(48 downto 1);
   signal subkey_9 : std_logic_vector(48 downto 1);
   signal subkey_10 : std_logic_vector(48 downto 1);
   signal subkey_11 : std_logic_vector(48 downto 1);
   signal subkey_12 : std_logic_vector(48 downto 1);
   signal subkey_13 : std_logic_vector(48 downto 1);
   signal subkey_14 : std_logic_vector(48 downto 1);
   signal subkey_15 : std_logic_vector(48 downto 1);
   signal subkey_16 : std_logic_vector(48 downto 1);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SIPO PORT MAP (
          en_decal => en_decal,
          clk => clk,
          data_in => data_in,
          subkey_1 => subkey_1,
          subkey_2 => subkey_2,
          subkey_3 => subkey_3,
          subkey_4 => subkey_4,
          subkey_5 => subkey_5,
          subkey_6 => subkey_6,
          subkey_7 => subkey_7,
          subkey_8 => subkey_8,
          subkey_9 => subkey_9,
          subkey_10 => subkey_10,
          subkey_11 => subkey_11,
          subkey_12 => subkey_12,
          subkey_13 => subkey_13,
          subkey_14 => subkey_14,
          subkey_15 => subkey_15,
          subkey_16 => subkey_16
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
	data_in<=(others=>'1');
	en_decal <= '1';
	wait for 20 ns;
	data_in<=(others=>'0');
	wait for 60 ns ;
	en_decal <='0';
	wait for 10 ns;
	data_in<=(others=>'1');
	wait for 20 ns;
	en_decal <='1';
	wait for 100 ns;
   end process;

END;
