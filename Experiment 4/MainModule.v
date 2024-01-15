module MainModule(
  input clock, reset, start, clkPB,
  input[15:0] vi,
  input [1:0] ui,
  output done, rd_req, wr_req,
  output[20:0] wr_data
);
 
  wire engDone, shiftEn, loadEn, eng_start;
  MainController inst_MainControllerclock, start, engDone, reset, wr_req, shiftEn, loadEn, eng_start, done);
  MainDataPath inst_MainDataPath(clock, reset, loadEn, loadEn, shiftEn, eng_start, clkPB, vi, ui, wr_data, engDone, rd_req);


endmodule