module data_path(input clk, rst, clkPB, SerIn, output [7:0] out, output SerOutValid, SerOut);

wire clkEN, rst_counter, inc_cnt, cout;
wire [3:0] cnt_out;

four_bit_counter FourBitCounter(clk, rst_counter, inc_cnt, clkEN, cnt_out, cout);

one_pulser OnePulser(clkPB, clk, rst, clkEN);

hex_display HexDisplay(cnt_out, out);

sequence_detector SequenceDetector (clk, rst, clkEN, cout, SerIn, SerOut, SerOutValid, inc_cnt, rst_counter);

endmodule