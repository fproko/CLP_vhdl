library IEEE;
use IEEE.std_logic_1164.all;

-- Flip Flop D

entity reg is
    generic (
        N : natural := 5
    );
    port (
        clk_i : in std_logic; --clock
        srst_i : in std_logic; --reset sincronico
        arst_i : in std_logic; --reset asincronico
        ena_i : in std_logic; --enable       
        d_i : in std_logic_vector(N - 1 downto 0);
        q_o : out std_logic_vector(N - 1 downto 0)
    );
end;

architecture reg_arq of reg is
begin
    process (clk_i, arst_i) -- escucha al clk_i y arst_i
        -- variable
    begin
        if arst_i = '1' then -- reset asincronico
            q_o <= (others => '0'); -- verifica el ancho del dato que está a la izquierda y lo llena de ceros
        elsif rising_edge(clk_i) then
            if srst_i = '1' then -- reset sincronico
                q_o <= (others => '0');
            elsif ena_i = '1' then -- si esta habilitado
                q_o <= d_i;
            end if;
        end if;
    end process;
end;