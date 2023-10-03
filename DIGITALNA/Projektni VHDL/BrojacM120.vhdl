library ieee;
use ieee.std_logic_1164.all;
use work.brojacke_komponente.all;

entity BrojacM120 is
port(   data_out : out std_logic_vector(7 downto 0);
        clk, clr : in std_logic;
        rco : out std_logic
); end entity BrojacM120;

architecture BrojacM120_beh of BrojacM120 is

    signal startValue : std_logic_vector(3 downto 0) := "0000";
    signal enable1 : std_logic := '1';
    signal data_out_L, data_out_H : std_logic_vector(3 downto 0);

    signal load : std_logic; 
    signal rcoL : std_logic;

begin
    BL : Brojac74S163 port map (clr,clk,enable1,enable1,load,startValue,data_out_L,rcoL);
    BH : Brojac74S163 port map (clr,clk,rcoL,rcoL,load,startValue,data_out_H,rco);

    load <= (not(data_out_H(3)) and data_out_H(2) and data_out_H(1) and data_out_H(0)) nand (not(data_out_L(3)) and data_out_L(2) and data_out_L(1) and data_out_L(0));

    data_out(7) <= data_out_H(3);
    data_out(6) <= data_out_H(2);
    data_out(5) <= data_out_H(1);
    data_out(4) <= data_out_H(0);
    data_out(3) <= data_out_L(3);
    data_out(2) <= data_out_L(2);
    data_out(1) <= data_out_L(1);
    data_out(0) <= data_out_L(0);

end architecture BrojacM120_beh;
