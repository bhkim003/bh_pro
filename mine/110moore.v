module moore_110(
    input clk, reset_n
    input X,

    output reg Z
)

    reg [1 : 0] state; //always 안에서 좌변은 reg
    reg [1 : 0] next_state;
    always @ (posedge clk or negedge reset_n) begin 
        if(!reset_n) begin
            state <= 2'b00;
        end else begin
            state <= next_state;
        end
    end
    // X = 1'b0; state = 2'b00 이거 넣으라고 했었나
    always @ (*) begin
        case(state)
            2'b00 : begin
                Z <= 1'b0;
                if(X == 1'b0) begin
                    next_state <= 2'b00;
                end else begin
                    next_state <= 2'b01;
                end
            end

            2'b01 : begin
                Z <= 1'b0;
                if(X == 1'b0) begin
                    next_state <= 2'b00;
                end else begin
                    next_state <= 2'b10;
                end
            end

            2'b10 : begin
                Z <= 1'b0;
                if(X == 1'b0) begin
                    next_state <= 2'b11;
                end else begin
                    next_state <= 2'b10;
                end
            end

            2'b11 : begin
                Z <= 1'b1;
                if(X == 1'b0) begin
                    next_state <= 2'b00;
                end else begin
                    next_state <= 2'b10;
                end
            end
        endcase
    end
endmodule