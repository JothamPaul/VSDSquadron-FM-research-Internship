
module buzzer (
    input [7:0] distance,
    output reg buzzer
);
    always @(*) begin
        buzzer = (distance < 10) ? 1'b1 : 1'b0;
    end
endmodule
