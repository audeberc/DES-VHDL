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
begin
-- pc1 , lh
pc1_lh (1)<= key(57);
pc1_lh (2)<= key(49);
pc1_lh (3)<= key(41);
pc1_lh (4)<= key(33);
pc1_lh (5)<= key(25);
pc1_lh (6)<= key(17);
pc1_lh (7)<= key(9);

pc1_lh (8)<= key(1);
pc1_lh (9)<= key(58);
pc1_lh (10)<= key(50);
pc1_lh (11)<= key(42);
pc1_lh (12)<= key(34);
pc1_lh (13)<= key(26);
pc1_lh (14)<= key(18);

pc1_lh (15)<= key(10);
pc1_lh (16)<= key(2);
pc1_lh (17)<= key(59);
pc1_lh (18)<= key(51);
pc1_lh (19)<= key(43);
pc1_lh (20)<= key(35);
pc1_lh (21)<= key(27);

pc1_lh (22)<= key(19);
pc1_lh (23)<= key(11);
pc1_lh (24)<= key(3);
pc1_lh (25)<= key(60);
pc1_lh (26)<= key(52);
pc1_lh (27)<= key(44);
pc1_lh (28)<= key(36);

--pc1 , rh

pc1_rh (1)<= key(63);
pc1_rh (2)<= key(55);
pc1_rh (3)<= key(47);
pc1_rh (4)<= key(39);
pc1_rh (5)<= key(31);
pc1_rh (6)<= key(23);
pc1_rh (7)<= key(15);

pc1_rh (8)<= key(7);
pc1_rh (9)<= key(62);
pc1_rh (10)<= key(54);
pc1_rh (11)<= key(46);
pc1_rh (12)<= key(38);
pc1_rh (13)<= key(30);
pc1_rh (14)<= key(22);

pc1_rh (15)<= key(14);
pc1_rh (16)<= key(6);
pc1_rh (17)<= key(61);
pc1_rh (18)<= key(53);
pc1_rh (19)<= key(45);
pc1_rh (20)<= key(37);
pc1_rh (21)<= key(29);

pc1_rh (22)<= key(21);
pc1_rh (23)<= key(13);
pc1_rh (24)<= key(5);
pc1_rh (25)<= key(28);
pc1_rh (26)<= key(20);
pc1_rh (27)<= key(12);
pc1_rh (28)<= key(4);
	
end Behavioral;
