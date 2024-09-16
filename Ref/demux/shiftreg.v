module Shiftreg (input SE_in, rst, sh_en, clock, output reg[1:0] par_out);
  

always @ (posedge clock or posedge rst)
	begin 
		if (rst)
			par_out <= 2'b00;
		else 
			if (sh_en) begin
				par_out <= {par_out [0], SE_in} ;
			end
			else 
				par_out <= par_out;

	end

endmodule



