module mips_registers
(
	output[31:0] read_data_1, read_data_2,
	input [31:0] write_data,
	input [4:0] read_reg_1, read_reg_2, write_reg,
	input signal_reg_write, clk
);
	reg [31:0] registers [0:31];
	
	assign read_data_1 = registers[read_reg_1];
	assign read_data_2 = registers[read_reg_2];
			
	initial begin
		$readmemb("C:/Users/Muhammet/Desktop/cankaya_muhammet_tayyip_131044054/project03/registers.mem", registers);
	end

	always @ (posedge clk)
	begin
		if (signal_reg_write) begin
			registers[write_reg] <= write_data;
		end
	end
endmodule