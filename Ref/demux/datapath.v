module SE_collect_dp (input Sh_en, rst, clock, SE_in, stop, output [3:0] Serial_out, output [1:0] Port_number );

  wire [1:0]  parallel_out;
  assign      Port_number= parallel_out;
  Demux 	DUT1 (SE_in, parallel_out, Serial_out);
  Shiftreg  DUT2 (SE_in, rst, Sh_en, clock,  parallel_out);

endmodule



