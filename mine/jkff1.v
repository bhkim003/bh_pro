module JKFF (J, K, CLK, Q, QN){
    input J, K, CLK,
    output Q, QN
};

reg Qint;

always @(posedge CLK) begin
    Qint <= ( (J && ~Qint) ||(~K && Qint) )
end

assign Q = Qint;
assign QN = ~Qint;

endmodule
