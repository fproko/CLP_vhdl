--- Sumador full de 4 bits sin utilizar generate
library IEEE;
use IEEE.std_logic_1164.all;

entity sum4b_tb is
end;

architecture sum4b_tb_arq of sum4b_tb is

	-- Declaracion de componente
	component sum4b is
		port (
			a_i : in std_logic_vector(3 downto 0);
			b_i : in std_logic_vector(3 downto 0);
			cy_i : in std_logic;
			s_o : out std_logic_vector(3 downto 0);
			cy_o : out std_logic
		);
	end component;

	-- Senales de prueba
	signal a_tb : std_logic_vector(3 downto 0) := "1011";
	signal b_tb : std_logic_vector(3 downto 0) := "0100";
	signal cy_i_tb : std_logic := '0';
	signal s_tb : std_logic_vector(3 downto 0);
	signal cy_o_tb : std_logic;

begin

	-- Senales de excitacion
	a_tb <= "0011" after 100 ns;
	b_tb <= "0101" after 200 ns;
	cy_i_tb <= '1' after 300 ns, '0' after 400 ns;

	-- Instanciacion del componente a probar
	DUT : sum4b
	port map(
		a_i => a_tb,
		b_i => b_tb,
		cy_i => cy_i_tb,
		s_o => s_tb,
		cy_o => cy_o_tb
	);

end;
