module JKFF (
    input SN, RN, J, K, CLK,

    output Q, QN
);

    reg Q_temp;

    always@ (negedge CLK or RN or SN) begin
        if(~RN) begin // asynchronous, RN is higher than SN
            Q_temp <= 1'b0;
        end else if (~SN) begin // asynchronous
            Q_temp <= 1'b1;
        end else begin
            Q_temp <= (J && ~Q_temp) || (~K && Q_temp);
        end
    end

    assign Q = Q_temp;
    assign QN = ~Q_temp;
endmodule