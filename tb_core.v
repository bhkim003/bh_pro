`timescale 1ns/1ps
`define DELTA 2



module tb_core;
    parameter IN_DATA_WIDTH = 8; // 들어오는 건 한 칸 8비트
    parameter DWIDTH = 16; // 나가는 건 한 칸에  16비트

    reg clk, reset_n;

    reg [IN_DATA_WIDTH - 1 : 0] number_i;

    reg valid_i;
    reg run_i;

    wire valid_o;
    wire [DWIDTH - 1 : 0] result_o;

    integer i;

    always #5 clk   = ~clk;

    initial begin
        clk         = 0;
        reset_n     = 0;

        number_i    = {(IN_DATA_WIDTH){1'b0}}; // 더해질 값

        valid_i    = 0;
        run_i      = 0;
    end

    initial begin
        @(posedge clk); //간격

        @(posedge clk); 
        #(`DELTA)       //전달지연
        reset_n     = 1;

        @(posedge clk); 
        #(`DELTA)       //전달지연
        reset_n     = 0;
        // 리셋 완료
        @(posedge clk); 
        #(`DELTA)       //전달지연
        reset_n     = 1;

        for (i = 1; i < 71 ; i = i + 1) begin 
            @(posedge clk); 
            #(`DELTA)       //전달지연
            valid_i = 1;
            run_i = 1;
            number_i    =  i+1; 
        end

        @(posedge clk); 
        #(`DELTA)       //전달지연
        valid_i = 0;
        number_i = 100;
    end

acc_core
#(
    .IN_DATA_WIDTH ( IN_DATA_WIDTH ),
    .DWIDTH        ( DWIDTH )
)u_acc_core(
    .clk           ( clk           ),
    .reset_n       ( reset_n       ),
    .number_i      ( number_i      ),
    .valid_i       ( valid_i       ),
    .run_i         ( run_i         ),
    .valid_o       ( valid_o       ),
    .result_o      ( result_o      )
);
endmodule