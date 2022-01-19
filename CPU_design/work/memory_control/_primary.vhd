library verilog;
use verilog.vl_types.all;
entity memory_control is
    port(
        source1         : in     vl_logic_vector(31 downto 0);
        source2         : in     vl_logic_vector(31 downto 0);
        alu_result      : in     vl_logic_vector(31 downto 0);
        opcode          : in     vl_logic_vector(3 downto 0);
        address         : out    vl_logic_vector(15 downto 0);
        rw              : out    vl_logic;
        datain          : in     vl_logic_vector(31 downto 0);
        dataout         : out    vl_logic_vector(31 downto 0);
        en              : out    vl_logic;
        LDR_sel         : out    vl_logic;
        address_sel     : out    vl_logic
    );
end memory_control;
