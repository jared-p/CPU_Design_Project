library verilog;
use verilog.vl_types.all;
entity alu_mux_12_in_output_value is
    port(
        opcode          : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0);
        in0             : in     vl_logic_vector(31 downto 0);
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        in3             : in     vl_logic_vector(31 downto 0);
        in4             : in     vl_logic_vector(31 downto 0);
        in5             : in     vl_logic_vector(31 downto 0);
        in6             : in     vl_logic_vector(31 downto 0);
        in7             : in     vl_logic_vector(31 downto 0);
        in8             : in     vl_logic_vector(31 downto 0);
        in9             : in     vl_logic_vector(31 downto 0);
        in10            : in     vl_logic_vector(31 downto 0);
        in11            : in     vl_logic_vector(31 downto 0)
    );
end alu_mux_12_in_output_value;
