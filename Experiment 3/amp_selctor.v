module AmpSelector (
    input [7:0] wave_in,
    input [1:0] select,
    output reg [7:0] wave_out
);

always begin
    case (select)
        0: wave_out = wave_in;
        1: wave_out = {1'b0,wave_in[7:1]};
        2: wave_out = {2'b0,wave_in[7:2]};
        3: wave_out = {3'b0,wave_in[7:3]};
        default: wave_out = wave_in;
    endcase
end
    
endmodule



