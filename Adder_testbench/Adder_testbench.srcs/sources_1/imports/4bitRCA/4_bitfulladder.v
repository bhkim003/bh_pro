module four_bitfulladder(
    input [3 : 0] A, B,
    input Cin,

    output [3 : 0] S,
    output Cout 
);
    wire [3 : 1] C;

    FullAdder FA0 (.X(A[0]), .Y(B[0]), .Cin(Cin), .Cout(C[1]), .Sum(S[0]));
    FullAdder FA1 (.X(A[1]), .Y(B[1]), .Cin(C[1]), .Cout(C[2]), .Sum(S[1]));
    FullAdder FA2 (.X(A[2]), .Y(B[2]), .Cin(C[2]), .Cout(C[3]), .Sum(S[2]));
    FullAdder FA3 (.X(A[3]), .Y(B[3]), .Cin(C[3]), .Cout(Cout), .Sum(S[3]));
endmodule