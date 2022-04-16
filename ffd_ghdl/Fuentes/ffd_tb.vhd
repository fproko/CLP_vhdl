library ieee;
use ieee.std_logic_1164.all;

entity ffd_tb is
end entity;

architecture ffd_tb_arq of ffd_tb is
    component ffd is
        port (
            clk_i : in std_logic; --clock
            srst_i : in std_logic; --reset sincronico
            arst_i : in std_logic; --reset asincronico
            ena_i : in std_logic; --enable       
            d_i : in std_logic; --dato de entrada
            q_o : out std_logic --salida
        );
    end component;

    signal clk_tb : std_logic := '0';
    signal srst_tb : std_logic := '0';
    signal arst_tb : std_logic := '1';
    signal ena_tb : std_logic := '1';
    signal d_tb : std_logic := '1';
    signal q_tb : std_logic;

begin
    clk_tb <= not clk_tb after 10 ns;
    arst_tb <= '0' after 30 ns;
    ena_tb <= '0' after 50 ns, '1' after 400 ns;
    d_tb <= '0' after 300 ns;
    srst_tb <= '1' after 612 ns;

    DUT : ffd
    port map(
        clk_i => clk_tb,
        srst_i => srst_tb,
        arst_i => arst_tb,
        ena_i => ena_tb,
        d_i => d_tb,
        q_o => q_tb
    );
end;