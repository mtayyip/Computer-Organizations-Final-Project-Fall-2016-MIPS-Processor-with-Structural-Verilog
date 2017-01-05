library verilog;
use verilog.vl_types.all;
entity ALUControl is
    port(
        ALUOpSignal     : in     vl_logic_vector(3 downto 0);
        InstFunct       : in     vl_logic_vector(5 downto 0);
        ALUControlBit   : out    vl_logic_vector(2 downto 0)
    );
end ALUControl;
