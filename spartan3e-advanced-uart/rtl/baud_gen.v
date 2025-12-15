
module baud_gen #(parameter CLK_FREQ=50000000, BAUD=115200, OVERSAMPLE=16)
(
    input clk,
    input rst,
    output reg baud_tick
);
    localparam integer DIVISOR = CLK_FREQ/(BAUD*OVERSAMPLE);
    integer cnt;
    always @(posedge clk or posedge rst) begin
        if (rst) begin cnt <= 0; baud_tick <= 0; end
        else if (cnt == DIVISOR-1) begin cnt <= 0; baud_tick <= 1; end
        else begin cnt <= cnt + 1; baud_tick <= 0; end
    end
endmodule
