module FSM_mealy(
    input clk, reset_n
    input X,

    output reg Z
);
    
    reg [1 : 0] state; //always 안에서 좌변은 reg
    reg [1 : 0] next_state;
    always @ (posedge clk or negedge reset_n) begin //플립플롭 부분
        if(!reset_n) begin
            state <= 2'b00;
        end else begin
            state <= next_state;
        end
    end

    always @ (*) begin
        case(state)
            2'b00: begin
                if(X == 1'b0) begin
                    next_state <= 2'b00;
                    Z <= 1'b0;
                end else begin
                    next_state <= 2'b01;
                    Z <= 1'b0;
                end
            end

            2'b01: begin

            end

            2'b10: begin
                
            end

        endcase
    end