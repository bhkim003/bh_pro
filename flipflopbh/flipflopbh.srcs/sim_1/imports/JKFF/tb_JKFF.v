module tb_JKFF ();
    reg SN, RN, J, K, CLK;

    wire Q, QN;

    initial begin
        CLK = 1'b0;
        SN  = 1'b1;
        RN  = 1'b1;
        J   = 1'b0;
        K   = 1'b0;

        @(negedge CLK) // waiting CLK using sensitivity - List
        #1  SN = 1'b0; // output will be Q = 1, QN = 0
        
        @(negedge CLK)
        @(negedge CLK)
        #1 RN = 1'b0; // output will be Q = 0, QN = 1 (RN is higher)

        #14 SN = 1'b1; RN = 1'b1; J = 1'b0; K = 1'b0; // not Using sensitivity-list
        #10 J = 1'b0; K = 1'b1;
        #10 J = 1'b1; K = 1'b0;
        #10 J = 1'b1; K = 1'b1;
    end

    always begin
        #10 CLK <= ~CLK; // CLK generation. period will be 10
    end

    JKFF JKFF_inst0 (
        .SN(SN), .RN(RN), .J(J), .K(K), .CLK(CLK),

        .Q(Q), .QN(QN)
    );
endmodule