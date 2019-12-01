//comparator

module comparator #(parameter N = 4)
							(input logic [N-1:0] a,b,
							output logic valid, reset);
	always_comb
		if((a <= 4'b1001 & a >= 4'b0000) & (b <= 4'b1001 & b >= 4'b0000))				
			assign valid = 1; //(a <= 4'b1001 & a >= 0) & (b <= 4'b1001 & a >= b)
		else 
			assign reset = 0;
			
endmodule
		