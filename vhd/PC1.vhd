library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
entity PC1 is
	port
	( 	key	: in  std_logic_vector(64 downto 1);
		pc1_lh : out std_logic_vector (28 downto 1); 
		pc1_rh : out std_logic_vector (28 downto 1)
	);

end PC1;
architecture Behavioral of PC1 is
signal 	key1	: std_logic_vector(64 downto 1);
begin
key1(1)<=key(64);
key1(2)<=key(63);
key1(3)<=key(62);
key1(4)<=key(61);

key1(5)<=key(60);
key1(6)<=key(59);
key1(7)<=key(58);
key1(8)<=key(57);

key1(9)<=key(56);
key1(10)<=key(55);
key1(11)<=key(54);
key1(12)<=key(53);

key1(13)<=key(52);
key1(14)<=key(51);
key1(15)<=key(50);
key1(16)<=key(49);

key1(17)<=key(48);
key1(18)<=key(47);
key1(19)<=key(46);
key1(20)<=key(45);

key1(21)<=key(44);
key1(22)<=key(43);
key1(23)<=key(42);
key1(24)<=key(41);

key1(25)<=key(40);
key1(26)<=key(39);
key1(27)<=key(38);
key1(28)<=key(37);

key1(29)<=key(36);
key1(30)<=key(35);
key1(31)<=key(34);
key1(32)<=key(33);

key1(33)<=key(32);
key1(34)<=key(31);
key1(35)<=key(30);
key1(36)<=key(29);

key1(37)<=key(28);
key1(38)<=key(27);
key1(39)<=key(26);
key1(40)<=key(25);

key1(41)<=key(24);
key1(42)<=key(23);
key1(43)<=key(22);
key1(44)<=key(21);

key1(45)<=key(20);
key1(46)<=key(19);
key1(47)<=key(18);
key1(48)<=key(17);

key1(49)<=key(16);
key1(50)<=key(15);
key1(51)<=key(14);
key1(52)<=key(13);

key1(53)<=key(12);
key1(54)<=key(11);
key1(55)<=key(10);
key1(56)<=key(9);

key1(57)<=key(8);
key1(58)<=key(7);
key1(59)<=key(6);
key1(60)<=key(5);

key1(61)<=key(4);
key1(62)<=key(3);
key1(63)<=key(2);
key1(64)<=key(1);
-- pc1 , lh
pc1_lh (1)<= key1(57);
pc1_lh (2)<= key1(49);
pc1_lh (3)<= key1(41);
pc1_lh (4)<= key1(33);
pc1_lh (5)<= key1(25);
pc1_lh (6)<= key1(17);
pc1_lh (7)<= key1(9);

pc1_lh (8)<= key1(1);
pc1_lh (9)<= key1(58);
pc1_lh (10)<= key1(50);
pc1_lh (11)<= key1(42);
pc1_lh (12)<= key1(34);
pc1_lh (13)<= key1(26);
pc1_lh (14)<= key1(18);

pc1_lh (15)<= key1(10);
pc1_lh (16)<= key1(2);
pc1_lh (17)<= key1(59);
pc1_lh (18)<= key1(51);
pc1_lh (19)<= key1(43);
pc1_lh (20)<= key1(35);
pc1_lh (21)<= key1(27);

pc1_lh (22)<= key1(19);
pc1_lh (23)<= key1(11);
pc1_lh (24)<= key1(3);
pc1_lh (25)<= key1(60);
pc1_lh (26)<= key1(52);
pc1_lh (27)<= key1(44);
pc1_lh (28)<= key1(36);

--pc1 , rh

pc1_rh (1)<= key1(63);
pc1_rh (2)<= key1(55);
pc1_rh (3)<= key1(47);
pc1_rh (4)<= key1(39);
pc1_rh (5)<= key1(31);
pc1_rh (6)<= key1(23);
pc1_rh (7)<= key1(15);

pc1_rh (8)<= key1(7);
pc1_rh (9)<= key1(62);
pc1_rh (10)<= key1(54);
pc1_rh (11)<= key1(46);
pc1_rh (12)<= key1(38);
pc1_rh (13)<= key1(30);
pc1_rh (14)<= key1(22);

pc1_rh (15)<= key1(14);
pc1_rh (16)<= key1(6);
pc1_rh (17)<= key1(61);
pc1_rh (18)<= key1(53);
pc1_rh (19)<= key1(45);
pc1_rh (20)<= key1(37);
pc1_rh (21)<= key1(29);

pc1_rh (22)<= key1(21);
pc1_rh (23)<= key1(13);
pc1_rh (24)<= key1(5);
pc1_rh (25)<= key1(28);
pc1_rh (26)<= key1(20);
pc1_rh (27)<= key1(12);
pc1_rh (28)<= key1(4);
	
end Behavioral;
