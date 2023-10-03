library ieee;
use ieee.std_logic_1164.all;

entity tb_semafor is
end tb_semafor;

architecture beh_tb_semafor of tb_semafor is

    component semafor is
    port( clk, rst, t1, t2, t3 : in std_logic;
      output : out std_logic_vector(1 downto 0)
    );
    end component;

    signal clk, rst, t1, t2, t3 : std_logic :='0';
    signal output : std_logic_vector(1 downto 0) :="00";

    begin

        hac : semafor port map(
            clk => clk,
            rst => rst,
            t1 => t1,
            t2 => t2,
            t3 => t3,
            output => output
        );

        clock : process
        begin
           
            rst <= '1';  wait for 5 ns;
            assert (output = "11") report "Greska : B" severity error;

            clk <= '1'; wait for 5 ns;
            assert (output = "11") report "Greska : B" severity error;

            clk <= '0';  wait for 5 ns;
            assert (output = "11") report "Greska : B" severity error;

            --------------------------------------------------------------------------------------------

            rst <= '0';  clk <= '1';    wait for 5 ns;
            assert (output = "00") report "Greska : B -> R" severity error;
            clk <= '0';  wait for 5 ns;
            
            clk <= '1';  wait for 5 ns;
            assert (output = "01") report "Greska : R -> Y" severity error;
            clk <= '0';  wait for 5 ns;

            clk <= '1';  wait for 5 ns;
            assert (output = "10") report "Greska : Y -> G" severity error;
            clk <= '0';  wait for 5 ns;

            clk <= '1';  wait for 5 ns;
            assert (output = "00") report "Greska : G -> R" severity error;
            clk <= '0';  wait for 5 ns;

            clk <= '1';  wait for 5 ns;
            assert (output = "01") report "Greska : R -> Y" severity error;
            clk <= '0';  wait for 5 ns;

            clk <= '1';  wait for 5 ns;
            assert (output = "10") report "Greska : Y -> G" severity error;
            clk <= '0';  wait for 5 ns;

            clk <= '1';  wait for 5 ns;
            assert (output = "00") report "Greska : G -> R" severity error;
            clk <= '0';  wait for 5 ns;

            -------------------------------------------------------------------------------------------

            t1 <= '1';  clk <= '1';    wait for 5 ns;
            assert (output = "00") report "Greska : R -> R" severity error;
            clk <= '0';  wait for 5 ns;
            
            clk <= '1';  wait for 5 ns;
            assert (output = "00") report "Greska : R -> R" severity error;
            clk <= '0';  wait for 5 ns;

            t1 <= '0';     
            clk <= '1';  wait for 5 ns;
            assert (output = "01") report "Greska : R -> Y" severity error;
            clk <= '0';  wait for 5 ns;

            t2 <= '1';  clk <= '1';  wait for 5 ns;
            assert (output = "01") report "Greska : Y -> Y" severity error;
            clk <= '0';  wait for 5 ns;            

            t2 <= '0';   
            clk <= '1';  wait for 5 ns;
            assert (output = "10") report "Greska : Y -> G" severity error;
            clk <= '0';  wait for 5 ns;

            t3 <= '1';  clk <= '1';  wait for 5 ns;
            assert (output = "10") report "Greska : G -> G" severity error;
            clk <= '0';  wait for 5 ns;            

            clk <= '1';  wait for 5 ns;
            assert (output = "10") report "Greska : G -> G" severity error;
            clk <= '0';  wait for 5 ns;      

            t3 <= '0';  clk <= '1';  wait for 5 ns;     
            assert (output = "00") report "Greska : G -> R" severity error;
            clk <= '0';  wait for 5 ns; 

            assert false report "Test zavrsen" severity note;
            wait;

        end process;
end beh_tb_semafor;