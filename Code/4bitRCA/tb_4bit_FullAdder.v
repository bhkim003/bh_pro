`timescale 1ns/1ps

module tb_4bitfulladder ();
    reg [3 : 0] A, B;
    reg Cin;

    wire [3 : 0] S;
    wire Cout;

    initial begin
        A = 4'b0000;
        B = 4'b0000;
        Cin = 1'b0; // initialize

        #50 A = 4'b0001; B = 4'b0010; // output will be 4'b0011
        #50 A = 4'b0101; B = 4'b0011; // output will be 4'b1000    
    end

    
    // integer i, j;
    // initial begin

    //     for(i = 0; i < 15; i = i + 1) begin
    //         for(j = 0; j < 15; j = j + 1) begin
    //             #50 A = i; B = j;
    //         end
    //     end
    // end
   

    // DUT instantiation
    four_bitfulladder four_bitfulladder_inst0 (
        .A(A), .B(B),
        .Cin(Cin),

        .S(S),
        .Cout(Cout) 
    );

endmodule



