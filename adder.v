// Adder circuit
`define AND and #50
`define OR or #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire xorab, andabc, andab;

    `XOR AxorBgate(xorab,a,b);
    `XOR sumXORgate(sum,xorab,carryin);
    `AND AandBgate(andab,a,b);
    `AND ABandCgate(andabc,xorab,carryin);
    `OR carryoutORgate(carryout,andabc,andab);
    

endmodule
