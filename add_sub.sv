// adder and substractor

module add_sub #(parameter N = 8)
					(input logic [N-1:0] a,b,
					input logic cin,
					output logic [N-1:0] s, y,
					output logic cout);


	//adder #(N)(a,b, cin,s, cout);
	//substractor #(N)(a,b,y);

	assign {cout, s} = a+b+cin;
	always @ (*)
		if(a != 0 & b != 0)  y <= a-b;


endmodule
