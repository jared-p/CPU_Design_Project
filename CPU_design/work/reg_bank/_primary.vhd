library verilog;
use verilog.vl_types.all;
entity reg_bank is
    generic(
        n               : integer := 32
    );
    port(
        ldr             : in     vl_logic_vector;
        \in\            : in     vl_logic_vector(15 downto 0);
        out1            : out    vl_logic_vector;
        out2            : out    vl_logic_vector;
        out3            : out    vl_logic_vector;
        out4            : out    vl_logic_vector;
        out5            : out    vl_logic_vector;
        out6            : out    vl_logic_vector;
        out7            : out    vl_logic_vector;
        out8            : out    vl_logic_vector;
        out9            : out    vl_logic_vector;
        out10           : out    vl_logic_vector;
        out11           : out    vl_logic_vector;
        out12           : out    vl_logic_vector;
        out13           : out    vl_logic_vector;
        out14           : out    vl_logic_vector;
        out15           : out    vl_logic_vector;
        out16           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end reg_bank;
