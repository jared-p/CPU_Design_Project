library verilog;
use verilog.vl_types.all;
entity alu_decoder_4out is
    port(
        op_code         : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(3 downto 0)
    );
end alu_decoder_4out;
