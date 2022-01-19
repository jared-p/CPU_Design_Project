library verilog;
use verilog.vl_types.all;
entity final_design is
    port(
        clk             : in     vl_logic;
        pc_reset        : in     vl_logic;
        flags           : out    vl_logic_vector(3 downto 0)
    );
end final_design;
