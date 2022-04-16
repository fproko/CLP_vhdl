library IEEE;
use IEEE.std_logic_1164.all;

entity sumNb_tb is
end;

architecture sumNb_tb_arq of sumNb_tb is

	-- Declaracion de componente
	component sumNb is
		generic (
			N : natural := 4
		);
		port (
			a_i : in std_logic_vector(N - 1 downto 0);
			b_i : in std_logic_vector(N - 1 downto 0);
			s_o : out std_logic_vector(N - 1 downto 0);
			cy_i : in std_logic;
			cy_o : out std_logic
		);
	end component;

	constant N_tb : natural := 6;

	-- Declaracion de senales de prueba
	signal a_tb : std_logic_vector(N_tb - 1 downto 0) := (N_tb - 1 downto 0 => '0'); -- Inicio en 0
	signal b_tb : std_logic_vector(N_tb - 1 downto 0) := (N_tb - 1 downto 0 => '0');
	signal s_tb : std_logic_vector(N_tb - 1 downto 0);
	signal cy_i_tb : std_logic := '0';
	signal cy_o_tb : std_logic;

begin

	a_tb <= "000111" after 100 ns, "010000" after 300 ns;
	b_tb <= "000100" after 200 ns;
	cy_i_tb <= '1' after 400 ns, '0' after 500 ns;

	DUT : sumNb
	generic map(
		N => N_tb
	)
	port map(
		a_i => a_tb,
		b_i => b_tb,
		cy_i => cy_i_tb,
		s_o => s_tb,
		cy_o => cy_o_tb
	);

end;