module totall_TB;
    reg clock = 0,reset,clkPB,SerIn;
    wire [6:0] display;
    wire valid, SerOut;
    data_path dp(clock,reset,clkPB,SerIn,display,valid,SerOut);

    always begin
        #1 clock = ~clock;
    end

    initial begin
        #5 SerIn = 0;
        #10 clkPB = 1;
        #10 clkPB = 0;

        #5 SerIn = 1;
        #10 clkPB = 1;
        #10 clkPB = 0;

        #5 SerIn = 1;
        #10 clkPB = 1;
        #10 clkPB = 0;

        #5 SerIn = 0;
        #10 clkPB = 1;
        #10 clkPB = 0;

        #5 SerIn = 1;
        #10 clkPB = 1;
        #10 clkPB = 0;

        #5 SerIn = 0;
        #10 clkPB = 1;
        #10 clkPB = 0;

        #5 SerIn = 1;
        #10 clkPB = 1;
        #10 clkPB = 0;

        #10 clkPB = 1;
        #10 clkPB = 0;

        #10 clkPB = 1;
        #10 clkPB = 0;

        #10 clkPB = 1;
        #10 clkPB = 0;

        #10 clkPB = 1;
        #10 clkPB = 0;
        
        #10 clkPB = 1;
        #10 clkPB = 0;

        #10 clkPB = 1;
        #10 clkPB = 0;

        #10 clkPB = 1;
        #10 clkPB = 0;

        #10 clkPB = 1;
        #10 clkPB = 0;

        #10 clkPB = 1;
        #10 clkPB = 0;

        #10 clkPB = 1;
        #10 clkPB = 0;

        #10 clkPB = 1;
        #10 clkPB = 0;

	#100 $stop;
    end
endmodule


