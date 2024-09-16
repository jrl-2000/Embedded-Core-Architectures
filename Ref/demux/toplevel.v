module Toplevel (input clock, rst, SE_in,  output valid, output [3:0] Serial_out,  output [1:0]  Port_number );

 
  wire Sh_en;
  
  SE_collect_dp 	DP         (Sh_en, rst, clock, SE_in, stop, Serial_out, Port_number);
  SE_collect_cont   Controller (clock, rst, SE_in, Sh_en, valid, stop);

endmodule



