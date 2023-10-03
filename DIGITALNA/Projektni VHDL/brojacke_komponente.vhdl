library ieee;
use ieee.std_logic_1164.all;

package brojacke_komponente is

    component Brojac74S163 is
    port(   clr, clk, enp, ent, load : in std_logic;
            data_in  : in std_logic_vector(3 downto 0);
            data_out : out std_logic_vector(3 downto 0);
            rco : out std_logic
    );end component;

end brojacke_komponente;