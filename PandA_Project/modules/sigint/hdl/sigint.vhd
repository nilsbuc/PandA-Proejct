library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sigint is
  port (
    -- Clock
    clk_i               : in std_logic;

    --Block Inputs and Outputs
    inpa_i              : in std_logic_vector(31 downto 0);
    outa_o              : out std_logic_vector(31 downto 0);

    --Parameters
    enable               :in std_logic
  );
  end sigint;

  architecture rtl of sigint is

    signal inpa_reg     : std_logic_vector(31 downto 0);
    signal integ        : std_logic_vector(31 downto 0);
    signal enable_reg   : std_logic;

    begin

      outa_o <= integ;
      
      process(clk_i)
         begin

           if rising_edge(clk_i) then
             enable_reg <= enable;

             if enable_reg = '0' and enable = '1' then
               inpa_reg <= b"00000000000000000000000000000000";
               integ    <= b"00000000000000000000000000000000";
             end if;
           end if;
       end process;

       process(clk_i)
         begin

           if rising_edge(clk_i) then
             inpa_reg <= inpa_i;
             
             if enable_reg = '1' and enable = '1' then
               integ <= std_logic_vector(unsigned(integ) + unsigned(inpa_reg));
             end if;
           end if;
       end process;

 end architecture;
      
