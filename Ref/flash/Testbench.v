module Testbench();

	reg clock, Write_IO, reset ;
	reg [15:0] FLASH_data, Adress_bus;
	wire [15:0] buffermem_out1, buffermem_out2;
	wire get_data;
	wire Interrupt_en;
	

	Toplevel DUT3 (clock, reset,  Write_IO, FLASH_data, Adress_bus, get_data, Interrupt_en, buffermem_out1, buffermem_out2);

	initial begin
	   clock      = 1'b0; 
	   reset      = 1'b0;
	   Write_IO   = 1'b0;
	   FLASH_data   = 16'd0;
	   Adress_bus = 16'd0;
	   end
	   
	 always #5 clock = ~clock;

	 
	initial begin 
		reset = 1'b1;
		#3
		reset = 1'b0;
		#13
		Adress_bus =16'h5000; ///***** start address= 0X5000********///
		Write_IO   = 1'b1;
		#23
		Write_IO   = 1'b0;
	  end

	always @ (posedge get_data) begin ///***** Generating random data as the data receiving from the ADC********///
	  FLASH_data<=$random;
	end
	
	
	always @ (posedge clock) begin
	if (Interrupt_en) begin
		  Adress_bus <=16'h5001;  ///***** Ack address= 0X5001********///
		  Write_IO   = 1'b1;
	  end 
	  else
	  begin
		  Write_IO   = 1'b0;
		  end
	end



endmodule

