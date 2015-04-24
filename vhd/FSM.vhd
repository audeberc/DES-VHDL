
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
entity FSM is

port( start 				 : in std_logic ;
		clk					 : in std_logic;
		rst					 : in std_logic;
		--
		keysel				 : out unsigned(3 downto 0);
		send_next_word     : out std_logic;
		sel , en_decal , N : out std_logic;
		num_rot      	    : out std_logic;
		cor_result			 : out std_logic;
		en_rot 				 : out std_logic
		);

end FSM;

architecture Behavioral of FSM is
----
type state is (IDLE,SKINIT,ROT01,LOAD,ROT11,ROT02,ROT03,FINCLEF,LOADMOT,CALC);

signal current_state : state ;
signal next_state : state ;
---

signal current_c1 : unsigned(2 downto 0);
signal current_c2 : unsigned(1 downto 0);
signal current_c3 : unsigned(4 downto 0);
signal current_ks : unsigned(3 downto 0);
signal next_correct : std_logic;

signal current_correct : std_logic;
signal next_ks : unsigned(3 downto 0);
signal next_c1 : unsigned(2 downto 0);
signal next_c2 : unsigned(1 downto 0);
signal next_c3 : unsigned(4 downto 0);
begin
---Process asynchrone
nextstate_proc: process(current_state,current_c1,current_c2,current_c3,start)
begin
	next_correct <= '0';
	cor_result<=current_correct;
	next_ks <= "0000";
	keysel <= current_ks;
case current_state is	
	when IDLE =>
		if (start = '1') then 
				next_state <= SKINIT; 
		else 
			   next_state <= IDLE; 
		end if;
		next_c1 <= "000";
		next_c2 <= "00";
		next_c3 <= "00000";
		--etat <= "0000";
		num_rot <= '0';
		en_rot <= '0';
		sel <= '0';
		en_decal <= '0';
		N<='0';
		send_next_word<='0';
	when SKINIT => 
			next_state <= ROT01;
		--etat <= "0001";
		next_c1<=current_c1;
		next_c2<=current_c2;
		next_c3<=current_c3;
		en_rot<='0';
		num_rot<='0';
		sel <= '0';
		en_decal <= '0';
		N<='0';
		send_next_word<='0';

	when ROT01 =>
		next_state <= LOAD;
		--etat <= "0010";
		next_c1<=current_c1;
		next_c2<=current_c2;
		next_c3<=current_c3;
		en_rot <='1';
		num_rot<='0';
		sel <= '0';
		en_decal <= '0';
		N<='0';
		send_next_word<='0';

	when LOAD => -- en SIPO
		next_state <= ROT11;
		--etat <= "0011";
		next_c1<=current_c1;
		next_c2<=current_c2;
		next_c3<=current_c3;
		en_rot <='1';
		num_rot<='0';
		sel <= '1';
		en_decal <= '1';
		N<='0';
		send_next_word<='0';

	when ROT11 =>
		if current_c1 < 5 then
		next_state <= ROT11;
		else
		next_state <= ROT02;
		end if;
		next_c1 <= current_c1 + 1 ;
		--etat <= "0100";
		next_c2<=current_c2;
		next_c3<=current_c3;
		num_rot<='1';
		en_rot <='1';
		sel <= '1';
		en_decal <= '1';
		N<='0';
		send_next_word<='0';
	when ROT02 =>		
		  		if current_c2<1 then
		next_state <= ROT11;
		num_rot<='1';
		else 
		next_state <= ROT03;
		num_rot<='0';
		end if;
			next_c2 <= current_c2+1 ;
			next_c1 <= "000";
			--etat <= "0101";
			next_c3<=current_c3;
			num_rot<='0';
			en_rot<='1';
			sel <= '1';
			en_decal <= '1';
			N<='0';
 		   send_next_word<='0';  
		
			
	  	when ROT03 =>	
		   next_state <= FINCLEF;
			next_c2 <= current_c2 ;
			next_c1 <= "000";
			--etat <= "0101";
			next_c3<=current_c3;
			num_rot<='0';
			en_rot<='1';
			sel <= '1';
			en_decal <= '1';
			N<='0';
			send_next_word<='0';
	
			
	when FINCLEF =>
		next_state <= CALC;
		--etat <= "0110";
		next_c1<=current_c1;
		next_c2<=current_c2;
		next_c3<=current_c3;
		en_rot<='0';
		num_rot<='0';
		sel <= '1';
		en_decal <= '0';
		N<='0';
	   send_next_word<='1';
		
	when LOADMOT =>
		next_state <= CALC;
		--etat <= "0111";
		next_c1<=current_c1;
		next_c2<=current_c2;
		next_c3<="00000";
		en_rot<='0';
		num_rot<='0';	
		sel <= '1';
		en_decal <= '0';
		N<='0';
		next_ks <= "0000";
	
		next_correct<='1';
		send_next_word<='1';
	when CALC =>
		if current_c3 < 14 then
			next_state <= CALC;
		else 
			next_state <= LOADMOT;
		end if;
			next_correct<=current_correct;
			--etat <= "1000";
			next_c1<=current_c1;
			next_c2<=current_c2;
			en_rot<='0';
			num_rot<='0';	
			sel <= '1';
			next_c3 <= current_c3 + 1 ;
			next_ks <= current_ks + 1;
			N<='1';
			en_decal <= '0';
		   send_next_word<='0';	
			
	when others =>
		next_state <= IDLE;
		next_c1<="000";
		next_c2<="00";
		next_c3<="00000";
		en_rot<='0';
		num_rot<='1';
		sel <= '1';
		en_decal <= '0';
		N<='0';
		send_next_word<='0';	
	end case;
	
end process;
---
sync_proc: process(clk,rst)
begin
	if rst = '1' then
		current_state <= IDLE ;
		current_c1 <= "000";
		current_correct <=  '0';
		current_c2 <= "00";
		current_c3 <="00000";
		current_ks <= "0000";
	elsif rising_edge(clk) then
		current_correct <= next_correct;
		current_state <= next_state;
		current_c1 <= next_c1;
		current_c2 <= next_c2;
		current_c3 <= next_c3;
		current_ks <= next_ks;
	end if;
end process;

end Behavioral;

