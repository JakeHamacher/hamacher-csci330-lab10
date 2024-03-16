`timescale 1ns / 1ps

module half_adder(
    input A,      
    input B,       
    output S,      
    output Cout    
);

// Sum output
assign S = A ^ B;  

// Carry output
assign Cout = A & B;  

endmodule

module half_adder_tb();

reg A, B;       
wire S, Cout;   

half_adder DUT (
    .A(A),
    .B(B),
    .S(S),
    .Cout(Cout)
);

initial begin
    $monitor("A=%b, B=%b, S=%b, Cout=%b", A, B, S, Cout);
    A = 0; B = 0; #10;   // Test case 1
    A = 0; B = 1; #10;   // Test case 2
    A = 1; B = 0; #10;   // Test case 3
    A = 1; B = 1; #10;   // Test case 4
    $finish;
end

endmodule
