module Counter_fsm #(
    parameter CNT_WIDTH = 7
    )  
    (
    input clk,
    input rst_n,

    input start_i,
    input [CNT_WIDTH-1:0] cnt_val,

    input [CNT_WIDTH-1:0] cnt_i,

    output run_o,
    output done_o
    );

    localparam IDLE = 2'b00;
    localparam RUN  = 2'b01;
    localparam DONE = 2'b10;

    //capture
    reg [CNT_WIDTH-1:0] cnt_val;
    always@(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            cnt_val <= {(CNT_WIDTH){1'b0}};
        end else if (start_i) begin 
            cnt_val <= cnt_val_i;
        end
    end

    // fsm
    reg [1:0] c_state, n_state;
    always @(posedge clk, negedge rst_n) begin 
        if (!rst_n) begin 
            c_state <= IDLE;
        end else begin 
            c_state <= n_state;
        end
    end

    always @(*) begin 
        n_state = c_state;
        case (c_state)
            IDLE : begin
                if (start_i) begin
                    n_state = RUN;
                end
            end

            RUN : begin
                if (cnt == cnt_val) begin 
                    n_state = DONE;
                end
            end

            DONE : begin
                n_state = IDLE;
            end
            
        endcase
    end

    assign run_o = (c_state == RUN); 
    assign done_o = (c_state == DONE);

    
endmodule