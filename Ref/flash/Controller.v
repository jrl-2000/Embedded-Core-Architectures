module Controller (input clock, reset, start, ack, c_carryout, output get_data, Count_en, Interrupt_en, memwrite, init);
	
	reg [3:0] pstate,nstate;

	parameter [2:0]          
							wait4start= 3'd0,
                            Intf_Req  = 3'd1,
							Getdata   = 3'd2, 	
							nextdata  = 3'd3, 								
                            SendInt   = 3'd4;

//////********************Sequential part***********************//////							
	always @(posedge clock, posedge reset) begin
	  if ( reset)
	  pstate <= reset;
	  else
	  pstate <=nstate;
	end
//////********************************************************//////


//////********************Combinational part***********************//////		
	always @ (pstate, start, ack, c_carryout)
	
	  begin
	  
			case (pstate)

				wait4start: begin 
				if (start) 
				nstate = Intf_Req; 
				else
				nstate = wait4start;
				end


				Intf_Req: begin
				if (!start)
				nstate = Getdata;
				else
				nstate = Intf_Req;
				end
				
				Getdata: begin
				nstate = nextdata;
				end
				
				nextdata: begin
				if (c_carryout)
				nstate = SendInt;
				else
				nstate = Getdata;
				end
				
				SendInt: begin
				if (ack)
				nstate = wait4start;
				else
				nstate = SendInt;
				end
				
				
				default: nstate = pstate;
			endcase
	end
	
//////********************************************************//////
	
	assign get_data = ((pstate==Getdata))? 1: 0;
	assign Count_en = ((pstate==nextdata))? 1: 0;
	assign memwrite = ((pstate==nextdata))? 1: 0;
	assign init     = ((pstate==Intf_Req))?1: 0;
	assign Interrupt_en  = ((pstate==SendInt)) ? 1: 0;
	endmodule


