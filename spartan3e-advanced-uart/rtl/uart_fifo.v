
module uart_fifo #(parameter DEPTH=16, WIDTH=8)(
    input clk, rst, wr_en, rd_en,
    input [WIDTH-1:0] din,
    output reg [WIDTH-1:0] dout,
    output reg full, empty
);
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    integer wptr, rptr, count;

    always @(posedge clk or posedge rst) begin
        if(rst) begin wptr<=0; rptr<=0; count<=0; empty<=1; full<=0; end
        else begin
            if(wr_en && !full) begin mem[wptr]<=din; wptr<=wptr+1; count<=count+1; end
            if(rd_en && !empty) begin dout<=mem[rptr]; rptr<=rptr+1; count<=count-1; end
            empty <= (count==0);
            full  <= (count==DEPTH);
        end
    end
endmodule
