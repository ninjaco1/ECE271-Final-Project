// adder and substractor 

module add_sub #(parameter = 8) 
					(input logic [N-1:0] a,b,
					input logic cin, 
					output logic [N-1:0] s, y,
					output logic cout); 
					
assign {cout, s} = a+b+cin; 
assign y = a-b;