module shiftreg #(parameter N = 8)
						(input logic clk, reset1,reset2, enable, sin,
						input logic [N-1:0] d,
						output logic [N-1:0] q1,q2,
						output logic sout);
						
	//logic [15:0]r;	
		logic [7:0] r1,r2;
						
	always_ff @(posedge clk, posedge reset1)//reset1 is the button and reset 2 is the loop
		if (reset1)
			begin
				q1 <= 0;
				q2 <= 0;
				r1 <= 0;
				r2 <= 0;
			end
		else if (reset2)
			begin
				q1 <= 0;
				q2 <= 0;
				r1 <= 0;
				r2 <= 0;
			end
		else if(enable) 
			begin
				q1 <= r1;
				q2 <= r2;
			end
		else 					
			begin
			//r <= r >> 1;
			//r[15]  <= d;
				r2 <= r1;
				r1 <= d;
			end
			
endmodule

