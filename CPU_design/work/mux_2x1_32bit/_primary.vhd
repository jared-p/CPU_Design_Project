library verilog;
use verilog.vl_types.all;
entity mux_2x1_32bit is
    port(
        LDR_sel         : in     vl_logic;
        register_data   : out    vl_logic_vector(31 downto 0);
        ram_in          : in     vl_logic_vector(31 downto 0);
        alu_result      : in     vl_logic_vector(31 downto 0)
    );
end mux_2x1_32bit;
