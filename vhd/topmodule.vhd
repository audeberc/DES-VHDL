
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topmodule is

port(start : in std_logic ;
		clk : in std_logic;
		rst : in std_logic;
		key	: in  std_logic_vector(64 downto 1);
			
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

end topmodule;


architecture Behavioral of topmodule is

component FSM
	port(start : in std_logic ;
		clk : in std_logic;
		rst : in std_logic;
		num_rot : out std_logic;
		en_decal : out std_logic;
		sel : out std_logic;
		en_rot : out std_logic
	  );
end component;


component PC1
	port(key	: in  std_logic_vector(64 downto 1);
		  pc1_lh : out std_logic_vector (28 downto 1); 
		  pc1_rh : out std_logic_vector (28 downto 1)
	  );
end component;

component multimux
	port(		
		data_lh : in std_logic_vector(28 downto 1 );
		data_rh : in std_logic_vector(28 downto 1 );
		
		boucle_lh : in std_logic_vector(28 downto 1 );
		boucle_rh : in std_logic_vector(28 downto 1 );
		
		sel : in std_logic;
		out_lh	: out std_logic_vector(28 downto 1 );
		out_rh	: out std_logic_vector(28 downto 1 )
	  );
end component;

component rot_left
	port(clk		: in std_logic;
		data_l		: in std_logic_vector(28 downto 1);
		data_r		: in std_logic_vector(28 downto 1);
		rotated_out_l	: out std_logic_vector(28 downto 1);
		rotated_out_r	: out std_logic_vector(28 downto 1);
		num_rot , en_rot : in std_logic
	  );
end component;


component PC2
	port( subkey : out  std_logic_vector(48	 downto 1);
		   pc2_lh : in std_logic_vector (28 downto 1); 
		   pc2_rh : in std_logic_vector (28 downto 1)
	  );
end component;


component SIPO
	port(	en_decal , clk	: in  std_logic;
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
end component;
--signal 

signal numrot , enrot , en_decal , sel: std_logic:='0';
signal inmux_l , inmux_r , outmux_l , outmux_r , pc1out_l , pc1out_r : std_logic_vector(28 downto 1 );
signal subkey :  std_logic_vector(48	 downto 1);
begin
FSM1 : FSM port map (
	
	start => start,
	clk => clk, 
	rst => rst,
	en_rot => enrot,
	en_decal => en_decal,
	num_rot => numrot	,
	sel=>sel

);

PC11 : PC1 port map (

key => key ,
pc1_lh => pc1out_l ,
pc1_rh => pc1out_r
);

rot : rot_left port map (
	
	data_l => outmux_l,
	data_r => outmux_r,
	clk => clk, 
	rotated_out_r => inmux_r,
	rotated_out_l => inmux_l,
	en_rot => enrot,
	num_rot => numrot	

);

mux : multimux port map (
	
		data_lh =>pc1out_l,
		data_rh => pc1out_r,
		
		boucle_lh => inmux_l,
		boucle_rh => inmux_r,
		
		sel => sel ,
		out_lh	=> outmux_l,
		out_rh	=> outmux_r


);

PC21 : PC2 port map (

 subkey => subkey ,
 pc2_lh => inmux_l,
 pc2_rh => inmux_r
		   
);

SIPO1 : SIPO port map (
		en_decal => en_decal,
		clk => clk,
		data_in => subkey,
		subkey_1	=> subkey_1 ,
		subkey_2	 => subkey_2 ,
		subkey_3	=> subkey_3 ,
		subkey_4	=> subkey_4 ,

		subkey_5	=> subkey_5 ,
 		subkey_6	=> subkey_6 ,
		subkey_7	=> subkey_7 ,
		subkey_8	=> subkey_8 , 
		
		subkey_9	=> subkey_9 ,
		subkey_10 => subkey_10 ,
		subkey_11 => subkey_11 ,
		subkey_12	=> subkey_12 ,  
		
		subkey_13	=> subkey_13 ,
		subkey_14	=> subkey_14 ,
		subkey_15	=> subkey_15 ,
		subkey_16	=> subkey_16

);

end Behavioral;

