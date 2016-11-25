module maindec (input	logic [5:0] op,
					 output	logic			memtoreg, memwrite,
					 output	logic			branch, alusrc,
					 output	logic			regdst, regwrite,
					 output	logic			jump,
					 output	logic	[1:0]	aluop,
					 output	logic			bne);
					 
		logic [9:0]	controls;
		
		assign 	regwrite = 	controls [9];
		assign 	regdst	=	controls	[8];
		assign	alusrc	=	controls	[7];
		assign	branch	=	controls	[6];
		assign	memwrite	=	controls	[5];
		assign	memtoreg	=	controls	[4];
		assign	jump		=	controls	[3];
		assign	aluop		=	controls	[2:1];
		assign	bne		=	controls	[0];
		
		always_comb
			case(op)
				6'b000000: controls <= 10'b11_0000_0100;
				6'b100011: controls <= 10'b10_1001_0000;
				6'b101011: controls <= 10'b00_1010_0000;
				6'b000100: controls <= 10'b00_0100_0010; //beq
				6'b001000: controls <= 10'b10_1000_0000;
				6'b000010: controls <= 10'b00_0000_1000;
				6'b001101: controls <= 10'b10_1000_0110; // ori
				6'b000101: controls <= 10'b00_0100_0011;
				default:	  controls <= 10'bXx_xxxx_xxxx;
			endcase
endmodule
		
		