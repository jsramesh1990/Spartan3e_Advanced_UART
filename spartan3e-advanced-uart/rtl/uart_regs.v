
module uart_regs(
    input clk, rst,
    input wr_en,
    input [7:0] wr_data,
    output reg [7:0] ctrl
);
    always @(posedge clk or posedge rst) begin
        if(rst) ctrl<=8'h00;
        else if(wr_en) ctrl<=wr_data;
    end
endmodule
