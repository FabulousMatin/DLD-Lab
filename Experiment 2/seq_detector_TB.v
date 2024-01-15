module seq_TB;
    reg clkEN=0,SerIn,clk = 0,rst,cout = 0;
    wire SerOut,SerOutValid,inc_cnt,rst_cnt;
    
    sequence_detector sd(clk,rst,clkEN,cout,SerIn,SerOut,SerOutValid,inc_cnt,rst_cnt);

    always begin
        #5 clk = ~clk;
        
    end

    initial begin
        #23 SerIn = 1;
        #23 SerIn = 0;

        #23 SerIn = 0; #5 clkEN = 1;  #5 clkEN = 0;
        #23 SerIn = 1; #5 clkEN = 1;  #5 clkEN = 0;
        #23 SerIn = 1; #5 clkEN = 1;  #5 clkEN = 0;
        #23 SerIn = 0; #5 clkEN = 1;  #5 clkEN = 0;
        #23 SerIn = 1; #5 clkEN = 1;  #5 clkEN = 0;
        #23 SerIn = 0; #5 clkEN = 1;  #5 clkEN = 0;
        #23 SerIn = 1; #5 clkEN = 1;  #5 clkEN = 0;
        #23 SerIn = 1; #5 clkEN = 1;  #5 clkEN = 0;
        #23 SerIn = 0; #5 clkEN = 1;  #5 clkEN = 0;

        #23 cout = 1; #5 clkEN = 1; #5 clkEN = 0;
        #23 SerIn = 1; 
    end
endmodule