`timescale 1ns/1ns
module Counter_Sequencer_TB ();
	reg clk=1'b0;
	reg rst=0;
	reg j=0;
	wire w;
	Counter_Sequencer UUT(clk, rst,j,w);
	
	always #5 clk <= ~clk;
	
	initial begin
	#3   rst=1;
	#3   rst=0;
	#13  j=1;
	#13  j=1;
	#13  j=0;
	#9   j=1;
	#11  j=0;
	#315 j=0;
	#11  j=1;
	#9   j=1;
	#10  j=0;
	#10  j=1;
	#8  j=0;
	#200 $stop;
	end
endmodule





