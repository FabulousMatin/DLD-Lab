module four_bit_counter(
	input clk, rst_cnt, inc_cnt, clkEN,
 	output reg [3:0] po, output cout
);

 always@ (posedge clk) begin
	if(rst_cnt)
		po <= 4'b0000;
	else if(inc_cnt && clkEN)
		po <= po + 1;
 end

 assign cout = (po == 4'b1001) ? 1 : 0;

endmodule


