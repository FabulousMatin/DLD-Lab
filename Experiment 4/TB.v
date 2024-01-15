`timescale 1 ns/ 100 ps

module TB ();
    reg clock, reset, start, clkPB;
    reg [1:0] u;
    reg [15:0] v;


    wire done, rd_req, wr_req;
    wire [20:0] wr_data;


    MainModule inst_MainModule(clock, reset, start, clkPB, v, u, done, rd_req, wr_req, wr_data);

    initial begin
        clock = 0;
        u = 3;
        v = 16'b0001111100000000;
    end

    always begin
        #1 clock = ~clock;
    end

    initial  begin    
        reset = 1;
        #10 reset = 0;
        #10 clkPB = 1;
        #10 clkPB = 0;
        
        #10 start = 0;
        #10 start = 1;
        #10 start = 0;
        #1000 $stop;
    end
endmodule