library IEEE;
use IEEE.std_logic_1164.all;

-- No tiene entradas
entity neg_tb is
end;

architecture neg_tb_arq of neg_tb is
  -- No importo nada porque utilicé entity work.neg

  -- Parte declarativa: señales de exitación
  signal a_tb : std_logic := '0'; -- valor inicial 0
  signal b_tb : std_logic;

begin

  -- Señal de exitación 0 a 1 luego de 250 ns, y luego 1 a 0 luego de 800 ns
  a_tb <= '1' after 250 ns, '0' after 800 ns;

  -- Instancia de componente bajo prueba, DUT es una etiqueta
  DUT : entity work.neg --importación de componente externo
    port map(
      a_i => a_tb, -- a la entrada a_i conecto a_tb
      b_o => b_tb  -- a la salida  b_o conecto b_tb
    );

end;
