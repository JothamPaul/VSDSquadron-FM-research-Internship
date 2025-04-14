
module uart_tx (
    input clk,
    input tx_start,
    input [7:0] tx_data,
    output reg tx,
    output reg tx_done
);
    parameter CLK_PER_BIT = 1250;  // For 9600 baud @ 12MHz
    reg [15:0] clk_count = 0;
    reg [3:0] bit_index = 0;
    reg [9:0] tx_shift = 10'b1111111111;
    reg active = 0;

    always @(posedge clk) begin
        if (!active && tx_start) begin
            active <= 1;
            clk_count <= 0;
            bit_index <= 0;
            tx_shift <= {1'b1, tx_data, 1'b0};  // Stop + Data + Start
        end else if (active) begin
            clk_count <= clk_count + 1;
            if (clk_count >= CLK_PER_BIT) begin
                clk_count <= 0;
                tx <= tx_shift[bit_index];
                bit_index <= bit_index + 1;
                if (bit_index == 9) begin
                    active <= 0;
                    tx_done <= 1;
                end else begin
                    tx_done <= 0;
                end
            end
        end
    end
endmodule
