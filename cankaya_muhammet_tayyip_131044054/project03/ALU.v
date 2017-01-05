module ALU(ALUresult,zero,overflow,carryOut,content1,content2,ALUControlBit);


input [31:0]content1;
input [31:0]content2;
input [2:0]ALUControlBit;
output zero;
output overflow;
output carryOut;
output [31:0]ALUresult;


//Temel operasyonlarim 8 tane oldugu icin ALUControlBit en az 3 bit olmasi gerektigi icin 3 bit kullandim.
parameter And = 3'b000;
parameter Or =  3'b001;
parameter Add = 3'b010;
parameter Nor = 3'b011;
parameter Sll = 3'b100;
parameter Srl = 3'b101;
parameter Sub = 3'b110;
parameter Slt = 3'b111;


wire [31:0] resultAnd;
wire [31:0] resultOr;
wire [31:0] resultAdd;
wire [31:0] resultNor;
wire [31:0] resultSll;
wire [31:0] resultSrl;
wire [31:0] resultSub;
wire [31:0] resultSlt;

wire [31:0] TwosCompcontent1;
wire [31:0] TwosCompcontent2;


assign TwosCompcontent1=(~content1)+1'b1;
assign TwosCompcontent2=(~content2)+1'b1;
assign zero = (content1==content2) ? 1 : 0;

assign resultAnd = content1 & content2;
assign resultOr  = content1 | content2;
assign resultAdd = content1 + content2;
assign resultNor = ~(resultOr);
assign resultSll = content1<<content2;
assign resultSrl = content1>>content2;
assign resultSub = content1 - content2;
assign resultSlt = 32'b00000000000000000000000000000000 + (content1 < content2 ? 1 :0) ;

//assign resultSub = resultSlt==32'b00000000000000000000000000000001 ? content1+TwosCompcontent2 :(content1 - content2);


assign ALUresult = ALUControlBit == And ? resultAnd :
						 ALUControlBit == Or  ? resultOr  :
						 ALUControlBit == Add ? resultAdd :
						 ALUControlBit == Nor ? resultNor :
						 ALUControlBit == Sll ? resultSll :
						 ALUControlBit == Srl ? resultSrl :
						 ALUControlBit == Sub ? resultSub :
						 ALUControlBit == Slt ? resultSlt :32'bx;
endmodule