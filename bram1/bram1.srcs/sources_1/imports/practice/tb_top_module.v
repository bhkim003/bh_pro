`timescale 1ns/1ps
`define DELTA 2

module tb_top_module;

    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 8;
    parameter MEM_DEPTH = 512;

    reg                         clk;
    reg     [ADDR_WIDTH-1:0]    addr0_b0;
    reg                         ce0_b0;
    reg                         we0_b0;
    reg     [DATA_WIDTH-1:0]    d0_b0;
    reg                         reg_en;

    wire    [DATA_WIDTH-1:0]    reg_out;

    always #5 clk   = ~clk;

    initial begin
        clk         = 0;
        addr0_b0    = {(ADDR_WIDTH){1'b0}};
        ce0_b0      = 0;
        we0_b0      = 0;
        d0_b0       = {(DATA_WIDTH){1'b0}};
        reg_en      = 0;
    end

    initial begin
        @(posedge clk); //간격

        @(posedge clk); 
        #(`DELTA)       //전달지연
        addr0_b0    = 'd1;
        ce0_b0      = 1'b1;
        we0_b0      = 1'b1;
        d0_b0       = 16'b0000000000000001;
        reg_en      = 1'b0;

        @(posedge clk);
        ce0_b0      = 1'b0; // 칩이네이블은 잠깐동안만 활성화 했던 것

        @(posedge clk);
        #(`DELTA)      //전달지연
        addr0_b0    = 'd1;
        ce0_b0      = 1'b1;
        we0_b0      = 1'b0;
        d0_b0       = 16'b0000000000000001;
        reg_en      = 1'b1;


    end
    
    top_module
    #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .MEM_DEPTH(MEM_DEPTH)
    ) top0_inst (
        .clk(clk),
        .addr0_b0(addr0_b0),
        .ce0_b0(ce0_b0),
        .we0_b0(we0_b0),
        .d0_b0(d0_b0),
        .reg_en(reg_en),
        .reg_out(reg_out)
    );
endmodule