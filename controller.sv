module controller (input	logic [5:0]	op,funct,
						 input	logic			zero,
						 output	logic			memtoreg, memwrite,
						 output	logic			pcsrc,alusrc,
						 output	logic			regdst, regwrite,
						 output	logic			jump,
						 output	logic	[2:0]	alucontrol);
						 
		logic [1:0]	aluop;
		logic			branch;
		logic			bne;
		logic			pcsrcAND;
		
		maindec md (op, memtoreg, memwrite, branch, 
						alusrc, regdst, regwrite, jump, aluop, bne);
						
		aludeco	ad (funct, aluop, alucontrol);
		
		assign pcsrcAND = branch & zero;
		
		mux2	#(1)		srcbmux(pcsrcAND, ~pcsrcAND, bne, pcsrc);
		
		
endmodule
