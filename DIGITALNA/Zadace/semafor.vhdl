library ieee;
use ieee.std_logic_1164.all;

entity semafor is
port( clk, rst, t1, t2, t3 : in std_logic;
      output : out std_logic_vector(1 downto 0)
);
end semafor;

architecture beh_semafor of semafor is
    type semafor_states is (R,Y,G,B);
    signal present_state, next_state : semafor_states;

    begin
    -- SEKVENCIJALNI DIO

        process(clk,rst)
        begin
            if (rst = '1') then present_state <= B;
            elsif (rising_edge(clk)) then present_state <= next_state;
            end if;
        end process;

    -- KOMBINACIONI DIO

        process(present_state,t1,t2,t3)
            variable pom : std_logic := '0';
        begin
            case present_state is
                                when B =>   output <= "11";     next_state <= R;    pom := '1';

                                when R =>   if (pom = '1') then 
                                                                output <= "00";
                                                                next_state <= Y; 
                                                                pom := '0';
                                            elsif (t3 = '0') then 
                                                                output <= "00"; 
                                                                next_state <= Y; 
                                            else
                                                                output <= "10";
                                            end if;
                                when Y =>   if (t1 = '0') then 
                                                                output <= "01";
                                                                next_state <= G;
                                            else
                                                                output <= "00";
                                            end if;
                                when G =>   if (t2 = '0') then
                                                                output <= "10"; 
                                                                next_state <= R;
                                            else
                                                                output <= "01";
                                            end if;
            end case;
        end process;

end beh_semafor;
                
                                    