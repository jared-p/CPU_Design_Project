library verilog;
use verilog.vl_types.all;
entity memory_control_with_RAM is
    port(
        source1         : in     vl_logic_vector(31 downto 0);
        source2         : in     vl_logic_vector(31 downto 0);
        alu_result      : in     vl_logic_vector(31 downto 0);
        opcode          : in     vl_logic_vector(3 downto 0);
        register_data   : out    vl_logic_vector(31 downto 0);
        pc_instruction  : in     vl_logic_vector(15 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0)
    );
end memory_control_with_RAM;
