library verilog;
use verilog.vl_types.all;
entity n_mux is
    generic(
        n               : integer := 32
    );
    port(
        in1             : in     vl_logic_vector;
        in2             : in     vl_logic_vector;
        in3             : in     vl_logic_vector;
        in4             : in     vl_logic_vector;
        in5             : in     vl_logic_vector;
        in6             : in     vl_logic_vector;
        in7             : in     vl_logic_vector;
        in8             : in     vl_logic_vector;
        in9             : in     vl_logic_vector;
        in10            : in     vl_logic_vector;
        in11            : in     vl_logic_vector;
        in12            : in     vl_logic_vector;
        in13            : in     vl_logic_vector;
        in14            : in     vl_logic_vector;
        in15            : in     vl_logic_vector;
        in16            : in     vl_logic_vector;
        sel             : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end n_mux;
