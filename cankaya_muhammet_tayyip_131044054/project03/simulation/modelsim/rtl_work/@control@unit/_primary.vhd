library verilog;
use verilog.vl_types.all;
entity ControlUnit is
    generic(
        addi            : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        addiu           : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi1);
        andi            : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi1, Hi0, Hi0);
        beq             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        bne             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi1);
        j               : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        jal             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi1);
        lbu             : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi0);
        lhu             : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi1, Hi0, Hi1);
        lui             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi1, Hi1, Hi1);
        lw              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi1);
        ori             : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi1, Hi0, Hi1);
        Rtype           : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        slti            : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi0, Hi1, Hi0);
        sltiu           : vl_logic_vector(0 to 5) := (Hi0, Hi0, Hi1, Hi0, Hi1, Hi1);
        sb              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi0);
        sh              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi1);
        sw              : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi1)
    );
    port(
        RegDst          : out    vl_logic;
        Jump            : out    vl_logic;
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemtoReg        : out    vl_logic_vector(1 downto 0);
        ALUOpSignal     : out    vl_logic_vector(3 downto 0);
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic;
        InstrOpCode     : in     vl_logic_vector(5 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of addi : constant is 1;
    attribute mti_svvh_generic_type of addiu : constant is 1;
    attribute mti_svvh_generic_type of andi : constant is 1;
    attribute mti_svvh_generic_type of beq : constant is 1;
    attribute mti_svvh_generic_type of bne : constant is 1;
    attribute mti_svvh_generic_type of j : constant is 1;
    attribute mti_svvh_generic_type of jal : constant is 1;
    attribute mti_svvh_generic_type of lbu : constant is 1;
    attribute mti_svvh_generic_type of lhu : constant is 1;
    attribute mti_svvh_generic_type of lui : constant is 1;
    attribute mti_svvh_generic_type of lw : constant is 1;
    attribute mti_svvh_generic_type of ori : constant is 1;
    attribute mti_svvh_generic_type of Rtype : constant is 1;
    attribute mti_svvh_generic_type of slti : constant is 1;
    attribute mti_svvh_generic_type of sltiu : constant is 1;
    attribute mti_svvh_generic_type of sb : constant is 1;
    attribute mti_svvh_generic_type of sh : constant is 1;
    attribute mti_svvh_generic_type of sw : constant is 1;
end ControlUnit;
