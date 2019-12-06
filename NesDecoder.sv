//NES decoder

module NesDecoder (input logic nes_clk, nes_latch, a, b, select_button,
						//input logic [7:0] readButtons,
						output logic select, select_key);
						
	//readButton[7] is the a button
	//readButton[6] is the b button
	
	always @ (nes_latch)
		begin
			if(select_button)
				select_key <=1;
			if(a) 
				select <= 0;// to add
			else if (b)
				select <= 1;// to subtract
		end
endmodule
		