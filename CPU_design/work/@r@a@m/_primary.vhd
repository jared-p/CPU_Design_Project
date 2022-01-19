library verilog;
use verilog.vl_types.all;
entity RAM is
    port(
        Enable          : in     vl_logic;
        ReadWrite       : in     vl_logic;
        Address         : in     vl_logic_vector(15 downto 0);
        DataIn          : in     vl_logic_vector(31 downto 0);
        DataOut         : out    vl_logic_vector(31 downto 0)
    );
end RAM;
