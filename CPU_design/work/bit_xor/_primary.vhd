library verilog;
use verilog.vl_types.all;
entity bit_xor is
    port(
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(35 downto 0);
        bit_xor_en      : in     vl_logic
    );
end bit_xor;
