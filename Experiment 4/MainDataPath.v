module MainDataPath(input clock, reset, load_sh_reg, ui_reg_load, shiftEn, eng_start,clkPB, input[15:0] vi,
input [1:0] ui, output[20:0] wr_data ,output engDone, rd_req);

  wire [15:0] eng_x, fracpart;
  wire [1:0] intpart, ui_reg_out;
  ShiftReg ut_shift_reg (clock, reset, load_sh_reg, shiftEn, vi, eng_x);
  exponential ut_exponential(clock,reset,eng_start, eng_x, engDone, intpart, fracpart);
  Reg ut_reg(clock, reset, ui_reg_load, ui, ui_reg_out);
  CombShift ut_CombShift(ui_reg_out,{intpart,fracpart},wr_data);
  one_pulser ut_one_pulser(~clkPB,clock,reset,rd_req);
endmodule

