//NES decoder

module NesDecoder (input logic a, b, select_button, latchOrange, vcc,
						//input logic [7:0] readButtons,
						output logic mux_select,select_out);
						
	//readButton[7] is the a button
	//readButton[6] is the b button
	
	//always_ff @ (posedge nes_latch, posedge nes_clk)
	always @(latchOrange)
		begin
			if(a) 
				mux_select = 0;// to add
			else if (b)
				mux_select = 1;// to subtract
			else if (select_button)
				select_out = 1;
				
		end
endmodule
		