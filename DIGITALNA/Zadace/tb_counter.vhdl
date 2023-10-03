library ieee;
use ieee.std_logic_1164.all;

entity tb_counter is
end tb_counter;

architecture beh_tb_counter of tb_counter is

    component counter is
    port( clr, cls, clk, gd : in std_logic;
          data_out : out std_logic_vector(3 downto 0)
    );
    end component;

    signal clr, cls, clk, gd : std_logic := '1';
    signal data_out : std_logic_vector(3 downto 0);

    begin
        hac : counter port map(
            data_out => data_out,
            clr => clr,
            cls => cls,
            clk => clk,
            gd => gd
        );

        unapred : process
        begin
                                -- Brojanje unapred
            gd <= '1';      cls <= '1';     clr <= '0';    clk <= '1';     wait for 5 ns;
            assert (data_out = "0000") report "Greska : Pocetno stanje brojanja unapred" severity error;

            clr <= '1';

            clk <= '0';       wait for 5 ns;
            assert (data_out = "0001") report "Greska : S0 -> S1" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';       wait for 5 ns;
            assert (data_out = "0010") report "Greska : S1 -> S2" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';       wait for 5 ns;
            assert (data_out = "0011") report "Greska : S2 -> S3" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';       wait for 5 ns;
            assert (data_out = "0100") report "Greska : S3 -> S4" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';       wait for 5 ns;
            assert (data_out = "0101") report "Greska : S4 -> S5" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0110") report "Greska : S5 -> S6" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0111") report "Greska : S6 -> S7" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1000") report "Greska : S7 -> S8" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1001") report "Greska : S8 -> S9" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1010") report "Greska : S9 -> S10" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1011") report "Greska : S10 -> S11" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1100") report "Greska : S11 -> S12" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1101") report "Greska : S12 -> S13" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1110") report "Greska : S13 -> S14" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1111") report "Greska : S14 -> S15" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0000") report "Greska : S15 -> S0" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0001") report "Greska : S0 -> S1" severity error;

                            -- Brojanje unazad

            gd <= '0';  cls <= '0';     clr <= '1';     clk <= '1';

            wait for 5 ns;
            assert (data_out = "1111") report "Greska : Pocetno stanje brojanja unazad" severity error;

            cls <= '1';    clk <= '0';       wait for 5 ns;
            assert (data_out = "1110") report "Greska : S15 -> S14" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';       wait for 5 ns;
            assert (data_out = "1101") report "Greska : S14 -> S13" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';       wait for 5 ns;
            assert (data_out = "1100") report "Greska : S13 -> S12" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';       wait for 5 ns;
            assert (data_out = "1011") report "Greska : S12 -> S11" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';       wait for 5 ns;
            assert (data_out = "1010") report "Greska : S11 -> S10" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1001") report "Greska : S10 -> S9" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1000") report "Greska : S9 -> S8" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0111") report "Greska : S8 -> S7" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0110") report "Greska : S7 -> S6" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0101") report "Greska : S6 -> S5" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0100") report "Greska : S5 -> S4" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0011") report "Greska : S4 -> S3" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0010") report "Greska : S3 -> S2" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0001") report "Greska : S2 -> S1" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "0000") report "Greska : S1 -> S0" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1111") report "Greska : S0 -> S15" severity error;

            clk <= '1';     wait for 5 ns;

            clk <= '0';     wait for 5 ns;
            assert (data_out = "1110") report "Greska : S15 -> S14" severity error;

            assert false report "Test zavrsen" severity note;
            wait;

        end process;

end beh_tb_counter;