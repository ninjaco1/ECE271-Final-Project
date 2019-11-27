//sevenseg

module sevenseg(input logic [3:0] data, output logic [6:0] segments);
	always_comb 
	case(data)
		0: segments=7'b100_0000;//100_0000
		1: segments=7'b111_1001;//111_1001
		2: segments=7'b010_0100;//010_0100
		3: segments=7'b011_0000;//011_0000
		4: segments=7'b001_1001;//001_1001 
		5: segments=7'b001_0010;//001_0010 
		6: segments=7'b000_0010;//000_0010 
		7: segments=7'b111_1000;//111_1000 
		8: segments=7'b000_0000;//000_0000 
		9: segments=7'b001_1000;//001_1000
		default: segments=7'b111_1111;
	endcase
endmodule