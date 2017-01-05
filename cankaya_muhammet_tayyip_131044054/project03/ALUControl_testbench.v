module ALUControl_testbench ();

reg[3:0] ALUOpSignal;
reg[5:0] InstFunct;
wire[2:0] ALUControlBit;


ALUControl foo(ALUOpSignal,InstFunct,ALUControlBit);

initial begin 
	ALUOpSignal=4'b0000; InstFunct=6'b000000;
	#20;
	ALUOpSignal=4'b0000; InstFunct=6'b000000;
	#20;
	ALUOpSignal=4'b0001; InstFunct=6'b000000;
	#20;
	ALUOpSignal=4'b0010; InstFunct=6'b100000;
	#20;
	ALUOpSignal=4'b0010; InstFunct=6'b100010;
	#20;
	ALUOpSignal=4'b0010; InstFunct=6'b100100;
	#20;
	ALUOpSignal=4'b0010; InstFunct=6'b100101;
	#20;
	ALUOpSignal=4'b0010; InstFunct=6'b101010;
	#20;	
	ALUOpSignal=4'b0011; InstFunct=6'b101010;
	#20;
	ALUOpSignal=4'b0100; InstFunct=6'b101010;
	#20;
	ALUOpSignal=4'b0101; InstFunct=6'b101010;
	#20;	
end

initial begin 
	$monitor("ALUOpSignal : %4b, InstFunct : %6b, ALUControlBit %3b", ALUOpSignal,InstFunct,ALUControlBit);
end

endmodule