library verilog;
use verilog.vl_types.all;
entity setFlag is
    port(
        sbit            : in     vl_logic;
        opcode          : in     vl_logic_vector(3 downto 0);
        inter_flags     : in     vl_logic_vector(3 downto 0);
        shift_flags     : in     vl_logic_vector(3 downto 0);
        flags           : out    vl_logic_vector(3 downto 0);
        en_intermediate : in     vl_logic_vector(15 downto 0);
        en              : out    vl_logic_vector(15 downto 0);
        condition       : in     vl_logic_vector(3 downto 0)
    );
end setFlag;
