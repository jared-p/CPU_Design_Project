library verilog;
use verilog.vl_types.all;
entity mux_2x1_16bit is
    port(
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector(15 downto 0);
        in1             : in     vl_logic_vector(15 downto 0);
        in0             : in     vl_logic_vector(15 downto 0)
    );
end mux_2x1_16bit;
