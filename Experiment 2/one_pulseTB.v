module one_pulse_TB;
    wire out;
    reg LP,clk = 0;
    one_pulser op(LP,clk,out);
    always begin
        #5 clk = ~clk;
    end
    initial begin
        #7 LP = 1;
        #100 LP = 0;
    end
    
endmodule


