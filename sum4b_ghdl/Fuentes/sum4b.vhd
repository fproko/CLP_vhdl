--- Sumador full de 4 bits sin utilizar generate
library IEEE;
use IEEE.std_logic_1164.all;

entity sum4b is
  port (
    a_i : in std_logic_vector(3 downto 0); -- Entrada de 4 bits. Bit de la izquierda MSB
    b_i : in std_logic_vector(3 downto 0); -- Entrada de 4 bits
    cy_i : in std_logic;
    s_o : out std_logic_vector(3 downto 0); -- Salida de 4 bits
    cy_o : out std_logic
  );
end;

architecture sum4b_arq of sum4b is
  -- Sumador full de 1 bit
  component sum1b is
    port (
      a_i : in std_logic;
      b_i : in std_logic;
      cy_i : in std_logic;
      s_o : out std_logic;
      cy_o : out std_logic
    );
  end component;

  -- Declaro señal que interconecta los carry
  signal aux : std_logic_vector(4 downto 0);

begin
  -- Conecto carry de entrada de sumador 4 bit
  aux(0) <= cy_i;

  -- Instancio 4 veces los sumadores de 1 bit
  sum1b_ins_0 : sum1b
  port map(
    -- puerto sum1b => puerto sum4b
    a_i => a_i(0),
    b_i => b_i(0),
    cy_i => aux(0),
    s_o => s_o(0),
    cy_o => aux(1)
  );

  sum1b_ins_1 : sum1b
  port map(
    a_i => a_i(1),
    b_i => b_i(1),
    cy_i => aux(1),
    s_o => s_o(1),
    cy_o => aux(2)
  );

  sum1b_ins_2 : sum1b
  port map(
    a_i => a_i(2),
    b_i => b_i(2),
    cy_i => aux(2),
    s_o => s_o(2),
    cy_o => aux(3)
  );

  sum1b_ins_3 : sum1b
  port map(
    a_i => a_i(3),
    b_i => b_i(3),
    cy_i => aux(3),
    s_o => s_o(3),
    cy_o => aux(4)
  );

  -- Conecto carry de salida de sumador 4 bit
  cy_o <= aux(4);

end;