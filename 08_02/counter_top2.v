module Counter_TOP #(
    parameter CNT_WIDTH = 7
)(
    input clk,
    input rst_n,

    input start_i,

    input [CNT_WIDTH-1:0] cnt_val_i,

    output [CNT_WIDTH-1:0] cnt_o,
    output done_o
);

    wire run_w;


    Counter #(
        CNT_WIDTH (CNT_WIDTH)
    ) u_counter (


    );
33

endmodule