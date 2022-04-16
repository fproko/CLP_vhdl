library IEEE;
use IEEE.std_logic_1164.all;

-- No tiene entradas
entity shift_reg_tb is
end;

architecture shift_reg_tb_arq of shift_reg_tb is
  -- Importación componente

  -- Parte declarativa: señales de exitación
begin

  -- Señal de exitación

  -- Instancia de componente bajo prueba, DUT es una etiqueta
  DUT : shift_reg
  port map(
    a_i => a_tb,
    b_o => b_tb
  );

end;