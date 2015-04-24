library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IP is
port( data_in : in std_logic_vector(63 downto 0);
		permut_data_lh : out std_logic_vector(63 downto 32);
		permut_data_rh : out std_logic_vector(31 downto 0));

end IP;

architecture Behavioral of IP is

begin

permut_data_rh(0)<=data_in(57);
permut_data_rh(1)<=data_in(49);
permut_data_rh(2)<=data_in(41);
permut_data_rh(3)<=data_in(33);
permut_data_rh(4)<=data_in(25);
permut_data_rh(5)<=data_in(17);
permut_data_rh(6)<=data_in(9);
permut_data_rh(7)<=data_in(1); 

permut_data_rh(8)<=data_in(59);
permut_data_rh(9)<=data_in(51);
permut_data_rh(10)<=data_in(43);
permut_data_rh(11)<=data_in(35);
permut_data_rh(12)<=data_in(27);
permut_data_rh(13)<=data_in(19);
permut_data_rh(14)<=data_in(11);
permut_data_rh(15)<=data_in(3);

permut_data_rh(16)<=data_in(61);
permut_data_rh(17)<=data_in(53);
permut_data_rh(18)<=data_in(45);
permut_data_rh(19)<=data_in(37);
permut_data_rh(20)<=data_in(29);
permut_data_rh(21)<=data_in(21);
permut_data_rh(22)<=data_in(13);
permut_data_rh(23)<=data_in(5);

permut_data_rh(24)<=data_in(63);
permut_data_rh(25)<=data_in(55);
permut_data_rh(26)<=data_in(47);
permut_data_rh(27)<=data_in(39);
permut_data_rh(28)<=data_in(31);
permut_data_rh(29)<=data_in(23);
permut_data_rh(30)<=data_in(15);
permut_data_rh(31)<=data_in(7);

permut_data_lh(32)<=data_in(56)	;
permut_data_lh(33)<=data_in(48);
permut_data_lh(34)<=data_in(40);
permut_data_lh(35)<=data_in(32);
permut_data_lh(36)<=data_in(24);
permut_data_lh(37)<=data_in(16);
permut_data_lh(38)<=data_in(8);
permut_data_lh(39)<=data_in(0); 

permut_data_lh(40)<=data_in(58);
permut_data_lh(41)<=data_in(50);
permut_data_lh(42)<=data_in(42);
permut_data_lh(43)<=data_in(34);
permut_data_lh(44)<=data_in(26);
permut_data_lh(45)<=data_in(18);
permut_data_lh(46)<=data_in(10);
permut_data_lh(47)<=data_in(2);

permut_data_lh(48)<=data_in(60);
permut_data_lh(49)<=data_in(52);
permut_data_lh(50)<=data_in(44);
permut_data_lh(51)<=data_in(36);
permut_data_lh(52)<=data_in(28);
permut_data_lh(53)<=data_in(20);
permut_data_lh(54)<=data_in(12);
permut_data_lh(55)<=data_in(4);

permut_data_lh(56)<=data_in(62);
permut_data_lh(57)<=data_in(54);
permut_data_lh(58)<=data_in(46);
permut_data_lh(59)<=data_in(38);
permut_data_lh(60)<=data_in(30);
permut_data_lh(61)<=data_in(22);
permut_data_lh(62)<=data_in(14);
permut_data_lh(63)<=data_in(6);

end Behavioral;

