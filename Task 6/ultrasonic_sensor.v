
module ultrasonic_sensor (
    input clk,
    input trigger,
    input echo,
    output reg [7:0] distance
);
    reg [15:0] counter;
    reg echo_reg;

    always @(posedge clk) begin
        echo_reg <= echo;
        if (!echo_reg && echo) begin
            counter <= 0;
        end else if (echo) begin
            counter <= counter + 1;
        end else if (echo_reg && !echo) begin
            distance <= counter[15:8];
        end
    end
endmodule
