library ieee;
use ieee.std_logic_1164.all;

entity tb_serial_adder is
end tb_serial_adder;

architecture beh_tb_serial_adder of tb_serial_adder is

    component serial_adder is
    port(   data_in_a, data_in_b : in std_logic_vector(3 downto 0);
            sum_out              : out std_logic_vector(3 downto 0);
            c_out                : out std_logic;
            clk, clr             : in std_logic
    );end component;

    signal data_in_a, data_in_b  : std_logic_vector(3 downto 0);
    signal sum_out               : std_logic_vector(3 downto 0);
    signal clk, clr, c_out        : std_logic;

    begin

        hac : serial_adder port map(
                data_in_a => data_in_a,
                data_in_b => data_in_b,
                sum_out => sum_out,
                clk => clk,
                clr => clr
        );
    
    clock : process
    begin
        clr <= '0';  clk <= '0'; wait for 50 ns;  clr <= '1';

        data_in_a <= "1111";    data_in_b <= "0001";

        clk <= '1'; wait for 50 ns;  clk <= '0';    wait for 50 ns;
        clk <= '1'; wait for 50 ns;  clk <= '0';    wait for 50 ns;
        clk <= '1'; wait for 50 ns;  clk <= '0';    wait for 50 ns;
        clk <= '1'; wait for 50 ns;  clk <= '0';    wait for 50 ns;


        assert false report "Test done!" severity error;
        wait;

    end process;
end beh_tb_serial_adder;
