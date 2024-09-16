module Demux (input SE_in, input [1:0] select, output reg[3:0] SE_out);
  

always @ (SE_in, select)
	begin 
	SE_out=4'd0;
			case (select)
			4'd0:    SE_out[0]=  SE_in;
			4'd1:    SE_out[1]=  SE_in;
			4'd2:    SE_out[2]=  SE_in;
			4'd3:    SE_out[3]=  SE_in;
			default: SE_out   =  4'd0;
			endcase
	end

endmodule



