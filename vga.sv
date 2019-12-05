// vga 

module vga (input logic clk50,
				input logic [1:0] red0, green0, blue0,
				output logic hsync, vsync,
				output logic [3:0] red, green, blue);

		logic clk25, v_clk;
		logic [9:0] count, count2;
		
		PLL (
			.inclk0 		(clk50),
			.c0			(clk25)
		);
		
		
		witchcraft #(800,10)(
			.clk			(clk25),
			.count		(count),
			.vsync_clk	(v_clk)
		);
		
		witchcraft #(525,10)(
			.clk			(v_clk),
			.count		(count2)
		);
		
		always_comb
				begin
					if(count < 640 && count2 < 480)
						begin
							red[0] = red0[0];
							red[1] = red0[0];
							red[2] = red0[1];
							red[3] = red0[1];
							
							blue[0] = blue0[0]; 
							blue[1] = blue0[0]; 
							blue[2] = blue0[1]; 
							blue[3] = blue0[1]; 
							
							green[0] = green0[0];
							green[1] = green0[0];
							green[2] = green0[1];
							green[3] = green0[1];
						end
					else
						begin
							red = 4'b0000;
							blue = 4'b0000;
							green = 4'b0000;
						end
						
					if(count >= 656 && count < 656+96)
						hsync = 0;
					else
						hsync = 1;
			
					if(count2 >= 490 && count2 < 490 + 2)
						vsync = 0;
					else
						vsync = 1;
				end
endmodule
