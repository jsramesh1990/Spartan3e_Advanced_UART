
module uart_rx #(parameter DATA_BITS=8)(
    input clk, input rst,
    input baud_tick,
    input rx,
    output reg [DATA_BITS-1:0] rx_data,
    output reg rx_ready
);
    reg [3:0] bit_cnt;
    reg [DATA_BITS-1:0] shift;
    reg [1:0] state;
    localparam IDLE=0, DATA=1, STOP=2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin state<=IDLE; rx_ready<=0; end
        else if (baud_tick) begin
            case(state)
                IDLE: if(!rx) begin bit_cnt<=0; state<=DATA; end
                DATA: begin shift[bit_cnt]<=rx; bit_cnt<=bit_cnt+1;
                      if(bit_cnt==DATA_BITS-1) state<=STOP; end
                STOP: begin rx_data<=shift; rx_ready<=1; state<=IDLE; end
            endcase
        end
    end
endmodule
