library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        \And\           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        \Or\            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        Add             : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        \Nor\           : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        \Sll\           : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        \Srl\           : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        Sub             : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        Slt             : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1)
    );
    port(
        ALUresult       : out    vl_logic_vector(31 downto 0);
        zero            : out    vl_logic;
        overflow        : out    vl_logic;
        carryOut        : out    vl_logic;
        content1        : in     vl_logic_vector(31 downto 0);
        content2        : in     vl_logic_vector(31 downto 0);
        ALUControlBit   : in     vl_logic_vector(2 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \And\ : constant is 1;
    attribute mti_svvh_generic_type of \Or\ : constant is 1;
    attribute mti_svvh_generic_type of Add : constant is 1;
    attribute mti_svvh_generic_type of \Nor\ : constant is 1;
    attribute mti_svvh_generic_type of \Sll\ : constant is 1;
    attribute mti_svvh_generic_type of \Srl\ : constant is 1;
    attribute mti_svvh_generic_type of Sub : constant is 1;
    attribute mti_svvh_generic_type of Slt : constant is 1;
end ALU;
