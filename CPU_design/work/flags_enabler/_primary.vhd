library verilog;
use verilog.vl_types.all;
entity flags_enabler is
    port(
        condition       : in     vl_logic_vector(3 downto 0);
        flags           : in     vl_logic_vector(3 downto 0);
        en_intermediate : in     vl_logic_vector(15 downto 0);
        en              : out    vl_logic_vector(15 downto 0)
    );
end flags_enabler;
