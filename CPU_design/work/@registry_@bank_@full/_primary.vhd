library verilog;
use verilog.vl_types.all;
entity Registry_Bank_Full is
    generic(
        n               : integer := 32
    );
    port(
        ldr             : in     vl_logic_vector;
        d_bits          : in     vl_logic_vector(3 downto 0);
        s1_bits         : in     vl_logic_vector(3 downto 0);
        s2_bits         : in     vl_logic_vector(3 downto 0);
        out_m1          : out    vl_logic_vector;
        out_m2          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end Registry_Bank_Full;
