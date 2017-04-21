module controller(	input logic [5:0] op, funct,
			input logic zero,
			output logic memtoreg, memwrite,
			output logic pcsrc, alusrc,
			output logic regdst, regwrite, 
			output logic jump, ori,
			output logic [2:0] alucontrol);

	logic [1:0] aluop;
	logic branch, bne;
	maindec md(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, bne, ori, aluop);
	aludec ad(funct, aluop, alucontrol);
	assign pcsrc = (branch & zero) | (bne & ~zero);
endmodule
