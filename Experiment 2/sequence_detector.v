module sequence_detector (
    input clk,rst,clkEN,cout,SerIn,
    output SerOut,
    output reg SerOutValid,inc_cnt,rst_cnt
);
    parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6;
    reg [2:0] pstate,nstate;
    initial pstate = A;
    always @(pstate, SerIn, cout) begin
        {inc_cnt, rst_cnt, SerOutValid} = 3'b000;
	$display("%d",pstate);
        case(pstate)     
            A: nstate = SerIn ? B : A;
            B: nstate = SerIn ? C : A;
            C: nstate = SerIn ? C : D;
            D: nstate = SerIn ? E : A;
            E: nstate = SerIn ? B : F;
            F: begin 
                rst_cnt = 1;
                nstate = SerIn ? G : A;
            end
            G: begin
                inc_cnt = 1;
                SerOutValid = 1;
                if(cout == 1 && SerIn == 1)
                    nstate = B;
                else if(cout == 1 && SerIn == 0)
                    nstate = A;
                else if(cout == 0)
                    nstate = G; 
            end
            default nstate = A;
        endcase
    end


    assign SerOut = SerIn;

    always @(posedge clk, posedge rst) begin
        if(rst)
            pstate <= A;
        else if(clkEN)
            pstate <= nstate;
    end
endmodule


