module RCA_gen (
    input [3 : 0] A, B,
    input Ci,
    
    output [3 : 0] S,
    output Co
);
    wire [4:0] C;
    assign C[0] = Ci;

    genvar i
    generate
        for(i = 0; i < 4; i = i + 1) begin 
            FullAdder FA (.X(A[i]), .Y(B[i]), Cin(C[i]), .Cout(c[i+1]), .Sum(s[i]));
        end
    endgenerate
    assign Co = C[4];

//    FullAdder FA0

endmodule
