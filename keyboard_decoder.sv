//VGA
module keyboard_decoder(input [7:0] keyboard,
								input logic [1:0] red1, green1, blue1,
								input logic clk,
								output logic hsync,
								output logic vsync, 
								output logic [3:0]q,
								output logic [3:0] red, green, blue);
	
	logic slowclock;
	logic clockout;
	
	logic reset;
	logic [9:0] count;
	logic [9:0] count2;
	//logic [3:0] q;
	logic [6:0] segments;
	
	PLL pll(
		.inclk0 (clk),
		.c0 (slowclock)
	);
	
	//Hsync
	witchcraft #(800, 10) h(
		.clk (slowclock),
		.count (count),
		.vsync_clk (clockout)
	);
	
	//Vsync
	witchcraft #(525, 10) v(
		.clk (clockout),
		.count (count2)
	);
	
	decoder(
		.data (keyboard),
		.q (q)
	);
	
	sevenseg(
		.data (q),
		.segments (segments)
	);
	
	always_comb
	begin
			
		//Seg 1
		if(count > 120 && count < 240 && count2 > 64 && count2 < 128)
		begin
			if(segments[0])
			begin
				red = 4'b1111;
				green = 4'b1111;
				blue = 4'b1111;
			end
			else
			begin
				red = 4'b0000;
				green = 4'b0000;
				blue = 4'b0000;
			end
		end
		
		//Seg 2
		if(count > 240 && count < 304 && count2 > 128 && count2 < 248)
		begin
			if(segments[1])
			begin
				red = 4'b1111;
				green = 4'b1111;
				blue = 4'b1111;
			end
			else
			begin
				red = 4'b0000;
				green = 4'b0000;
				blue = 4'b0000;
			end
		end
		
		//Seg 3
		if(count > 240 && count < 304 && count2 > 260 && count2 < 380)
		begin
			if(segments[2])
			begin
				red = 4'b1111;
				green = 4'b1111;
				blue = 4'b1111;
			end
			else
			begin
				red = 4'b0000;
				green = 4'b0000;
				blue = 4'b0000;
			end
		end
		
		//Seg 4
		if(count > 120 && count < 240 && count2 > 380 && count2 < 444)
		begin
			if(segments[3])
			begin
				red = 4'b1111;
				green = 4'b1111;
				blue = 4'b1111;
			end
			else
			begin
				red = 4'b0000;
				green = 4'b0000;
				blue = 4'b0000;
			end
		end
		
		//Seg 5
		if(count > 56 && count < 120 && count2 > 260 && count2 < 380)
		begin
			if(segments[4])
			begin
				red = 4'b1111;
				green = 4'b1111;
				blue = 4'b1111;
			end
			else
			begin
				red = 4'b0000;
				green = 4'b0000;
				blue = 4'b0000;
			end
		end
		
		//Seg 6
		if(count > 56 && count < 120 && count2 > 128 && count2 < 248)
		begin
			if(segments[5])
			begin
				red = 4'b1111;
				green = 4'b1111;
				blue = 4'b1111;
			end
			else
			begin
				red = 4'b0000;
				green = 4'b0000;
				blue = 4'b0000;
			end
		end
		
		//Seg 7
		if(count > 120 && count < 240 && count2 > 222 && count2 < 286)
		begin
			if(segments[6])
			begin
				red = 4'b1111;
				green = 4'b1111;
				blue = 4'b1111;
			end
			else
			begin
				red = 4'b0000;
				green = 4'b0000;
				blue = 4'b0000;
			end
		end
		
		
		else
		begin
			red = 4'b0000;
			blue = 4'b0000;
			green = 4'b0000;
		end
		
		//Count HSync
		if(count >= 656 && count < 656+96)
			hsync = 0;
		else
			hsync = 1;
		
		//Count VSync 
		if(count2 >= 490 && count2 < 490 + 2)
			vsync = 0;
		else
			vsync = 1;
	end
		
endmodule
