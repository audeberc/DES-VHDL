LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY topmodulebench IS
END topmodulebench;
 
ARCHITECTURE behavior OF topmodulebench IS 
 
    COMPONENT topmodule
    PORT(
        start : in std_logic ;
		clk : in std_logic;
		rst : in std_logic;
		key	: in  std_logic_vector(64 downto 1);
		
					
		N  , send_next_word   : out std_logic; 

		
		subkey_1	: out std_logic_vector(48 downto 1);
		subkey_2	: out std_logic_vector(48 downto 1);
		subkey_3	: out std_logic_vector(48 downto 1);
		subkey_4	: out std_logic_vector(48 downto 1);

		subkey_5	: out std_logic_vector(48 downto 1);
		subkey_6	: out std_logic_vector(48 downto 1);
		subkey_7	: out std_logic_vector(48 downto 1);
		subkey_8	: out std_logic_vector(48 downto 1);
		
		subkey_9	: out std_logic_vector(48 downto 1);
		subkey_10	: out std_logic_vector(48 downto 1);
		subkey_11 : out std_logic_vector(48 downto 1);
		subkey_12	: out std_logic_vector(48 downto 1);
		
		subkey_13	: out std_logic_vector(48 downto 1);
		subkey_14	: out std_logic_vector(48 downto 1);
		subkey_15	: out std_logic_vector(48 downto 1);
		subkey_16	: out std_logic_vector(48 downto 1)	
        );
    END COMPONENT;
    

   --Inputs
   signal start : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';
	signal key	:  std_logic_vector(64 downto 1) := (others => '0');

 	--Outputs
   		
				
	signal	N ,send_next_word    :  std_logic; 
 
	
	signal	subkey_1	: std_logic_vector(48 downto 1);
	signal	subkey_2	: std_logic_vector(48 downto 1);
	signal	subkey_3	: std_logic_vector(48 downto 1);
	signal	subkey_4	: std_logic_vector(48 downto 1);

	signal	subkey_5	: std_logic_vector(48 downto 1);
	signal	subkey_6	: std_logic_vector(48 downto 1);
	signal	subkey_7	: std_logic_vector(48 downto 1);
	signal	subkey_8	: std_logic_vector(48 downto 1);
		
	signal	subkey_9	: std_logic_vector(48 downto 1);
	signal	subkey_10	: std_logic_vector(48 downto 1);
	signal	subkey_11 : std_logic_vector(48 downto 1);
	signal	subkey_12	: std_logic_vector(48 downto 1);
		
	signal	subkey_13	: std_logic_vector(48 downto 1);
	signal	subkey_14	: std_logic_vector(48 downto 1);
	signal	subkey_15	: std_logic_vector(48 downto 1);
	signal	subkey_16	: std_logic_vector(48 downto 1)	;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: topmodule PORT MAP (
          start => start,
          clk => clk,
          rst => rst,
			 key => key,
			 N => N,
			 send_next_word => send_next_word ,	
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '0';
		start<='1';
		key <= "0001001100110100010101110111100110011011101111001101111111111111"; -- http://www.herongyang.com/Cryptography/DES-Illustration-DES-Key-Schedule-Output.html example
      wait for clk_period*10;
		

      -- insert stimulus here 

      wait;
   end process;

END;
