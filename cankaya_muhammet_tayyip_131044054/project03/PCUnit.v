module PCUnit(targetAddress,InstrOpCode,SignExtend,Branch,zero,Jump,output1,clock);

output reg[31:0] output1;
input clock,zero,Branch,Jump;
input [31:0] SignExtend,targetAddress;
input [5:0] InstrOpCode;

initial output1=32'b00000000000000000000000000000000;

wire Signal;


assign Signal=Branch & zero;	
	
always @ (posedge clock)
	begin 
		output1 = (InstrOpCode ==6'b000010 &&   Jump==1) ? targetAddress ://j instuction ise
					 (InstrOpCode ==6'b000011 &&   Jump==1) ? targetAddress ://jal instuction ise
					 (InstrOpCode ==6'b000100 && Signal==1) ? output1+1+SignExtend ://beq instuction ise
					 (InstrOpCode ==6'b000101 && Branch==1 && zero==0) ? output1+1+SignExtend :output1+1;//bne instuction ise
	end



endmodule