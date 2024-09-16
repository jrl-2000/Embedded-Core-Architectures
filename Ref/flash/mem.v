module Dualport( input clk, we_1, we_2, input [7:0] index1, index2, input [15:0] wd1, wd2, output [15:0] rd1, rd2);

	 reg [15:0] RAM[255:0];
	 
	 assign rd1 = RAM[index1];
	 assign rd2 = RAM[index2];
		
		always @(posedge clk) begin
			if (we_1)
			RAM[index1] <= wd1;
		else
			if (we_2)
			RAM[index2] <= wd2;
		end
		
endmodule 