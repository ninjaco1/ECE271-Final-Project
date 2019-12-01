//Top Level

module FinalProject (input logic clk, ltch, data, dataYellow, reset_n,
							output logic led, motor, 
							output logic [6:0] seg);
							
	logic [4:0] a,b,s,y, num_out;
	logic cin, cout, slct;
	
	
	//NES reader outputs
	logic latch_Orange, clock_Red, up, down, left, right, select, a_but, b_but;
	
	NesReader(dataYellow, clk, reset_n, latch_Orange, clock_Red, up, down, left, right, select, a_but, b_but);
	
	// add and subtract values						
	add_sub #(4) (a,b,cin,s,y,cout);
	
	
	// choose if you want to display the sum or difference
	mux2(s,y, slct, num_out);
	
	//comparator #(4) (s,y,)
	
	
	// display the answer of the 7 segment display
	sevenseg(num_out, seg);
							
	//log						
							
							

endmodule
				