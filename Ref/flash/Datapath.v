module Toplevel (input clock, reset, Write_IO, input [15:0] FLASH_data, Adress_bus,  output get_data, Interrupt_en, output [15:0] buffermem_out1, buffermem_out2);
	
	reg [7:0] write_addr;
	reg [7:0] read_addr;
	wire c_carryout;
	wire init;
	
	Controller 	DUT1 (clock, reset, start, ack, c_carryout, get_data, Count_en, Interrupt_en, memwrite, init);
    Dualport    DUT2 (clock, memwrite, 1'b0, write_addr[7:0], read_addr,  FLASH_data, 16'd0,  buffermem_out1, buffermem_out2);

	

 //*********** Counter for Write address generation*************//	
	always @ (posedge clock)  
		begin 
			if (init) 
				write_addr <= 8'd0;
			else 
				if (Count_en) 
					write_addr <= write_addr + 1'b1 ;
	end
//*********** ******************************************/

		
 //*********** Counter for Read address generation after the data is transferred to the buffer*************//
//*********** This is just for showing that the data is written correctly to the buffer********************// 
	 always @ (posedge clock, posedge reset)  
			begin 
				if (reset) 
					read_addr <= 8'd0;
				else 
					if (!get_data) 
						read_addr <= read_addr + 1'b1 ;
		end
//*********** *******************************************************************************************//	

	assign  start       =  ((Adress_bus==16'h5000)& (Write_IO==1'd1))? 1: 0;
	assign  ack         =  ((Adress_bus==16'h5001)& (Write_IO==1'd1))? 1: 0;
	assign  c_carryout  =  ((write_addr==8'hFF))? 1: 0;
	
endmodule