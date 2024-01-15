module WaveGenerator (
    input clock,reset,
    input [7:0] count,
    output [7:0] square, triangle, reciprocal, sin, full, half
);
    assign square = (count < 128) ? 0 : 255;
    assign triangle = (count < 128) ? count << 1 : (255 - count) << 1;
    assign reciprocal = 255 / (256 - count);

    reg [15:0] snn = 0, cnn = 30000;
	 reg [15:0]	sn, cn;
	always @(posedge clock, posedge reset) begin
        if (reset) begin
            snn = 0;
            cnn = 30000;
            cn = 0;
            sn = 30000;
        end
		else begin
            sn = snn + {cnn[15],cnn[15],cnn[15],cnn[15],cnn[15],cnn[15],cnn[15:6]};
            cn = cnn - {sn[15],sn[15],sn[15],sn[15],sn[15],sn[15],sn[15:6]};
            snn = sn;
            cnn = cn;
		end
    
    end 

    assign sin = sn[15:8] + 127;
    assign full = (sin >= 127) ? sin : sin + 2*(127-sin);
    assign half = (sin >= 127) ? sin : 127;
endmodule


