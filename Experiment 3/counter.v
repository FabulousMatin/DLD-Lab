module Counter (
    input clk,rst,
    output cout,
    output reg [7:0] counter_res
);
    always @(posedge clk, posedge rst) begin
        if (rst)
            counter_res = 8'b0;
        else
            counter_res = counter_res + 1'b1;
    end
    assign cout = &{counter_res};
endmodule