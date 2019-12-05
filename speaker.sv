module speaker (input logic clk,
					input [9:0] analog_signal,
					output logic note);
					
	logic A4, C3,select;				
	
	clk_sound sound(
		.inclk0				(clk),//clk from FPGA
		.c0					(A4), //A4 
		.c1					(C3)//middle C
	);				
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
