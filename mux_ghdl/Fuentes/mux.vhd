library IEEE;
use IEEE.std_logic_1164.all;

-- Entidad
entity mux is
	port(
		a_i: in std_logic;
		b_i: in std_logic;
		sel_i: in std_logic;
		s_o: out std_logic
	);
end;

-- Descripción de Arquitectura
architecture mux_arq of mux is
begin
	s_o <= (a_i and sel_i) or (b_i and (not sel_i));
	--s_o <= a_i when sel_i = '1' else b_i; -- alternativa
end;
