module FSM_moore (
    input clk, reset_n
    input X,

    output Z
);
    reg [1:0] state;
    reg [1:0] nㄴext_state;

    always @ (posedge clk or negedge reset_n) begin
        if (!reset_n) begin 
            state <= 2'b00;
        end else begin
             state <= next_state;
        end

    end

    always @ (*) begin
        case(state)

            2'b00: begin
                Z <= 1'b0;

                if (X = )
            end

        endcase
    end

