library IEEE;
use IEEE.std_logic_1164.all;

-- No tiene entradas
entity mux_tb is
end;

architecture mux_tb_arq of mux_tb is
  component mux is
    port(
          a_i: in std_logic;
          b_i: in std_logic;
          sel_i: in std_logic;
          s_o: out std_logic
      );
  end component;

  -- Parte declarativa: señales de exitación
  signal a_tb : std_logic := '0';
  signal b_tb : std_logic := '0';
  signal sel_tb : std_logic := '0';
  signal s_tb : std_logic;

begin

  a_tb <= not a_tb after 5 ns;
  b_tb <= not b_tb after 10 ns;
  sel_tb <= not sel_tb after 20 ns;

  -- Instancia de componente bajo prueba, DUT es una etiqueta
  DUT : mux
    port map(
      a_i => a_tb,
      b_i => b_tb,
      sel_i => sel_tb,
      s_o => s_tb
    );

end;
