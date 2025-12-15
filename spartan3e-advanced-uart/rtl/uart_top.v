
module uart_top(
    input clk, rst,
    input rx,
    output tx
);
    wire baud_tick;
    wire [7:0] rx_data;
    wire rx_ready;

    baud_gen bg(.clk(clk),.rst(rst),.baud_tick(baud_tick));
    uart_tx txu(.clk(clk),.rst(rst),.baud_tick(baud_tick),
                .tx_start(rx_ready),.tx_data(rx_data),.tx(tx));
    uart_rx rxu(.clk(clk),.rst(rst),.baud_tick(baud_tick),
                .rx(rx),.rx_data(rx_data),.rx_ready(rx_ready));
endmodule
