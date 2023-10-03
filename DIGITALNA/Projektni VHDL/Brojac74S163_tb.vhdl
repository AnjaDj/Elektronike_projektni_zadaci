library ieee;
use ieee.std_logic_1164.all;

entity Brojac74S163_tb is
end entity Brojac74S163_tb;

architecture Brojac74S163_tb_beh of Brojac74S163_tb is

    component Brojac74S163 is
    port(   clr, clk, enp, ent, load : in std_logic;
            data_in  : in std_logic_vector(3 downto 0);
            data_out : out std_logic_vector(3 downto 0);
            rco : out std_logic
    );end component;

        signal clr, clk, enp, ent, load, rco : std_logic;
        signal data_in, data_out : std_logic_vector(3 downto 0);

begin

    hac : Brojac74S163 port map(
        clk => clk,
        clr => clr,
        enp => enp,
        ent => ent,
        rco => rco,
        load => load,
        data_in => data_in,
        data_out => data_out
    );

    process
    begin

        ent <= '1';
        enp <= '1';
        clr <= '0';  load <= '1';
        clk <= '0';
        wait for 10 ns;

        clk <= '1'; wait for 10 ns; 
        clk <= '0'; clr <= '1'; wait for 10 ns;

        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;
        clk <= '1'; wait for 10 ns; clk <= '0'; wait for 10 ns;


        assert false report "Test zavrsen" severity note;
        wait;

    end process;
end architecture Brojac74S163_tb_beh;