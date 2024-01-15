module MainController (
    input clock, start, engDone, reset,
    output reg writeEn, shiftEn, loadEn, EngStart, done
);
    parameter [2:0] A = 0, B = 1, C = 2, D = 3, E = 4, F = 5;
    reg [1:0] counter;
    reg countEn, reset_counter;
    reg [2:0] pstate, nstate;
    wire Carry_out = &{counter};

    always @(pstate, start, engDone, Carry_out) begin
        case (pstate)
            A: nstate = start ? B : A;
            B: nstate = start ? B : C; 
            C: nstate = D; 
            D: nstate = engDone ? E : D;
            E: nstate = Carry_out ? A : F;
            F: nstate = C;
            default: nstate = A; 
        endcase
    end

    always @(pstate) begin
        {writeEn, shiftEn, loadEn, EngStart, done, countEn, reset_counter} = 7'b0; 
        case (pstate)
            A: begin reset_counter = 1; done = 1; end
            B: begin loadEn = 1; EngStart = 1; end
            C: begin end
            D: begin  end
            E: begin writeEn = 1; end
            F: begin  countEn = 1; shiftEn = 1;  EngStart = 1; end
            default: {writeEn, shiftEn, loadEn, EngStart, done, countEn, reset_counter} = 7'bx; 
        endcase
    end

    always @(posedge clock, posedge reset) begin
        if(reset)
            pstate = A;
        else
            pstate = nstate;
    end

    always @(posedge clock) begin
        if(reset_counter)
            counter = 0;
        else if(countEn)
            counter = counter + 1;
        else
            counter = counter;

    end
    
endmodule