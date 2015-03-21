library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multimux is
	port
	(
		
		data_lh : in std_logic_vector(28 downto 1 );
		data_rh : in std_logic_vector(28 downto 1 );
		
		boucle_lh : in std_logic_vector(28 downto 1 );
		boucle_rh : in std_logic_vector(28 downto 1 );
		
		sel : in std_logic;
		out_lh	: out std_logic_vector(28 downto 1 );
		out_rh	: out std_logic_vector(28 downto 1 )
	);
end multimux;

architecture behavior of multimux is
begin

out_lh <= data_lh WHEN (sel='0') ELSE boucle_lh;
out_rh <= data_rh WHEN (sel='0') ELSE boucle_rh;
	
end behavior ;
