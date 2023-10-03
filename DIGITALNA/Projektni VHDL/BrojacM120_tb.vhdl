library ieee;
use ieee.std_logic_1164.all;

entity BrojacM120_tb is
end entity BrojacM120_tb;

architecture BrojacM120_tb_beh of BrojacM120_tb is

    component BrojacM120 is
    port(   data_out : out std_logic_vector(7 downto 0);
            clk, clr : in std_logic;
            rco : out std_logic
    ); end component;

    signal data_out : std_logic_vector(7 downto 0);
    signal clk, clr, rco : std_logic;

begin

    M120 : BrojacM120 port map ( data_out => data_out, clk => clk, clr => clr, rco => rco );
    
    process
    begin
        clr <= '0';  clk <= '0';    wait for 10 ns;
        clk <= '1'; wait for 10 ns; 
        clk <= '0'; clr <= '1'; wait for 10 ns;

        for i in 1 to 300 loop
            clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        end loop;  

        assert false report "Test zavrsen" severity note;
        wait;
    end process;    
end architecture BrojacM120_tb_beh;