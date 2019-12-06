//Top Level

module FinalProject (input logic clk, dataYellow, reset_n, button, clk_key,
							input logic input_keyboard,
							input logic [9:0] analog,
							output logic motor,note, 
							output logic [7:0] ledred, ledgreen, ledblue,
							output logic [6:0] seg,
							output logic [3:0] red, green, blue,
							output logic vsync, hsync);
							
	logic [4:0] a,b,s,y, num_out;
	logic cin, cout, slct;
	
	
	//NES reader outputs
	logic latchOrange, clockRed, up, down, left, right, start, select, a_but, b_but;
	NesReader NesReader(
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
	NesDecoder NesDecoder(
		.nes_clk					(clockRed),
		.nes_latch				(latchOrange),
		.a							(a_but),
		.b							(b_but),
		.select_button			(select),
		.select					(slct),
		.select_key				(select_out)
	);
	//PS2keyboard
	logic code;
	PS2keyboard PS2keyboard(
		.resetbut				(button),
		.PS2data					(input_keyboard),
		.PS2clock				(clk_key),
		.code						(code)
	);
	
	
	logic [3:0]a_b_data;
	//ps/2 decoder 
	keyboard_decoder keyboard_decoder(
		.keyboard				(code),
		.clk						(clk_key),
		.hsync					(hsync),
		.vsync					(vsync),
		.red						(red),
		.green					(green),
		.blue						(blue),
		.q							(a_b_data)
	);
	
	
	
	//add shift register then counter to store a and b
	logic [3:0] c_idlecounter2;
	logic c_comparator2;
	idlecounter2 idlecounter2(
		.clk			(clk),
		.reset1		(button),
		.reset2		(c_comparator2),
		.q				(c_idlecounter2)
	
	);
	
	comparator2 comparator2(
		.a				(c_idlecounter2),
		.eq			(c_comparator2)
	);
	

	shiftreg	#(4) numbers	(
		.clk 			(clk),
		.reset1		(button),
		.reset2 		(c_comparator2),
		.d				(a_b_data),
		.q1			(b),
		.q2			(a)
	
	);
	
	// add and subtract values						
	add_sub #(4) add_sub(a,b,0,s,y,cout);

	
	// choose if you want to display the sum or difference
	mux2 mux2(s,y, slct, num_out);
	
	
	
	// display the answer of the 7 segment display
	sevenseg sevenseg(num_out, seg);		

	
	//speaker
	//logic analog_signal;
	speaker speaker(
		.clk					(clk),
		.analog_signal		(analog),
		.note					(note)
	);	
	
	//LED_strip pulsing at 1Hz	
	LED_strip LED_strip(
		.clk					(clk),
		.enable				(select_out),
		.red					(ledred),
		.green				(ledgreen),
		.blue					(ledblue)
	);
	
	assign motor = select;

endmodule
				