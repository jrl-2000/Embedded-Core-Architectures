module Counter_Sequencer(input clk, rst, j, output w);
    reg i0, en;
	reg [2:0] pstate, nstate;
	reg [3:0] Count;
	wire Co;
	parameter [2:0]
	A = 0, B = 1, C = 2, D = 3, E = 4, F=5;

	always@(pstate,j,Co) begin
		i0=0; en=0;
		nstate=0;
			case(pstate)
				A: nstate= j ? B : A;
				B: nstate= j ? C : A;
				C: nstate= j ? B : D;
				D: nstate= j ? E : A;
				E: begin i0=1; nstate= j  ? B : F; end
				F: begin en=1; nstate= Co ? A : F; end
				default: nstate=A;
			endcase
	end
	
	always@(posedge clk, posedge rst) begin
		if (rst)
		pstate <= A;
		else
		pstate <= nstate;
	end 
			
	assign w= (pstate==F) ? 1'b1 :1'b0;
	
	always@(posedge clk, posedge rst) begin
		if (rst) Count <= 4'b0;
		else
			if(i0) Count <= 4'b0;	
					else
						if (en) Count <= Count +1;					  
	end 
	
	assign Co= & Count;
	
    
endmodule 