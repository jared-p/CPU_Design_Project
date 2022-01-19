library verilog;
use verilog.vl_types.all;
entity alu_mux_4_in is
    port(
        sel             : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(35 downto 0);
        in0             : in     vl_logic_vector(31 downto 0);
        in1             : in     vl_logic_vector(35 downto 0);
        in2             : in     vl_logic_vector(35 downto 0);
        in3             : in     vl_logic_vector(35 downto 0)
    );
end alu_mux_4_in;
