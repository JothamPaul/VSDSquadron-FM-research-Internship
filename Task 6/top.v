
module top (
    input clk,
    input trigger,
    input echo,
    output tx,
    output buzzer,
    output led_red
);

    wire [7:0] distance;
    wire tx_done;
    wire tx_start;
    wire [7:0] tx_data;

    // Ultrasonic sensor
    ultrasonic_sensor us1 (
        .clk(clk),
        .trigger(trigger),
        .echo(echo),
        .distance(distance)
    );

    // UART transmitter
    uart_tx uart1 (
        .clk(clk),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_done(tx_done)
    );

    // Buzzer logic
    buzzer buzz1 (
        .distance(distance),
        .buzzer(buzzer)
    );

    assign tx_data = distance;
    assign tx_start = 1'b1;

    // Heartbeat LED
    reg [23:0] counter = 0;
    reg led_state = 0;
    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter == 12_000_000) begin
            counter <= 0;
            led_state <= ~led_state;
        end
    end
    assign led_red = led_state;

endmodule
