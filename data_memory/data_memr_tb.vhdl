LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY data_memr_tb IS
END data_memr_tb;

ARCHITECTURE test OF data_memr_tb IS

    SIGNAL addr_port : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL write_data : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL clk : STD_LOGIC := '0';
    SIGNAL write_en : STD_LOGIC := '0';
    SIGNAL read_data : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');

BEGIN
    inst_data_memr : ENTITY work.data_memr(rtl)
        PORT MAP(
            addr_port => addr_port,
            write_data => write_data,
            clk => clk,
            write_en => write_en,
            read_data => read_data);
  

    PROCESS BEGIN
        clk <= '1';
        WAIT FOR 5 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        clk <= '0';
    WAIT;
        END PROCESS;

    PROCESS BEGIN
        write_en <= '1';
        addr_port <= B"0000_1100_0111_0000_1111_0010_0110_0001";
        write_data <= B"0000_1100_0111_0000_1111_0010_0110_1111";

        WAIT FOR 20 ns;
        addr_port <= B"0000_1100_0111_0000_1111_0010_0110_0010";
        write_data <= B"0000_1100_0111_0000_1111_0010_0110_1110";

        WAIT FOR 20 ns;

        write_en <= '0';
        addr_port <= B"0000_1100_0111_0000_1111_0010_0110_0001";
        WAIT FOR 20 ns;
        addr_port <= B"0000_1100_0111_0000_1111_0010_0110_0010";
    WAIT;
        END PROCESS;
