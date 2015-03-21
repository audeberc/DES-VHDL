
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
entity FSM is

port( start : in std_logic ;
		clk : in std_logic;
		rst : in std_logic;
		--
		--etat : out unsigned(4 downto 1);
		sel : out std_logic;
		num_rot : out std_logic;
		en_rot : out std_logic
		);

end FSM;

architecture Behavioral of FSM is
----
type state is (IDLE,SKINIT,ROT01,LOAD,ROT11,ROT02,FINCLEF,LOADMOT,CALC);

signal current_state : state ;
signal next_state : state ;
---
signal current_c1 : unsigned(2 downto 0);
signal current_c2 : unsigned(1 downto 0);
signal current_c3 : unsigned(3 downto 0);

signal next_c1 : unsigned(2 downto 0);
signal next_c2 : unsigned(1 downto 0);
signal next_c3 : unsigned(3 downto 0);
begin
---Process asynchrone
nextstate_proc: process(current_state,current_c1,current_c2,current_c3,start)
begin

case current_state is
	
	when IDLE =>
		if (start = '1') then 
				next_state <= SKINIT; 
		else 
			   next_state <= IDLE; 
		end if;
		next_c1 <= "000";
		next_c2 <= "00";
		next_c3 <= "0000";
		--etat <= "0000";
		num_rot <= '0';
		en_rot <= '0';
		sel <= '0';
	when SKINIT => 
		next_state <= ROT01;
		--etat <= "0001";
		next_c1<=current_c1;
		next_c2<=current_c2;
		next_c3<=current_c3;
		en_rot<='0';
		num_rot<='0';
		sel <= '0';
	when ROT01 =>
		next_state <= LOAD;
		--etat <= "0010";
		next_c1<=current_c1;
		next_c2<=current_c2;
		next_c3<=current_c3;
		en_rot <='1';
		num_rot<='0';
		sel <= '1';
	when LOAD => -- en SIPO
		next_state <= ROT11;
		--etat <= "0011";
		next_c1<=current_c1;
		next_c2<=current_c2;
		next_c3<=current_c3;
		en_rot <='1';
		num_rot<='0';
		sel <= '1';
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
	when ROT02 =>
		if current_c2<1 then
		next_state <= ROT11;
		else 
		next_state <= FINCLEF;
		end if;
			next_c2 <= current_c2 + 1 ;
			next_c1 <= "000";
			--etat <= "0101";
			next_c3<=current_c3;
			num_rot<='0';
			en_rot<='1';
			sel <= '1';
	when FINCLEF =>
		next_state <= LOADMOT;
		--etat <= "0110";
		next_c1<=current_c1;
		next_c2<=current_c2;
		next_c3<=current_c3;
		en_rot<='0';
		num_rot<='0';
		sel <= '1';
	when LOADMOT =>
		next_state <= CALC;
		--etat <= "0111";
		next_c1<=current_c1;
		next_c2<=current_c2;
		next_c3<="0000";
		en_rot<='0';
		num_rot<='0';	
		sel <= '1';
	when CALC =>
		if current_c3 < 15 then
			next_state <= CALC;
		else 
			next_state <= LOADMOT;
		end if;
			next_c3 <= current_c3 + 1 ;
			--etat <= "1000";
			next_c1<=current_c1;
			next_c2<=current_c2;
			en_rot<='0';
			num_rot<='0';	
			sel <= '1';
	when others =>
		next_state <= IDLE;
		next_c1<="000";
		next_c2<="00";
		next_c3<="0000";
		en_rot<='0';
		num_rot<='1';
		sel <= '1';
		--etat<="0000";
	end case;
	
end process;
---
sync_proc: process(clk,rst)
begin
	if rst = '1' then
		current_state <= IDLE ;
		current_c1 <= "000";
		current_c2 <= "00";
		current_c3 <="0000";
	elsif rising_edge(clk) then
		current_state <= next_state;
		current_c1 <= next_c1;
		current_c2 <= next_c2;
		current_c3 <= next_c3;
	end if;
end process;

end Behavioral;

