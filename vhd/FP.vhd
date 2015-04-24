library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FP is
port( data_out : out std_logic_vector(64 downto 1);
		permut_data_lh : in std_logic_vector(64 downto 33);
		permut_data_rh : in std_logic_vector(32 downto 1));

end FP;

architecture Behavioral of FP is
signal permut_data : std_logic_vector(64 downto 1);
begin
permut_data <= permut_data_rh & permut_data_lh;
data_out(1)<=permut_data(40);
data_out(2)<=permut_data(8);
data_out(3)<=permut_data(48);
data_out(4)<=permut_data(16);
data_out(5)<=permut_data(56);
data_out(6)<=permut_data(24);
data_out(7)<=permut_data(64);
data_out(8)<=permut_data(32);

data_out(9)<=permut_data(39);
data_out(10)<=permut_data(7);
data_out(11)<=permut_data(47);
data_out(12)<=permut_data(15);
data_out(13)<=permut_data(55);
data_out(14)<=permut_data(23);
data_out(15)<=permut_data(63);
data_out(16)<=permut_data(31);

data_out(17)<=permut_data(38);
data_out(18)<=permut_data(6);
data_out(19)<=permut_data(46);
data_out(20)<=permut_data(14);
data_out(21)<=permut_data(54);
data_out(22)<=permut_data(22);
data_out(23)<=permut_data(62);
data_out(24)<=permut_data(30);

data_out(25)<=permut_data(37);
data_out(26)<=permut_data(5);
data_out(27)<=permut_data(45);
data_out(28)<=permut_data(13);
data_out(29)<=permut_data(53);
data_out(30)<=permut_data(21);
data_out(31)<=permut_data(61);
data_out(32)<=permut_data(29);

data_out(33)<=permut_data(36);
data_out(34)<=permut_data(4);
data_out(35)<=permut_data(44);
data_out(36)<=permut_data(12);
data_out(37)<=permut_data(52);
data_out(38)<=permut_data(20);
data_out(39)<=permut_data(60);
data_out(40)<=permut_data(28);

data_out(41)<=permut_data(35);
data_out(42)<=permut_data(3);
data_out(43)<=permut_data(43);
data_out(44)<=permut_data(11);
data_out(45)<=permut_data(51);
data_out(46)<=permut_data(19);
data_out(47)<=permut_data(59);
data_out(48)<=permut_data(27);

data_out(49)<=permut_data(34);
data_out(50)<=permut_data(2);
data_out(51)<=permut_data(42);
data_out(52)<=permut_data(10);
data_out(53)<=permut_data(50);
data_out(54)<=permut_data(18);
data_out(55)<=permut_data(58);
data_out(56)<=permut_data(26);

data_out(57)<=permut_data(33);
data_out(58)<=permut_data(1);
data_out(59)<=permut_data(41);
data_out(60)<=permut_data(9);
data_out(61)<=permut_data(49);
data_out(62)<=permut_data(17);
data_out(63)<=permut_data(57);
data_out(64)<=permut_data(25);

end Behavioral;

