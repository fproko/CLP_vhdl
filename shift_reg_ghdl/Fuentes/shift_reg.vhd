library IEEE;
use IEEE.std_logic_1164.all;

entity shift_reg is
	generic (N : natural := 4);
	port (
		clk : in std_logic;
		rst : in std_logic;
		ent : in std_logic;
		sal : out std_logic);
end;

architecture estruc of shift_reg is
	-- Flip Flop D
	component ffd
		port (
			rst : in std_logic := '0';
			clk : in std_logic;
			D : in std_logic; -- Dato de entrada
			Q : out std_logic); -- Dato de salida
	end component;
	-- Señal de conexion
	signal d : std_logic_vector(0 to N);
begin
	-- Generar N veces lo que está declarado dentro del generate
	shift_reg_i : for i in 0 to N - 1 generate
		-- Instancia del componente como siempre
		ff_inst : ffd
		port map(
			rst => rst,
			clk => clk,
			D => d(i), -- Dato de entrada conectado con la señal i
			Q => d (i + 1) -- Dato de salida conectado con la señal i+1
		);
	end generate;
	d(0) <= ent;
	sal <= d(N);
end architecture;