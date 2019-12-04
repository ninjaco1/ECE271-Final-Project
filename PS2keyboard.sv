	module PS2keyboard(
		input logic resetbut,
		input logic PS2data,
		input logic PS2clock,
		output logic [7:0] code
		);
		
		logic [3:0] c_idlecounter2;
		
		logic [7:0] r;
		
		shiftregister11 shiftregister11(
			.clk			(PS2clock),
			.d				(PS2data),
			.reset1		(resetbut),
			.reset2		(c_comparator11),
			.q				(r)
		);
		
		idlecounter2 idlecounter2(
			.clk			(PS2clock),
			.reset1		(resetbut),
			.reset2		(c_comparator11),
			.q				(c_idlecounter2)
		);
		
		comparator11 comparator11(
			.a				(c_idlecounter2),
			.eq			(c_comparator11)
		);
		
		shiftregistertotal shiftregistertotal(
			.d				(r),
			.enable		(c_comparator11),
			.clk				(PS2clock),
			.q				(code)
		);
		
	endmodule
	
	module shiftregister11(
		input logic clk,
		input logic d,
		input logic reset1,
		input logic reset2,
		output logic [7:0] q
	);
	
		logic [10:0] r;
		
		always_ff @ (posedge clk,posedge reset1)
			begin
				if(reset1)
					begin
						r <= 0;
						q <= 0;
					end
				else if(reset2)
					begin
						q <= 0;
						r <= 0;
					end
				else
					begin
						r <= r >> 1;
						r[10] <= d;
						q <= r[8:1];
					end
			end
			
	endmodule

	module shiftregistertotal(
		input logic [7:0] d,
		input logic enable,
		input logic clk,
		output logic [7:0] q
		);
		
		
		always_ff @ (negedge clk)
			begin
				if(enable)
					begin
						q <= d;
					end
				else
					q <= 8'b00000000;
			end
			
	endmodule
	
	module idlecounter2(
		input logic reset1,
		input logic reset2,
		input logic clk,
		output logic [3:0] q
		);
		
		always_ff @ (posedge clk, posedge reset1)
			begin
				if(reset1) 	q <= 4'b0000;
				else if(reset2) q <= 4'b0000;
				else 			q <= q + 1;
			end

	endmodule

	module comparator11(
		input logic [3:0] a,
		output logic eq
		);
		
		assign eq = (a >= 4'b1011);
		
	endmodule
	