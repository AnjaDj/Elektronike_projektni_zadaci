library ieee;
use ieee.std_logic_1164.all;

entity serial_adder is
port(   data_in_a, data_in_b : in std_logic_vector(3 downto 0);
        sum_out              : out std_logic_vector(3 downto 0);
        c_out                : out std_logic;
        clk, clr             : in std_logic
);end serial_adder;

architecture beh_serial_adder of serial_adder is

    signal ci, ci_next         : std_logic := '0';
    signal s                   : std_logic_vector(3 downto 0) := "0000";

    begin

    process(clk,clr)
        variable i             : integer := 0;
    begin
            if (clr = '0') then             sum_out <= "0000"; c_out <= '0';

            elsif (rising_edge(clk)) then   
                                            ci_next <= (data_in_a(i) and data_in_b(i)) or ((data_in_a(i) xor data_in_b(i)) and ci);
                                            s(i) <= data_in_a(i) xor data_in_b(i) xor ci;
                                            i := i + 1;

            elsif (falling_edge(clk)) then  ci <= ci_next;
                                            if (i = 4) then                     -- Konacna suma i konacan prenos ce se generisati tek na opadajucu ivicu 4. takt impulsa
                                                    sum_out <= s;  
                                                    c_out <= ci;
                                            end if;
            end if;
            
    end process;

end beh_serial_adder;
