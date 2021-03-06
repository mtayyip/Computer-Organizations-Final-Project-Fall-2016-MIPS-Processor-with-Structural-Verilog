module mips_instr_mem(instruction, program_counter);
input [31:0] program_counter;
output [31:0] instruction;

reg [31:0] instr_mem [0:255];

initial begin
	$readmemb("C:/Users/Muhammet/Desktop/cankaya_muhammet_tayyip_131044054/project03/instruction.mem", instr_mem);
end

assign instruction = instr_mem[program_counter];

endmodule