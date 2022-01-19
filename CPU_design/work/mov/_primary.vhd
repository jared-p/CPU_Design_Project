library verilog;
use verilog.vl_types.all;
entity mov is
    port(
        r1              : out    vl_logic_vector(35 downto 0);
        r2              : in     vl_logic_vector(31 downto 0);
        add_en          : in     vl_logic
    );
end mov;
