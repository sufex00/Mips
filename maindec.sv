module maindec (input	logic [5:0] op,
					 output	logic			memtoreg, memwrite,
					 output	logic			branch, alusrc,
					 output	logic			regdst, regwrite,
					 output	logic			jump,
					 output	logic	[1:0]	aluop);
					 
		logic [8:0]	controls;
		
		assign 	regwrite = 	controls [8];
		assign 	regdst	=	controls	[7];
		assign	alusrc	=	controls	[6];
		assign	branch	=	controls	[5];
		assign	memwrite	=	controls	[4];
		assign	memtoreg	=	controls	[3];
		assign	jump		=	controls	[2];
		assign	aluop		=	controls	[1:0];
		
		always_comb
			case(op)
				6'b000000: controls <= 9'b1_1000_0010;
				6'b100011: controls <= 9'b1_0100_1000;
				6'b101011: controls <= 9'b0_0101_0000;
				6'b000100: controls <= 9'b0_0010_0001;
				6'b001000: controls <= 9'b1_0100_0000;
				6'b000010: controls <= 9'b0_0000_0100;
				default:	  controls <= 9'bx_xxxx_xxxx;
			endcase
endmodule
		
		