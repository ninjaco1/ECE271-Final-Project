//Top Level

module FinalProject (input logic clk, ltch, data,
							output logic led, motor,
							output logic [6:0] seg);
							
	logic [4:0] a,b,s,y, num_out;
	logic cin, cout, select;
	
	// add and subtract values						
	add_sub #(4) (a,b,cin,s,y,cout);
	
	
	// choose if you want to display the sum or difference
	mux2(s,y, select, num_out);
	
	//comparator #(4) (s,y,)
	
	
	// display the answer of the 7 segment display
	sevenseg(num_out, seg);
							
	//log						
							
							

endmodule
				