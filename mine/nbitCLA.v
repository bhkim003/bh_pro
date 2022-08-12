module nbitCLA
# (
    parameter DATA_WIDTH = 32 // 4의 배수
)
(
    input [DATA_WIDTH - 1 : 0] A, B,
    input Ci,

    output [DATA_WIDTH - 1 : 0] S, 
    output Co
   
)
    interger DATA_Q;
    DATA_Q = DATA_WIDTH / 4;
    wire [DATA_Q : 0] C;
    assign C[0] = Ci;

    genvar i
    generate
        for(i = 0; i < DATA_Q; i = i + 1) begin 
            4bitCLA 4bitCLA_1 (.A(A), .B(B), Cin(C[i]), .Cout(C[i+1]), .S(S[i*4+3 : i*4]));
        end
    endgenerate
    assign Co = C[DATA_Q];
endmodule

