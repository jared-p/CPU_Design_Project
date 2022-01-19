library verilog;
use verilog.vl_types.all;
entity right_shift_reg is
    generic(
        N               : integer := 5
    );
    port(
        din             : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(35 downto 0);
        s_value         : in     vl_logic_vector(4 downto 0);
        right_shift_en  : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end right_shift_reg;
