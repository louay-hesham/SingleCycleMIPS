module controller(	input logic [5:0] op, funct,
			input logic zero,
			output logic memtoreg, memwrite,
			output logic pcsrc, alusrc,
			output logic regdst, regwrite, 
			output logic jump, bne,
			output logic [2:0] alucontrol);

	logic [1:0] aluop;
	logic branch;
	maindec md(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, bne, aluop);
	aludec ad(funct, aluop, alucontrol);
	assign pcsrc = (branch & zero) | (bne & ~zero);
endmodule
