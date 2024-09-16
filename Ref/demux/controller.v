module SE_collect_cont(input clock, reset, SE_in, output Sh_en, valid, cont);

	reg [3:0] pstate,nstate;
	
	parameter [3:0]          
							Wait= 4'd0,
                            sh1=  4'd1, sh2=  4'd2,
							D1=   4'd3, D2 =  4'd4, D3 =  4'd5, D4 =  4'd6, D5=  4'd7, D6=  4'd8, D7=  4'd9, D8=  4'd10,						
                            Stop_cont =4'd11;

//////********************Sequential part***********************//////							
	always @(posedge clock, posedge reset) begin
	  if ( reset)
	  pstate <= reset;
	  else
	  pstate <=nstate;
	end
//////********************************************************//////


//////********************Combinational part***********************//////		
	always @ (pstate, SE_in)
	  begin
	  
			case (pstate)

				Wait: begin 
				if (SE_in) 
				nstate <= Wait; 
				else
				nstate <= sh1;
				end


				sh1: begin
				nstate <= sh2;
				end
				
				sh2: begin
				nstate <= D1;
				end
				
				D1: begin
				nstate <= D2;
				end
				
				D2: begin
				nstate <= D3;
				end
				
				D3: begin
				nstate <= D4;
				end
				
				D4: begin
				nstate <= D5;
				end
				
				D5: begin
				nstate <= D6;
				end

				D6: begin
				nstate <= D7;
				end

				D7: begin
				nstate <= D8;
				end
				
				D8: begin
				nstate <= Stop_cont;
				end
				
				Stop_cont: begin
				if (SE_in)
				nstate <= Wait;
				else
				nstate <= D1;
				end

				default: nstate <= pstate;
			endcase
	end
	
//////********************************************************//////
	
	assign Sh_en = ((pstate==sh1)^ (pstate==sh2))? 1: 0;
	assign valid  = ((pstate==D1)| (pstate==D2)|(pstate==D3)| (pstate==D4) | (pstate==D5)| (pstate==D6)| (pstate==D7)| (pstate==D8))? 1: 0;
	assign cont  = ((pstate==Wait)) ? 1: 0;
	endmodule


