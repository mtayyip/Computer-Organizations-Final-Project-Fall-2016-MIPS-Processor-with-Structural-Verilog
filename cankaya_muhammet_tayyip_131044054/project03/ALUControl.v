module ALUControl(ALUOpSignal,InstFunct,ALUControlBit);
//ALUControl sinyali 3 bit==>8 tane temel islem icin en az 3 bit gereklidir.
//ALUOpSignal 4 bit==>Farkli instructionlari daha rahat kullanabilmek icin 4 bit secilmistir.Ancak suanki instructionlar icin
//3 bit te yeterli olacaktir. 
input[3:0] ALUOpSignal;
input[5:0] InstFunct;
output[2:0] ALUControlBit;


//ALUOpSignal'e bakarak ALUControlBit'e karar veriyorum.Eger AluOpSignal==0010 ise yani Rtype ise InstFunct a bakiyorum.
assign ALUControlBit = (ALUOpSignal == 4'b0000)  ? 3'b010 ://Lw-Sw
							  (ALUOpSignal == 4'b0001)  ? 3'b110 ://Beq-Bne
							  (ALUOpSignal == 4'b0010 && InstFunct==6'b100100) ? 3'b000 ://Rtype--and
							  (ALUOpSignal == 4'b0010 && InstFunct==6'b100101) ? 3'b001 ://Rtype--or
							  (ALUOpSignal == 4'b0010 && InstFunct==6'b100000) ? 3'b010 ://Rtype--add
							  (ALUOpSignal == 4'b0010 && InstFunct==6'b100001) ? 3'b010 ://Rtype--addu
							  (ALUOpSignal == 4'b0010 && InstFunct==6'b100111) ? 3'b011 ://Rtype--nor		
							  (ALUOpSignal == 4'b0010 && InstFunct==6'b000000) ? 3'b100 ://Rtype--sll==>Shift_left_logical
							  (ALUOpSignal == 4'b0010 && InstFunct==6'b000010) ? 3'b101 ://Rtype--srl==>Shift_right_logical						  
							  (ALUOpSignal == 4'b0010 && InstFunct==6'b100010) ? 3'b110 ://Rtype--sub
							  (ALUOpSignal == 4'b0010 && InstFunct==6'b100011) ? 3'b110 ://Rtype--subu
							  (ALUOpSignal == 4'b0010 && InstFunct==6'b101010) ? 3'b111 ://Rtype--slt==>Set_on_less_than
							  (ALUOpSignal == 4'b0010 && InstFunct==6'b101011) ? 3'b111 ://Rtype--sltu=>Set_on_less_than_unsigned
							  (ALUOpSignal == 4'b0011)  ? 3'b010 ://Addi
							  (ALUOpSignal == 4'b0100)  ? 3'b000 ://Andi
							  (ALUOpSignal == 4'b0101)  ? 3'b001 ://Ori
							  (ALUOpSignal == 4'b0110)  ? 3'b111 :32'bx;//Slti-Sltiu							  
endmodule