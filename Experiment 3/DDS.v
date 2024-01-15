module DDS (
    input clk, rst,
    output [7:0] DDS
);
reg [7:0] address = 0;
    always @(posedge clk, posedge rst) begin
        if(rst)
            address = 8'b0;
        else begin
            address = address + 1;
        end

    end
    assign DDS = address;
endmodule



