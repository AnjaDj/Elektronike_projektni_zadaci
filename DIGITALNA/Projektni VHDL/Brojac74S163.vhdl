library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Brojac74S163 is
port(   clr, clk, enp, ent, load : in std_logic;
        data_in  : in std_logic_vector(3 downto 0);
        data_out : out std_logic_vector(3 downto 0);
        rco : out std_logic
);end entity Brojac74S163;

architecture Brojac74S163_beh of Brojac74S163 is
    signal internal_signal : std_logic_vector(3 downto 0) := "0000";
begin

    process(clk)
    begin

        if (rising_edge(clk) and clr ='0') then     internal_signal <= "0000";
        elsif (rising_edge(clk) and load ='0') then internal_signal <= data_in;
        elsif (rising_edge(clk) and ent ='1' and enp ='1') then  internal_signal <= std_logic_vector(unsigned(internal_signal) + 1);
        end if;
        
    end process;

    data_out <= internal_signal;
    rco <= ent and internal_signal(3) and internal_signal(2) and internal_signal(1) and internal_signal(0);
    
end architecture Brojac74S163_beh;

