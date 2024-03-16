module half_adder(
    input A, 
    input B, 
    output S, 
    output Cout
);

assign S = A ^ B;
assign Cout = A & B;

endmodule

module full_adder(
    input A, 
    input B, 
    input Cin, 
    output S, 
    output Cout
);

assign S = A ^ B ^ Cin;
assign Cout = (A & B) | (Cin & (A ^ B));

endmodule

module full_adder_tb;

reg A, B, Cin;
wire S, Cout;

full_adder FA (
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
);

initial begin
    $monitor("A=%b, B=%b, Cin=%b, S=%b, Cout=%b", A, B, Cin, S, Cout);
    // Test all input combinations
    #5 A = 0; B = 0; Cin = 0;
    #5 A = 0; B = 0; Cin = 1;
    #5 A = 0; B = 1; Cin = 0;
    #5 A = 0; B = 1; Cin = 1;
    #5 A = 1; B = 0; Cin = 0;
    #5 A = 1; B = 0; Cin = 1;
    #5 A = 1; B = 1; Cin = 0;
    #5 A = 1; B = 1; Cin = 1;
    #5 $finish;
end

endmodule
