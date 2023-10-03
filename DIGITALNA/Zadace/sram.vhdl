library ieee;
use ieee.std_logic_1164.all;

entity SRAM is
generic( 
    address_size : integer;
    word_size : integer; 

);
port(    
    data_in  :  in std_logic_vector(word_size-1 downto 0);
    data_out : out std_logic_vector(word_size-1 downto 0);
    CS,WE,RE : in std_logic;
    address  : in std_logic_vector(address_size-1 downto 0) 
);
end entity SRAM;

architecture beh_SRAM of SRAM is

    type SRAM_CAPACITY is array (0 to (2**address_size)-1) of std_logic_vector(word_size-1 downto 0);
    signal internal_registers : SRAM_CAPACITY;
    signal addr_index : integer := 0;

begin
    process(address,CS,WE,RE)
    begin

        if(CS = '0') then   -- HI stanje visoke impedanse
                            for i in 0 to word_size-1 loop
                                data_out(i) <= 'Z';
                            end loop;

        elsif(CS = '1') then
                            addr_index <= to_integer(unsigned(address)); -- konverzija adrese iz std_logic_vector u integer radi lakse manipulacije
                            
                            for i in 0 to addr_index-1 loop
                                if (addr_index = i) then 
                                                        if (WE = '1' and RE = '0') then internal_registers(i) <= data_in; 
                                                     elsif (WE = '0' and RE = '1') then data_out <= internal_registers(i);
                                                     end if;
                                end if;
                            end loop;
        end if;

    end process;
end beh_SRAM;
