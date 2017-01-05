module mips_core(clock);

input clock;
wire zero,overflow,carryOut;
wire RegDst,Jump,Branch,MemRead,MemWrite,ALUSrc,RegWrite;//Sinyaller
wire [1:0] MemtoReg;
wire [3:0] ALUOpSignal;
wire [25:0] InstAddress;
wire [2:0] ALUControlBit;
wire [15:0] InstImmediate,LHUInst;
wire [4:0] Rs,Rt,Rd,InstShamt,newRd,Rd_Rt_R31;
wire [5:0] InstrOpCode,InstFunct;	
wire [31:0] instruction,signExtented,shamt32,program_counter;
wire [31:0] content1,content2,ALUresult,LwOrSwRes;
wire [31:0] newcontent2,targetAddress,writeData,Read_Data,Data;
wire [27:0] temp;
wire [7:0] LBUInst;


//Okunan instructionlari parcalarina ayirma islemi.
assign InstrOpCode=instruction[31:26];//R-type I-type J-type icin
assign Rs=instruction[25:21];//R-type I-type icin
assign Rt=instruction[20:16];//R-type I-type icin
assign Rd=instruction[15:11];//R-type icin
assign InstShamt=instruction[10:6];//R-type icin
assign InstFunct=instruction[5:0];	//R-type icin
assign InstAddress=instruction[25:0];//J-type icin
assign InstImmediate=instruction[15:0];//I-type icin
assign signExtented = {{16{InstImmediate[15]}},InstImmediate[15:0]};
assign shamt32 = {{28{InstShamt[4]}},InstShamt[3:0]};


//26 bitlik instAddress e instAddress in most 2 bitini ekleyip 28 bit yapiyorum.Sonra bu 28 bit'e pc most 4 biti ekleyip
//32 bit yapip targetAddress i hesapliyorum.  
assign temp ={InstAddress[25:24],InstAddress};//J-type icin once temp=instAddress + instAddress[27:26].
assign targetAddress={program_counter[31:28],temp};//J-type icin sonra targetAddress=temp+PC[31:28] yapiyorum.

PCUnit functionPC(targetAddress,InstrOpCode,signExtented,Branch,zero,Jump,program_counter,clock);	
mips_instr_mem  functionInstr(instruction, program_counter);



//opcode==>lw-lhu-lbu-sw-sh-sb  ise ALUresult 2 sola shift ediyorum.
assign LwOrSwRes = (InstrOpCode==6'b100011||InstrOpCode==6'b100100||InstrOpCode==6'b100101 ||
						  InstrOpCode==6'b101011||InstrOpCode==6'b101000||InstrOpCode==6'b101001)? ALUresult<<2 :ALUresult; 

mips_data_mem   functionData(Read_Data,LwOrSwRes,content2,MemRead,MemWrite);	
		
assign newRd = RegDst == 0 ? Rt : Rd;//writeRegister icin Rd veya Rt secimi
assign Rd_Rt_R31 = InstrOpCode == 6'b000011	? 5'b11111 :newRd;//jal instructioni icin writeRegister girisi secimi
assign newcontent2 = ALUSrc == 0 ? content2 : signExtented;//I-type oldugu zaman Rt contenti signExtented olmasi secimi	




//MemtoReg sinyaline bakarak writeData girisi secimi
assign Data = MemtoReg == 2'b00 ? ALUresult : //memory ile alakasi yok ise
				  MemtoReg == 2'b01 ? Read_Data : //lw icin
				  MemtoReg == 2'b10 ? program_counter+2 :32'bx;//jal instructioni icin writeData=PC+2
			
			
assign LBUInst =Read_Data[7:0];
assign LHUInst =Read_Data[15:0];				  
assign writeData=	InstrOpCode == 6'b100100	? {24'b0,LBUInst} ://lbu ise read_Data[7:0] in basina 24 tane 0
						InstrOpCode == 6'b100101	? {16'b0,LHUInst} ://lhu ise read_Data[15:0] in basina 16 tane 0					
						InstrOpCode == 6'b001111   ? {InstImmediate,16'b0}://lui ise immediate sonuna 16 tane 0
						Data;

						
mips_registers  functionReg(content1,content2,writeData,Rs,Rt,Rd_Rt_R31,RegWrite, clock);
ControlUnit  functionCU(RegDst,Jump,Branch,MemRead,MemtoReg,ALUOpSignal,MemWrite,ALUSrc,RegWrite,InstrOpCode);	
ALUControl  functionALUCtr(ALUOpSignal,InstFunct,ALUControlBit);
ALU  functionALU(ALUresult,zero,overflow,carryOut,content1,newcontent2,ALUControlBit);
	

initial begin 
	$monitor("PC:%3d,signExtented:%5d,Rs:%3d,Rt:%3d,Rd:%3d,content1:%3d,content2:%3d,read_Data:%3d,writeData:%3d,ALUresult:%3d",
				 program_counter,signExtented,Rs,Rt,newRd,content1,content2,Read_Data,writeData,ALUresult);
end
	
endmodule