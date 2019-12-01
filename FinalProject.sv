//Top Level

module FinalProject (input logic clk, ltch, data,
							output logic led, motor,
							output logic [6:0] seg);
							
	logic [3:0] a,b,s,y, num_out;
	logic cin, cout, select;
	
	
//	adder #(8)(a,b, cin,s, cout);
//	substractor #(8)(a,b,y);
							
	add_sub #(3) (a,b,cin,s,y,cout);
	
	mux2(s,y, select, num_out);
	
	sevenseg(num_out, seg);
							
	//log						
							
							

endmodule
				