// Decoder circuit
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralDecoder (
	output out0, out1, out2, out3,
	input  address0, address1,
	input  enable
);
	// Uses concatenation and shift operators
	assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);

	wire nA0, nA1, nA0andnA1, A0andnA1, nA0andA1, A0andA1; 

	`NOT nA0gate(nA0,address0);
	`NOT nA1gate(nA1,address1);

	`AND nA0nA1gate(nA0andnA1, nA0, nA1);
	`AND A0nA1gate(A0andnA1, address0,nA1);
	`AND nA0A1gate(nA0andA1, nA0, address1);
	`AND A0A1gate(A0andA1,address0,address1);

	`AND ennA0nA1gate(out0,nA0andnA1,enable);
	`AND enA0nA1gate(out1,A0andnA1,enable);
	`AND ennA0A1gate(out2,nA0andA1,enable);
	`AND enA0A1gate(out3,A0andA1,enable);

endmodule


