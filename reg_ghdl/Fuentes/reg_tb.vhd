library ieee;
use ieee.std_logic_1164.all;

entity reg_tb is
end entity;

architecture reg_tb_arq of reg_tb is
    component reg is
        generic (
            N : natural := 4
        );
        port (
            clk_i : in std_logic; --clock
            srst_i : in std_logic; --reset sincronico
            arst_i : in std_logic; --reset asincronico
            ena_i : in std_logic; --enable       
            d_i : in std_logic_vector(N - 1 downto 0);
            q_o : out std_logic_vector(N - 1 downto 0)
        );
    end component;

    constant N_tb : natural := 5; -- le puedo pasar otro valor

    signal clk_tb : std_logic := '0';
    signal srst_tb : std_logic := '0';
    signal arst_tb : std_logic := '1';
    signal ena_tb : std_logic := '1';
    signal d_tb : std_logic_vector(N_tb - 1 downto 0) := "00111";
    signal q_tb : std_logic_vector(N_tb - 1 downto 0);

begin
    clk_tb <= not clk_tb after 10 ns;
    arst_tb <= '0' after 30 ns;
    ena_tb <= '0' after 50 ns, '1' after 400 ns;
    d_tb <= "00100" after 300 ns;
    srst_tb <= '1' after 612 ns;

    DUT : reg
    generic map(
        N => N_tb
    )
    port map(
        clk_i => clk_tb,
        srst_i => srst_tb,
        arst_i => arst_tb,
        ena_i => ena_tb,
        d_i => d_tb,
        q_o => q_tb
    );
end;