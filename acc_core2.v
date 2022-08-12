// Module Name: acc_core
// 
// description
//      Accumulator core. get value and accumulate it
//      give the accumulated number to output
//
// inputs
//      clk, reset_n: special inputs. Clock and negative reset
//      run_i: start signal.
//      valid_i: when it take the vlaid_i, finish the calculate and give result after 1 clk
//      number_i : operand (number to be accumulated)
// 
// outputs
//      valid_o: 1 tick if the result is valid
//      result_o: result.
//
// Notice
//      this module has 2 cycle latency

module acc_core
# (
    parameter IN_DATA_WIDTH = 8, // 들어오는 건 한 칸 8비트
    parameter DWIDTH = 65536 // 나가는 건 한 칸에  2의 16승비트
) 
(
    input clk, reset_n,

    input [IN_DATA_WIDTH - 1 : 0] number_i, // 들어오는 값

    input valid_i,
    input run_i,

    output valid_o,         
    output [DWIDTH - 1 : 0] result_o  //더해져서 커진 값
);

    reg valid_o_w;
    reg [DWIDTH - 1 : 0] save, save_n;

    //순차회로
    always @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            save <= {(DWIDTH){1'b0}}; // 0으로 초기화
            save_n <= {(DWIDTH){1'b0}};
        end else begin 
            save <= save_n;
        end
    end

    //조합회로
    always @(*) begin
        save_n = save;    // prevent latch
        if (valid_i && run_i) begin 
            save_n = save + number_i;
            @(posedge clk);
            valid_o_w = 1;      //계산된 알맞은 값이 나가는 동시에 valid_o이 1
        end else begin 
            @(posedge clk);
            valid_o_w = 0; //초기화는 안하지만 누산도 안함.
        end
    end

    assign result_o = save;
    assign valid_o = valid_o_w;
  
endmodule