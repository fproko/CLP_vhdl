library IEEE;
use IEEE.std_logic_1164.all;

entity sum1b is
  port (
    a_i  : in  std_logic;  -- operando 1
    b_i  : in  std_logic;  -- operando 2
    cy_i : in  std_logic;  -- carry de entrada
    s_o  : out std_logic;  -- resultado
    cy_o : out std_logic   -- carry de salida
  );
end;

architecture sum1b_arq of sum1b is
begin
  -- cuenta de suma
  s_o <= a_i xor b_i xor cy_i;
  -- carry de salida
  cy_o <= (a_i and b_i) or (a_i and cy_i) or (b_i and cy_i);

end;
