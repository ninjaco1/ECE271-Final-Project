module speaker (input logic clk, button,
					input [9:0] analog_signal,
					output logic note);
					
	logic A4, C3,select;
	logic [17:0]q,q1;				
	
	counter440 counter440(
		.reset1 			(button),
		.reset2			(A4),
		.clk				(clk),
		.q					(q)
	);
	
	comparator440 comparator440(
		.a					(q),	
		.eq				(A4)
	
	);
	
	counter261 counter261(
		.reset1 			(button),
		.reset2			(C3),
		.clk				(clk),
		.q					(q1)
	);
	
	comparator261 comparator261(
		.a					(q1),	
		.eq				(C3)
	
	);
	
	
//	clk_sound sound(
//		.inclk0				(clk),//clk from FPGA
//		.c0					(A4), //A4 
//		.c1					(C3)//middle C
//	);				
	//if select is 1 then it makes A4(0-511)
	//if select is 0 then it makes C3 (512-1023)
	always_comb
		begin
			if(analog_signal >=0 && analog_signal <=9'b11111111)
				select <=1;
			else
				select <=0;
		end
	//assign select = (analog_signal >=0 && analog_signal <=9'b11111111);

	assign note = select ? A4 : C3;
		
					
					
endmodule

module counter440(
		input logic reset1,//button
		input logic reset2,//comparator
		input logic clk,
		output logic [17:0] q
		);
		
		always_ff @ (posedge clk, posedge reset1)
			begin
				if(reset1) 	q <= 16'b0000;
				else if(reset2) q <= 16'b0000;
				else 			q <= q + 1;
			end

endmodule

module comparator440(
		input logic [17:0] a,
		output logic eq
		);
		
		assign eq = (a >= 18'b11011101111100100);
		
endmodule

module counter261(
		input logic reset1,//button
		input logic reset2,//comparator
		input logic clk,
		output logic [17:0] q
		);
		
		always_ff @ (posedge clk, posedge reset1)
			begin
				if(reset1) 	q <= 17'b0000;
				else if(reset2) q <= 17'b0000;
				else 			q <= q + 1;
			end

endmodule

module comparator261(
		input logic [17:0] a,
		output logic eq
		);
		
		assign eq = (a >= 18'b101110110001010011);
		
endmodule
	