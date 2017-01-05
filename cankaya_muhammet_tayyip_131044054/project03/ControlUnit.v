module ControlUnit(RegDst,Jump,Branch,MemRead,MemtoReg,ALUOpSignal,MemWrite,ALUSrc,RegWrite,InstrOpCode);


input [5:0] InstrOpCode;
output RegDst;
output Jump;
output Branch;
output MemRead;
output [1:0]MemtoReg; 
output [3:0] ALUOpSignal;
output MemWrite;
output ALUSrc;
output RegWrite;


//Opcode for instruction
parameter addi  =6'b001000;
parameter addiu =6'b001001;
parameter andi  =6'b001100;
parameter beq   =6'b000100;
parameter bne   =6'b000101;
parameter j     =6'b000010;//J-type
parameter jal   =6'b000011;//J-type
parameter lbu   =6'b100100;
parameter lhu   =6'b100101;
parameter lui   =6'b001111;
parameter lw    =6'b100011;
parameter ori   =6'b001101;
parameter Rtype =6'b000000;//R-type
parameter slti  =6'b001010;
parameter sltiu =6'b001011;
parameter sb    =6'b101000;
parameter sh    =6'b101001;
parameter sw    =6'b101011;


//--------------------------------------------------
assign RegDst   =  InstrOpCode ==Rtype ? 1 : 0;
//--------------------------------------------------
assign Jump 	 =	 InstrOpCode ==j      ||
						 InstrOpCode ==jal    ? 1 : 0;
//--------------------------------------------------
assign Branch   =  InstrOpCode ==beq    ||
						 InstrOpCode ==bne    ? 1 : 0;
//--------------------------------------------------
assign MemRead  =  InstrOpCode ==lw     ||
						 InstrOpCode ==lbu    ||
						 InstrOpCode ==lhu    ? 1 : 0;
//--------------------------------------------------		
assign MemtoReg[1] =  InstrOpCode ==jal ? 1 : 0 ;
//--------------------------------------------------					 
assign MemtoReg[0] =  InstrOpCode ==lw  ||
						 InstrOpCode ==lbu    ||
						 InstrOpCode ==lhu    ? 1 : 0;		
//--------------------------------------------------		
assign ALUOpSignal[3] =	 0;	
//--------------------------------------------------			
assign ALUOpSignal[2] =	 InstrOpCode ==andi   ||
						 InstrOpCode ==slti   ||	
						 InstrOpCode ==sltiu  ||						 
						 InstrOpCode ==ori    ? 1 : 0;			
//--------------------------------------------------			 
assign ALUOpSignal[1] =  InstrOpCode ==Rtype  ||
						 InstrOpCode ==slti   ||	
						 InstrOpCode ==sltiu  ||	  
					    InstrOpCode ==addi   || 
						 InstrOpCode ==addiu  ? 1 : 0;	
//--------------------------------------------------						 
assign ALUOpSignal[0] =  InstrOpCode ==beq    || 
						 InstrOpCode ==bne    ||
						 InstrOpCode ==ori    ||	
					    InstrOpCode ==addi   || 
						 InstrOpCode ==addiu  ? 1 : 0;
//--------------------------------------------------
assign MemWrite =  InstrOpCode ==sw     ||
						 InstrOpCode ==sh     ||	
						 InstrOpCode ==sb     ? 1 : 0;	
//--------------------------------------------------						 
assign ALUSrc   =  InstrOpCode ==lw     ||
						 InstrOpCode ==lbu    ||
						 InstrOpCode ==lhu    ||
						 InstrOpCode ==lui    ||
						 InstrOpCode ==sw 	 ||
						 InstrOpCode ==sh 	 ||	
						 InstrOpCode ==sb	 	 ||
						 InstrOpCode ==addi   ||
						 InstrOpCode ==addiu  ||
						 InstrOpCode ==andi   ||
						 InstrOpCode ==ori    ||
						 InstrOpCode ==slti   ||
						 InstrOpCode ==sltiu  ? 1 : 0;
//--------------------------------------------------						 
assign RegWrite =  InstrOpCode ==Rtype  || 
						 InstrOpCode ==lw     ||
						 InstrOpCode ==lbu    ||
						 InstrOpCode ==lhu    ||
						 InstrOpCode ==lui    ||
						 InstrOpCode ==addi   ||
						 InstrOpCode ==addiu  ||
						 InstrOpCode ==andi   ||
						 InstrOpCode ==ori    ||
						 InstrOpCode ==slti   ||
						 InstrOpCode ==sltiu  ? 1 : 0;
//--------------------------------------------------
endmodule