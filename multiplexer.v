// Multiplexer circuit
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    wire nA0, nA1, nA0andnA1, nA0andA1, A0andnA1, A0andA1;
    wire in0nA0A1, in1nA0A1, in2A0nA1, in3A0A1;
    wire in0in1or, in2in3or;
    
    `NOT nA0gate(nA0,address0);
    `NOT nA1gate(nA1,address1);

    `AND nA0nA1gate(nA0andnA1, nA0, nA1);
    `AND A0nA1gate(A0andnA1, address0,nA1);
    `AND nA0A1gate(nA0andA1, nA0, address1);
    `AND A0A1gate(A0andA1,address0,address1);

    `AND in0nA0nA1gate(in0nA0nA1,nA0andnA1,in0);
    `AND in1A0nA1gate(in1nA0A1,A0andnA1,in1);
    `AND in2nA0A1gate(in2A0nA1,nA0andA1,in2);
    `AND in3A0A1gate(in3A0A1,A0andA1,in3);

    `OR in0in1orgate(in0in1or,in0nA0nA1,in1nA0A1);
    `OR in2in3orgate(in2in3or,in2A0nA1,in3A0A1);
    `OR outputgate(out,in0in1or,in2in3or);


endmodule

