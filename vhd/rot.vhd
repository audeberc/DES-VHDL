library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rot_left is
port (clk		: in std_logic;
		data_l		: in std_logic_vector(28 downto 1);
		data_r		: in std_logic_vector(28 downto 1);
		rotated_out_l	: out std_logic_vector(28 downto 1);
		rotated_out_r	: out std_logic_vector(28 downto 1);
		num_rot , en_rot : in std_logic
		
	);

end rot_left;

architecture behavior of rot_left is

	signal rotated_l : unsigned(28 downto 1);
	signal rotated_r : unsigned(28 downto 1);
	signal rotnumb : natural;
begin
	process (clk)
	begin
		if (clk'event and clk='1' and en_rot='1') then

						rotated_l <= rotate_right(unsigned(data_l) ,rotnumb );
						rotated_r <= rotate_right(unsigned(data_r) ,rotnumb);

		end if;
	end process;
	
	process(num_rot)
	begin
		if (num_rot='0') then
			rotnumb <= 1;
		else 
			rotnumb <= 2;
		end if;
	end process;
	rotated_out_l <= std_logic_vector(rotated_l);
	rotated_out_r <= std_logic_vector(rotated_r);

end behavior;

