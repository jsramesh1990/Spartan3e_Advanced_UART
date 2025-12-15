
module uart_tb;
    reg clk=0,rst=1,rx=1;
    wire tx;
    uart_top dut(.clk(clk),.rst(rst),.rx(rx),.tx(tx));
    always #10 clk=~clk;
    initial begin
        #100 rst=0;
        #200 rx=0; #160 rx=1;
        #2000 $finish;
    end
endmodule
