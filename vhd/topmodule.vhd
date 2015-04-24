library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
entity topmodule is

port(start : in std_logic ;
		clk : in std_logic;
		rst : in std_logic;
		crypt_sel : in std_logic;
		key	: in  std_logic_vector(64 downto 1);
		M : in std_logic_vector( 63 downto 0);	
		
		correct_result : out std_logic;
		send_next_word     : out std_logic; 
		M_out : out std_logic_vector(63 downto 0)
	);

end topmodule;


architecture Behavioral of topmodule is

component FSM
	port(start : in std_logic ;
		clk : in std_logic;
		rst : in std_logic;
		num_rot : out std_logic;
		en_decal : out std_logic;
		keysel : out unsigned(3 downto 0);
		sel : out std_logic;
		N : out std_logic;
		send_next_word     : out std_logic;
		cor_result			 : out std_logic;
		en_rot : out std_logic
	  );
end component;


component PC1
	port(key	: in  std_logic_vector(64 downto 1);
		  pc1_lh : out std_logic_vector (28 downto 1); 
		  pc1_rh : out std_logic_vector (28 downto 1)
	  );
end component;




component calcul 
	port
	(	entree  : in std_logic_vector(63 downto 0 );
		clk : in std_logic;
		rst : in std_logic;
		clef : in std_logic_vector(47 downto 0 );
		N : in std_logic;
		sortie	: out std_logic_vector(63 downto 0 ));
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

signal numrot , enrot, en_decal , N ,sel : std_logic:='0';
signal inmux_l , inmux_r , outmux_l , outmux_r , pc1out_l , pc1out_r : std_logic_vector(28 downto 1 );
signal keysel	: unsigned(3 downto 0);
signal subkey :  std_logic_vector(48	 downto 1);

signal calckey :  std_logic_vector(48	 downto 1);
signal calckey_decrypt :  std_logic_vector(48	 downto 1);
signal calckey_crypt :  std_logic_vector(48	 downto 1);

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
begin
FSM1 : FSM port map (
	
	start => start,
	clk => clk, 
	rst => rst,
	en_rot => enrot,
	N => N,
	send_next_word => send_next_word ,
	en_decal => en_decal,
	cor_result => correct_result,
	num_rot => numrot	,
	keysel=>keysel,
	sel=>sel

);

calc: calcul port map (
	
		entree => M,
		clk => clk, 
		rst => rst,
		clef => calckey,
		N => N,
		sortie => M_out


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
process (keysel,rst,subkey_1)
begin
if (rst='1') then
	calckey_crypt<=(others=>'0');
	calckey_decrypt<=(others=>'0');
else
case keysel is 
	when "0000" => calckey_crypt <= subkey_1; calckey_decrypt<= subkey_16;
	when x"1" => calckey_crypt <= subkey_2; calckey_decrypt<= subkey_15;
	when x"2" => calckey_crypt <= subkey_3; calckey_decrypt<= subkey_14;
	when x"3" => calckey_crypt <= subkey_4; calckey_decrypt<= subkey_13;
	when x"4" => calckey_crypt <= subkey_5; calckey_decrypt<= subkey_12;
	when x"5" => calckey_crypt <= subkey_6; calckey_decrypt<= subkey_11;
	when x"6" => calckey_crypt <= subkey_7; calckey_decrypt<= subkey_10;
	when x"7" => calckey_crypt <= subkey_8; calckey_decrypt<= subkey_9;
	
	when x"8" => calckey_crypt <= subkey_9; calckey_decrypt<= subkey_8;
	when x"9" => calckey_crypt <= subkey_10; calckey_decrypt<= subkey_7;
	when x"A" => calckey_crypt <= subkey_11; calckey_decrypt<= subkey_6;
	when x"B" => calckey_crypt <= subkey_12; calckey_decrypt<= subkey_5;
	
	when x"C" => calckey_crypt <= subkey_13; calckey_decrypt<= subkey_4;
	when x"D" => calckey_crypt <= subkey_14; calckey_decrypt<= subkey_3;
	when x"E" => calckey_crypt <= subkey_15; calckey_decrypt<= subkey_2;
	when x"F" => calckey_crypt <= subkey_16; calckey_decrypt<= subkey_1;
	when others => calckey_crypt <= subkey_16; calckey_decrypt<= subkey_1;
end case;
end if;
end process;


process (crypt_sel,calckey_crypt,calckey_decrypt)
begin
	if crypt_sel ='1' then calckey<=calckey_crypt; 
	else calckey<=calckey_decrypt;
	end if;
end process;

end Behavioral;

