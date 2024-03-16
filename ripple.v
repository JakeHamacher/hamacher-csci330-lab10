module ripple_carry_adder(
    input [31:0] A,   // Input A (32-bit)
    input [31:0] B,   // Input B (32-bit)
    output [31:0] S   // Sum (32-bit)
);

wire [31:0] carry;   // Carry signal

// Calculate each bit of the sum
assign S = A ^ B ^ {1'b0,carry};

// Calculate carry for each bit
assign carry = (A & B) | (B & {1'b0,carry}) | (A & {1'b0,carry});

endmodule

`timescale 1ns / 1ps

module ripple_carry_adder_tb();

reg [31:0] A, B;   // Input signals
wire [31:0] S;     // Output signals

ripple_carry_adder DUT (
    .A(A),
    .B(B),
    .S(S)
);

initial begin
    $monitor("A=%b, B=%b, S=%b", A, B, S);
    A = 32'h00000000; B = 32'h00000000; #10;   // Test case 1
    A = 32'h00000001; B = 32'h00000001; #10;   // Test case 2
    A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; #10;   // Test case 3
    A = 32'h80000000; B = 32'h80000000; #10;   // Test case 4
    A = 32'hAAAAAAAA; B = 32'h55555555; #10;   // Test case 5
    $finish;
end

endmodule
