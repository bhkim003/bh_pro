module RCA_parame
# (
    parameter DATA_WIDTH = 32   
)
(
    input [DATA_WIDTH - 1 : 0] A, B,
    input Ci,

    output [DATA_WIDTH - 1 : 0] S, 
    output Co
)

    wire [DATA_WIDTH : 0] C;
    assign C[0] = Ci;

    genvar i
    generate
        for(i = 0; i < DATA_WIDTH; i = i + 1) begin 
            FullAdder FA (.X(A[i]), .Y(B[i]), Cin(C[i]), .Cout(c[i+1]), .Sum(s[i]));
        end
    endgenerate

    assign Co = C[DATA_WIDTH];
endmodule
