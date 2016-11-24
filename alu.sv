module alu (input		logic	[31:0] a, 
				input		logic	[31:0] b,
				input		logic	[2:0]	 op,
				output	logic			 zero,
				output	logic	[31:0] y);
				
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
