module keyboard_decoder(input logic [10:0] input_keyboard,
								input logic clk,
								input logic ready,
								input logic select,
								output logic [3:0] red, green, blue);
	
	logic slowclock;
	logic [3:0] count;
	
	PLL pll(
		.inclk0 (clk),
		.c0 (slowclock)
	)
	
	witchcraft counter#(11, 4)(
		.clk (slowclock),
		.count (count)
	)
	
	always_comb
	begin
		if(ready == 1)
		begin
			if(count == 1)
				//start = 0
			else if(count <= 8)
				//data
			else if(count = 9)
				//parity
			else
				//start = 1
		end
	end
		

		
endmodule
