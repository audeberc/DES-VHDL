
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topmodule is

port(start : in std_logic ;
		clk : in std_logic;
		rst : in std_logic;
		data_l		: in std_logic_vector(28 downto 1);
		data_r		: in std_logic_vector(28 downto 1);
		rotated_out_l	: out std_logic_vector(28 downto 1);
		rotated_out_r	: out std_logic_vector(28 downto 1)	
	);

end topmodule;


architecture Behavioral of topmodule is

component FSM
	port(start : in std_logic ;
		clk : in std_logic;
		rst : in std_logic;
		num_rot : out std_logic;
		sel : out std_logic;
		en_rot : out std_logic
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
--signal 

signal numrot , enrot , sel: std_logic:='0';
signal inmux_l , inmux_r , outmux_l , outmux_r : std_logic_vector(28 downto 1 );
begin
FSM1 : FSM port map (
	
	start => start,
	clk => clk, 
	rst => rst,
	en_rot => enrot,
	num_rot => numrot	,
	sel=>sel

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
	
		data_lh => data_l,
		data_rh => data_r,
		
		boucle_lh => inmux_l,
		boucle_rh => inmux_r,
		
		sel => sel ,
		out_lh	=> outmux_l,
		out_rh	=> outmux_r


);

rotated_out_l<=inmux_l;
rotated_out_r<=inmux_r;
end Behavioral;

