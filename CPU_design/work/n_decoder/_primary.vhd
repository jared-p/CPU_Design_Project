library verilog;
use verilog.vl_types.all;
entity n_decoder is
    generic(
        n               : integer := 16
    );
    port(
        \in\            : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector;
        ldr_in          : in     vl_logic_vector(31 downto 0);
        ldr_out         : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end n_decoder;
