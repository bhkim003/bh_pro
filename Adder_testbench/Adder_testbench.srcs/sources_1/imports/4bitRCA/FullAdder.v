module FullAdder(
    input X, Y, Cin,

    output Cout, Sum
);
    assign Sum = X ^ Y ^ Cin;
    assign Cout = (X && Y) || (X && Cin) || (Y && Cin);
endmodule
