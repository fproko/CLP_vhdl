library IEEE;
use IEEE.std_logic_1164.all;

-- Entidad
entity neg is
	port(
		a_i: in std_logic; -- a_i permite indentificar que es un puerto in
		b_o: out std_logic -- b_o permite indentificar que es un puerto out
	);
end;

-- Descripción de Arquitectura
architecture neg_arq of neg is
begin
	b_o <= not a_i;
end;
