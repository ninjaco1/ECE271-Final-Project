//Top Level

module FinalProject (input logic clk, ltch, data,
							output logic led, motor,
							output logic [6:0]seg);
							
	logic [7:0] a,b,s,y;
	logic cin, cout;
	
							
	add_sub #(8) (a,b,cin,s,y,cout);
							
	//log						
							
							

endmodule
				