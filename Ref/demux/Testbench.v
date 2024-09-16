module SE_collect_tb;
    reg  clock=0, rst=0;
    reg SE_in=1'b1;
	wire [3:0] Serial_out;
	wire [1:0] Port_number;
	wire Valid;
 
    
    Toplevel UUT (clock, rst, SE_in, Valid,  Serial_out, Port_number);
    
    always #5 clock = ~clock;

    initial begin
		#10 SE_in= 1'b1;
        #10 rst = 1;
        #10 rst = 0;
		
    end

	initial repeat(1000) #10 SE_in=$random;
	
endmodule