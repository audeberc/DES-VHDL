library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SIPO is
	port
	(
		
		en_decal , clk	: in  std_logic;
		data_in	: in  std_logic_vector(48 downto 1);
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
end SIPO;

architecture behavior of SIPO is

	
		signal reg_1	:   std_logic_vector(48 downto 1);
		signal  reg_2	:   std_logic_vector(48 downto 1);
	   signal reg_3	:   std_logic_vector(48 downto 1);
		signal  reg_4	:   std_logic_vector(48 downto 1);

		signal  reg_5	:   std_logic_vector(48 downto 1);
		signal  reg_6	:   std_logic_vector(48 downto 1);
		signal  reg_7	:   std_logic_vector(48 downto 1);
		signal  reg_8	:   std_logic_vector(48 downto 1);
		
		signal   reg_9	:   std_logic_vector(48 downto 1);
		signal 	 reg_10	:   std_logic_vector(48 downto 1);
		signal 	 reg_11 :   std_logic_vector(48 downto 1);
		signal 	 reg_12	:   std_logic_vector(48 downto 1);
			
		signal 	 reg_13	:   std_logic_vector(48 downto 1);
		signal 	 reg_14	:   std_logic_vector(48 downto 1);
		signal 	 reg_15	:   std_logic_vector(48 downto 1);
		signal 	 reg_16	:   std_logic_vector(48 downto 1);

begin

process (clk)
begin
		if (rising_edge(clk)) then
			if en_decal = '1' then
			reg_16<=reg_15;
			reg_15<=reg_14;
			reg_14<=reg_13;
			reg_13<=reg_12;
			
			reg_12<=reg_11;
			reg_11<=reg_10;
			reg_10<=reg_9;
			reg_9<=reg_8;
			
			reg_8<=reg_7;
			reg_7<=reg_6;
			reg_6<=reg_5;
			reg_5<=reg_4;
			
			reg_4<=reg_3;
			reg_3<=reg_2;
			reg_2<=reg_1;
			reg_1<=data_in;
			end if;	
		end if;
end process;
 
 subkey_1 <= reg_1;
 subkey_2 <= reg_2;
 subkey_3 <= reg_3;
 subkey_4 <= reg_4;

 subkey_5 <= reg_5;
 subkey_6 <= reg_6;
 subkey_7 <= reg_7;
 subkey_8 <= reg_8;
 
 subkey_9 <= reg_9;
 subkey_10 <= reg_10;
 subkey_11 <= reg_11;
 subkey_12 <= reg_12;

 subkey_13 <= reg_13;
 subkey_14 <= reg_14;
 subkey_15 <= reg_15;
 subkey_16 <= reg_16;

end behavior;
