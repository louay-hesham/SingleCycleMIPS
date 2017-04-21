module signext(	input logic [15:0] a,
		input logic ori,
		output logic [31:0] y);
	assign y={{16{a[15] & ~ori}}, a};
endmodule

