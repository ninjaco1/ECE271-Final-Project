module comparator2(
		input logic [3:0] a,
		output logic eq
		);
		
		assign eq = (a >= 4'b10);
		
endmodule
