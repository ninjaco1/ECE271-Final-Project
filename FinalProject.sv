//Top Level

module FinalProject (input logic clk, ltch, data, dataYellow, reset_n,
							input logic [10:0] input_keyboard,
							output logic led, motor, 
							output logic [6:0] seg);
							
	logic [4:0] a,b,s,y, num_out;
	logic cin, cout, slct;
	
	
	//NES reader outputs
	logic latchOrange, clockRed, up, down, left, right, start, select, a_but, b_but;
	NesReader(
		.dataYellow				(dataYellow),
		.clock					(clk),
		.reset_n					(reset_n),
		.latchOrange			(latchOrange),
		.clockRed				(clockRed),
		.up						(up),
		.down						(down),
		.left						(left),
		.right					(right),
		.start					(start),
		.select					(select),
		.a							(a_but),
		.b							(b_but)
	
	); 
	//Nes Decoder
	logic select_out;
	NesDecoder(
		.nes_clk					(clockRed),
		.nes_latch				(latchOrange),
		.a							(a_but),
		.b							(b_but),
		.select_button			(select),
		.select					(slct),
		.select_key				(select_out)
	);
	
	//ps/2 decoder 
	logic clk_keyboard, ready_key, red, green, blue;
	keyboard_decoder (
		.input_keyboard		(input_keyboard),
		.clk						(clk_keyboard),
		.ready					(ready_key),
		.select					(select_out),
		.red						(red),
		.green					(green),
		.blue						(blue),
	);
	
	
	// add and subtract values						
	add_sub #(4) (a,b,cin,s,y,cout);
	
	
	// choose if you want to display the sum or difference
	mux2(s,y, slct, num_out);
	
	//comparator #(4) (s,y,)
	
	
	// display the answer of the 7 segment display
	sevenseg(num_out, seg);					
							
							

endmodule
				