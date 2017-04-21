module maindec(	input logic [5:0] op,
		output logic memtoreg, memwrite,
		output logic branch, alusrc,
		output logic regdst, regwrite,
		output logic jump, bne, signOrZero,
		output logic [1:0] aluop);
	logic [10:0] controls;
	assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, bne, signOrZero, aluop} = controls;
	always_comb
		case(op)
			6'b000000: controls <= 11'b11000000010; // RTYPE
			6'b100011: controls <= 11'b10100100000; // LW
			6'b101011: controls <= 11'b00101000000; // SW
			6'b000100: controls <= 11'b00010000001; // BEQ
			6'b001000: controls <= 11'b10100000000; // ADDI
			6'b000010: controls <= 11'b00000010000; // J
			6'b001101: controls <= 11'b10100000111; // ORI
			6'b000101: controls <= 11'b00000001001; // BNE
			default:   controls <= 11'bxxxxxxxxxxx; // illegal op
		endcase
endmodule
