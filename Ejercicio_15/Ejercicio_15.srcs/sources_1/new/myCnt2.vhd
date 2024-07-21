library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;
library work;
--library UNISIM;
--use UNISIM.VComponents.all;

entity myCnt2 is
Generic (N:integer := 4 );
Port (  clk:    in std_logic ;
        rst:    in std_logic ;
        ena:    in std_logic ;
        p:      in std_logic_vector (N-1 downto 0);
        salida:    out std_logic);
end myCnt2;

architecture Behavioral of myCnt2 is
----- SIGNALS -----------------------------------------------
signal rst_aux : std_logic ;
signal cont_aux: std_logic_vector (N-1 downto 0);
signal salida_aux : std_logic ;
-------------------------------------------------------------
begin

rst_aux <= rst or salida_aux;

----- COMPONENTS ---------------------------------------------
CONTADOR: entity work.myCntBinarioSimple
Generic map(N=>N)
Port map(clk => clk, rst => rst_aux, ena=>ena, q=>cont_aux);
--------------------------------------------------------------
salida <= salida_aux;
salida_aux <= '1' when (cont_aux = p) else '0';

end Behavioral;
