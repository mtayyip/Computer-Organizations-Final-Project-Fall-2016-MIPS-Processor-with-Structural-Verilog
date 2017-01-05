library verilog;
use verilog.vl_types.all;
entity PCUnit is
    port(
        targetAddress   : in     vl_logic_vector(31 downto 0);
        InstrOpCode     : in     vl_logic_vector(5 downto 0);
        SignExtend      : in     vl_logic_vector(31 downto 0);
        Branch          : in     vl_logic;
        zero            : in     vl_logic;
        Jump            : in     vl_logic;
        output1         : out    vl_logic_vector(31 downto 0);
        clock           : in     vl_logic
    );
end PCUnit;
