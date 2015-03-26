library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC2 is

port
	( 	subkey : out  std_logic_vector(48	 downto 1);
		pc2_lh : in std_logic_vector (28 downto 1); 
		pc2_rh : in std_logic_vector (28 downto 1)
	);

end PC2;

architecture Behavioral of PC2 is
signal pc2 : std_logic_vector(56 downto 1);
begin
pc2 <= pc2_rh & pc2_lh; -- ou inverse?

subkey(48)<=pc2(14);
subkey(47)<=pc2(17);
subkey(46)<=pc2(11);
subkey(45)<=pc2(24);

subkey(44)<=pc2(1);
subkey(43)<=pc2(5);
subkey(42)<=pc2(3);
subkey(41)<=pc2(28);

subkey(40)<=pc2(15);
subkey(39)<=pc2(6);
subkey(38)<=pc2(21);
subkey(37)<=pc2(10);

subkey(36)<=pc2(23);
subkey(35)<=pc2(19);
subkey(34)<=pc2(12);
subkey(33)<=pc2(4);
----

subkey(32)<=pc2(26);
subkey(31)<=pc2(8);
subkey(30)<=pc2(16);
subkey(29)<=pc2(7);

subkey(28)<=pc2(27);
subkey(27)<=pc2(20);
subkey(26)<=pc2(13);
subkey(25)<=pc2(2);

subkey(24)<=pc2(41);
subkey(23)<=pc2(52);
subkey(22)<=pc2(31);
subkey(21)<=pc2(37);

subkey(20)<=pc2(47);
subkey(19)<=pc2(55);
subkey(18)<=pc2(30);
subkey(17)<=pc2(40);

----

subkey(16)<=pc2(51);
subkey(15)<=pc2(45);
subkey(14)<=pc2(33);
subkey(13)<=pc2(48);

subkey(12)<=pc2(44);
subkey(11)<=pc2(49);
subkey(10)<=pc2(39);
subkey(9)<=pc2(56);

subkey(8)<=pc2(34);
subkey(7)<=pc2(53);
subkey(6)<=pc2(46);
subkey(5)<=pc2(42);

subkey(4)<=pc2(50);
subkey(3)<=pc2(36);
subkey(2)<=pc2(29);
subkey(1)<=pc2(32);

end Behavioral;

