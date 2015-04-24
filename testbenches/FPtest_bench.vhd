LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
ENTITY FPtest_bench IS
END FPtest_bench;
ARCHITECTURE behavior OF FPtest_bench IS 
    COMPONENT FP
    PORT(
         data_out : OUT  std_logic_vector(64 downto 1);
         permut_data_lh : IN  std_logic_vector(64 downto 33);
         permut_data_rh : IN  std_logic_vector(32 downto 1)
        );
    END COMPONENT;
   signal permut_data_lh : std_logic_vector(64 downto 33) := (others => '0');
   signal permut_data_rh : std_logic_vector(32 downto 1) := (others => '0');
   signal data_out : std_logic_vector(64 downto 1);
BEGIN
   uut: FP PORT MAP (
          data_out => data_out,
          permut_data_lh => permut_data_lh,
          permut_data_rh => permut_data_rh
        );
   process
   begin		
	permut_data_lh <= "01000011010000100011001000110100";
	permut_data_rh <= "00001010010011001101100110010101";

      wait;
   end process;

END;
