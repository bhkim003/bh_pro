module counter #(
    paramater CNTWIDTH = 7


)
(
input clk,
input rst_n,

input en,

output [CNT-WIDTH-1:0] cnt_o
);

//시퀀셜
reg [CNT_WIDTH-1:0] cnt, cnt_n;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= {(CNT_WIDTH){1'b0}};
    end else begin
        cnt <= cnt_n;
    end
end

//조합
always @(*) begin
    cnt_n = cnt;
    if (en) begin
        cnt_n = cnt + 'd1;
    end
end

assign cnt_o = cnt;

endmodule