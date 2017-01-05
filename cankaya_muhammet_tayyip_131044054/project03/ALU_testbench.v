module ALU_testbench();

reg [31:0]content1;
reg [31:0]content2;
reg [2:0]ALUControlBit;
wire zero;
wire overflow;
wire carryOut;
wire [31:0]ALUresult;


ALU foo(ALUresult,zero,overflow,carryOut,content1,content2,ALUControlBit);

initial begin 
	content1=32'b00000000000000000000000000001111; content2=32'b00000000000000000000000000000101; ALUControlBit=3'b000;
	#20;
	content1=32'b00000000000000000000000000001111; content2=32'b00000000000000000000000000000101; ALUControlBit=3'b001;
	#20;
	content1=32'b00000000000000000000000000001111; content2=32'b00000000000000000000000000000101; ALUControlBit=3'b010;
	#20;
	content1=32'b11111111111111111111111111111101; content2=32'b00000000000000000000000000000001; ALUControlBit=3'b011;
	#20;
	content1=32'b00000000000000000000000000000001; content2=32'b00000000000000000000000000000101; ALUControlBit=3'b110;
	#20;
	content1=32'b00000000000000000000000000001111; content2=32'b00000000000000000000000000000101; ALUControlBit=3'b111;
	#20;
	content1=32'b00000000000000000000000000001111; content2=32'b00000000000000000000000000000011; ALUControlBit=3'b100;
	#20;
	content1=32'b00000000000000000000000000001111; content2=32'b00000000000000000000000000000011; ALUControlBit=3'b101;
	#20;
end

initial begin 
	$monitor("content1 : %32b, content2 : %32b, ALUresult %32b,  ALUresult %5d  ,ZeroBit %1b", content1,content2,ALUresult, ALUresult,zero);
end


endmodule 