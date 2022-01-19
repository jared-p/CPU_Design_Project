library verilog;
use verilog.vl_types.all;
entity immediateMov is
    port(
        n               : in     vl_logic_vector(15 downto 0);
        r1              : out    vl_logic_vector(35 downto 0);
        add_en          : in     vl_logic
    );
end immediateMov;
