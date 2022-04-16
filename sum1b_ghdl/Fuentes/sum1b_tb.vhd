library IEEE;
use IEEE.std_logic_1164.all;

entity sum1b_tb is
end;

architecture sum1b_tb_arq of sum1b_tb is

  -- Declaracion de componente
  component sum1b is
    port (
      a_i  : in  std_logic;  -- operando 1
      b_i  : in  std_logic;  -- operando 2
      cy_i : in  std_logic;  -- carry de entrada
      s_o  : out std_logic;  -- resultado
      cy_o : out std_logic   -- carry de salida
    );
  end component;

  -- Declaracion de senales de prueba
  signal a_tb :  std_logic := '0'; --valor incial 0. Si fuera más de un bit es con ""
  signal b_tb :  std_logic := '0';
  signal cy_i_tb : std_logic := '0';
  signal s_tb : std_logic;
  signal cy_o_tb : std_logic;

begin

  -- Señales de exitación
  -- a_tb <= '1' after 100 ns, '0' after 500 ns;
  -- b_tb <= '1' after 200 ns, '0' after 400 ns;
  -- cy_i_tb <= '1' after 150 ns, '0' after 900 ns;

  -- Más práctico
  a_tb <= not a_tb after 10 ns; --periódico
  b_tb <= not b_tb after 20 ns;
  cy_i_tb <= not cy_i_tb after 40 ns;

  -- Instanciación de componente a probar. DUT es la etiqueta de la instancia.
  DUT : sum1b
  port map(
    a_i  => a_tb, --conexion
    b_i  => b_tb,
    cy_i => cy_i_tb,
    s_o  => s_tb,
    cy_o => cy_o_tb
  );

end;
