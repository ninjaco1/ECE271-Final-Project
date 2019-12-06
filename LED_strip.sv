//led 
module LED_strip (input logic clk, enable,
						output logic [7:0] red, green, blue);
						
	logic clk1;					
	clk_LED(
		.inclk0 			(clk),
		.c0				(clk1)
	);
	
	
	always @ (posedge clk1, posedge enable)
		begin
			red   <= 8'b11111111;
			green <= 8'b11111111;
			blue  <= 8'b11111111;
		end
	
	
						
endmodule
						