module WaveSelector (
    input [7:0] square, triangle, reciprocal, sine, full_wave_rect, half_wave_rect, DDS,
    input [2:0] select,
    output reg [7:0] wave_out
);
always begin
    case (select)
        0: wave_out = reciprocal;
        1: wave_out = square;
        2: wave_out = triangle;
        3: wave_out = sine;
        4: wave_out = full_wave_rect;
        5: wave_out = half_wave_rect;
        6: wave_out = DDS;
        default: wave_out = sine;
    endcase
end

    
endmodule