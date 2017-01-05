module ControlUnit_testbench();

reg  [5:0] InstrOpCode;
wire RegDst;
wire Jump;
wire Branch;
wire MemRead;
wire [1:0] MemtoReg; 
wire [3:0] ALUOpSignal;
wire MemWrite;
wire ALUSrc;
wire RegWrite;
ControlUnit foo (RegDst,Jump,Branch,MemRead,MemtoReg,ALUOpSignal,MemWrite,ALUSrc,RegWrite,InstrOpCode);

initial begin 


	InstrOpCode =6'b001000;
	#20; 
	InstrOpCode =6'b001001;
	#20;
	InstrOpCode =6'b001100;
	#20;
	InstrOpCode =6'b000100;
	#20; 
	InstrOpCode =6'b100100;
	#20;
	InstrOpCode =6'b100101;
	#20;
	InstrOpCode =6'b001111;
	#20;
	InstrOpCode =6'b100011;
	#20;
	InstrOpCode =6'b001101;
	#20;
	InstrOpCode =6'b000000;
	#20;
	InstrOpCode =6'b001010;
	#20;
	InstrOpCode =6'b001011;
	#20;
	InstrOpCode =6'b101000;
	#20;
	InstrOpCode =6'b101001;
	#20;
	InstrOpCode =6'b101011;
	#20;
end

initial begin 
	$monitor("InstrOpCode : %6b, RegDst : %1b, ALUSrc : %1b ,MemtoReg : %2b  ,Jump : %1b ,RegWrite :%1b,  MemRead : %1b ,MemWrite :%1b , Branch : %1b,ALUOpSignal :%4b  ,", 
				InstrOpCode,RegDst,ALUSrc,MemtoReg,Jump,RegWrite,MemRead,MemWrite,Branch,ALUOpSignal,);
end
endmodule