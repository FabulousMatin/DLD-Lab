module PWM (
    input [7:0] signal_in,
    input clock, reset,
    output reg signal_out
);
    reg [7:0] counter = 0;
    always@(posedge clock, posedge reset) begin

        if (reset)
            counter = 0;

        else begin

            if (counter < signal_in) 
                signal_out <= 1;
            else
                signal_out <= 0;

            counter = counter + 1;
        end
    end
endmodule




