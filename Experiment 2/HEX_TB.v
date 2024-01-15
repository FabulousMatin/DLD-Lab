module HEX_TB;
    reg [3:0] in;
    wire [6:0] out;
    hex_display hd(in,out);
    initial begin
        #10 in = 0;
        #10 in = 1;
        #10 in = 2;
        #10 in = 3;
        #10 in = 4;
        #10 in = 5;
        #10 in = 6;
        #10 in = 7;
        #10 in = 8;
        #10 in = 9;
        #10 in = 10;
        #10 in = 11;
        #10 in = 12;
        #10 in = 13;
        #10 in = 14;
        #10 in = 15;

    end
endmodule