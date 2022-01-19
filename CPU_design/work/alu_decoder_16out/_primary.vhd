library verilog;
use verilog.vl_types.all;
entity alu_decoder_16out is
    generic(
        n               : integer := 16
    );
    port(
        \in\            : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end alu_decoder_16out;
