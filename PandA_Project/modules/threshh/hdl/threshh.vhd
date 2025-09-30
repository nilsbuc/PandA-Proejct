library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity threshh is
  port(
    --  Clock
    clk_i       : in std_logic;

    --  Block Inputs and Outputs
    inpa_i      : in std_logic_vector(31 downto 0);
    outa_o      : out std_logic_vector(31 downto 0)

    --  Parameters

  );
  end threshh;

  architecture rtl of threshh is

    signal threshold_VAL   : std_logic_vector(31 downto 0);

    begin

      process(inpa_i)
        begin

          if inpa_i >= threshold_VAL then               --to_integer(unsigned(inpa_i))
            outa_o <= inpa_i;
          else
            outa_o <= X"00000000";
          end if;
        end process;
    end architecture;
