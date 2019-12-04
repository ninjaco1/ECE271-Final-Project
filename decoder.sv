module decoder(input logic [7:0] data,
					output logic [3:0] q);
		
		always_comb
		begin
			case(data)
				8'b00110000: q = 4'd0; //0000
				8'b00110001: q = 4'd1; //0001
				8'b00110010: q = 4'd2;
				8'b00110011: q = 4'd3;
				8'b00110100: q = 4'd4;
				8'b00110101: q = 4'd5;
				8'b00110110: q = 4'd6;
				8'b00110111: q = 4'd7;
				8'b00111000: q = 4'd8;
				8'b00111001: q = 4'd9;
			endcase
		end
endmodule
