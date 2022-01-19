library verilog;
use verilog.vl_types.all;
entity alu_control is
    port(
        condition       : in     vl_logic_vector(3 downto 0);
        opcode          : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic;
        shift           : in     vl_logic_vector(2 downto 0);
        immediate_value : in     vl_logic_vector(15 downto 0);
        source1         : in     vl_logic_vector(31 downto 0);
        source2         : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(31 downto 0);
        flags           : out    vl_logic_vector(3 downto 0);
        pc_trigger      : in     vl_logic;
        pc_out          : out    vl_logic_vector(7 downto 0);
        pc_reset        : in     vl_logic
    );
end alu_control;
