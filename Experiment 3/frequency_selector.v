module FrequencySelector (
    input clock, reset, load,
    input [3:0] par_in,
    output reg low_freq_clock
);

reg [4:0] fixed = 0;
reg [8:0] count;
wire carry;
initial begin 
    low_freq_clock = 0;
    count = {par_in, fixed};
end
always @(posedge clock, posedge reset) begin

    if(reset)
        count = {par_in, fixed};
	else if((~load) || carry)
		   count = {par_in, fixed};
    else 
        count = count + 1;
    
end

assign carry = &{count};

always @(posedge carry) begin    
    low_freq_clock = ~low_freq_clock;
end
    
endmodule