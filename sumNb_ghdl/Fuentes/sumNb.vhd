library IEEE;
use IEEE.std_logic_1164.all;

entity sumNb is
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
end;

architecture sumNb_arq of sumNb is
	-- Sumador full de 1 bit
	component sum1b is
		port (
			a_i : in std_logic;
			b_i : in std_logic;
			s_o : out std_logic;
			cy_i : in std_logic;
			cy_o : out std_logic
		);
	end component;

	-- Declaro señal que interconecta los carry
	signal aux : std_logic_vector(N downto 0);
begin
	-- Conecto carry de entrada de sumador 4 bit
	aux(0) <= cy_i;

	sumNb_gen : for i in 0 to N - 1 generate
		sum1b_inst : sum1b
		port map(
			a_i => a_i(i),
			b_i => b_i(i),
			s_o => s_o(i),
			cy_i => aux(i),
			cy_o => aux(i + 1)
		);
	end generate;

	-- Conecto carry de salida de sumador 4 bit
	cy_o <= aux(N);
end;