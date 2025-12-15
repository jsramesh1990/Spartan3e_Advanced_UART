
module uart_tx #(parameter DATA_BITS=8)(
    input clk, input rst,
    input baud_tick,
    input tx_start,
    input [DATA_BITS-1:0] tx_data,
    output reg tx,
    output reg tx_busy
);
    reg [3:0] bit_cnt;
    reg [DATA_BITS-1:0] shift;
    reg [1:0] state;
    localparam IDLE=0, START=1, DATA=2, STOP=3;

    always @(posedge clk or posedge rst) begin
        if (rst) begin tx<=1; tx_busy<=0; state<=IDLE; end
        else if (baud_tick) begin
            case(state)
                IDLE:  if(tx_start) begin shift<=tx_data; tx_busy<=1; tx<=0; bit_cnt<=0; state<=DATA; end
                DATA: begin tx<=shift[0]; shift<=shift>>1; bit_cnt<=bit_cnt+1;
                      if(bit_cnt==DATA_BITS-1) state<=STOP; end
                STOP: begin tx<=1; tx_busy<=0; state<=IDLE; end
            endcase
        end
    end
endmodule
