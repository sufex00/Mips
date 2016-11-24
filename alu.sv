module alu (input		logic signed[31:0] a, 
				input		logic	signed[31:0] b,
				input		logic	signed[2:0]	 op,
				output	logic	signed		 zero,
				output	logic	signed[31:0] y);
				
	assign zero = y ? 0 : 1;
	
	always_latch
	begin
		case (op)
			3'b000:	y <= a & b;
			3'b001:	y <= a | b;
			3'b010:	y <= a + b;
			3'b100:	y <= a & ~b;
			3'b101:	y <= a | ~b;
			3'b110:	y <= a - b;
			3'b111:	y <= (a < b) ? 1 : 0;
		endcase
	end
endmodule
