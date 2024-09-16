`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Final Exam Question # 3: Custom Instruction
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 18.1
Datapath Module 1 / (1-X)
*/ 
module Datapath (
    input [7:0] data_x,
    input LUT_Bus_Ready,
    output reg [7:0] frac_result,
    output reg [7:0] integer_part    
);

always @(LUT_Bus_Ready) begin
    integer_part <= 8'd1;
        // LUT
        case (data_x)
            8'd0: begin
                frac_result <= 8'd0;
            end
            8'd1: begin
                frac_result <= 8'h11;
            end
            8'd2: begin
                frac_result <= 8'h25; 
            end
            8'd3: begin
                frac_result <= 8'h43;
            end
            8'd4: begin
                frac_result <= 8'h66;
            end
            8'd5: begin
                integer_part <= 8'd2;
                frac_result <= 8'h00;
            end
            8'd6: begin
                integer_part <= 8'd2;
                frac_result <= 8'h50;
            end
            8'd7: begin
                integer_part <= 8'd3;
                frac_result <= 8'h33;
            end
            8'd8: begin
                integer_part <= 8'd5;
                frac_result <= 8'h00;
            end
            8'd9: begin
                integer_part <= 8'h10; 
                frac_result <= 8'h33;
            end
            8'd10: begin
                frac_result <= 8'h11;
            end
            8'd11: begin
                frac_result <= 8'h12;
            end
            8'd12: begin
                frac_result <= 8'h13;
            end
            8'd13: begin
                frac_result <= 8'h14;
            end
            8'd14: begin
                frac_result <= 8'h16;
            end
            8'd15: begin
                frac_result <= 8'h17;
            end
            8'd16: begin
                frac_result <= 8'h19;
            end
            8'd17: begin
                frac_result <= 8'h20;
            end
            8'd18: begin
                frac_result <= 8'h21;
            end
            8'd19: begin
                frac_result <= 8'h23;
            end
            8'd20: begin
                frac_result <= 8'h25; 
            end
            //20 more
            8'd21: begin
                frac_result <= 8'h26; 
            end
            8'd22: begin
                frac_result <= 8'h28; 
            end
            8'd23: begin
                frac_result <= 8'h29; 
            end
            8'd24: begin
                frac_result <= 8'h31; 
            end
            8'd25: begin
                frac_result <= 8'h33; 
            end
            8'd26: begin
                frac_result <= 8'h35; 
            end
            8'd27: begin
                frac_result <= 8'h36; 
            end
            8'd28: begin
                frac_result <= 8'h38; 
            end
            8'd29: begin
                frac_result <= 8'h40; 
            end
            8'd30: begin
                frac_result <= 8'h43;
            end
            8'd31: begin
                frac_result <= 8'h44; 
            end
            8'd32: begin
                frac_result <= 8'h47; 
            end
            8'd33: begin
                frac_result <= 8'h49; 
            end
            8'd34: begin
                frac_result <= 8'h51; 
            end
            8'd35: begin
                frac_result <= 8'h53; 
            end
            8'd36: begin
                frac_result <= 8'h56; 
            end
            8'd37: begin
                frac_result <= 8'h58; 
            end
            8'd38: begin
                frac_result <= 8'h61; 
            end
            8'd39: begin
                frac_result <= 8'h63; 
            end
            8'd40: begin
                frac_result <= 8'h66;
            end
            // 20 more
            8'd41: begin
                frac_result <= 8'h69;
            end
            8'd42: begin
                frac_result <= 8'h72; 
            end
            8'd43: begin
                frac_result <= 8'h75;
            end
            8'd44: begin
                frac_result <= 8'h78;
            end
            8'd45: begin
                frac_result <= 8'h81;
            end
            8'd46: begin
                frac_result <= 8'h85;
            end
            8'd47: begin
                frac_result <= 8'h88;
            end
            8'd48: begin
                frac_result <= 8'h92;
            end
            8'd49: begin
                frac_result <= 8'h96;
            end
            8'd50: begin
                integer_part <= 8'd2 ;
                frac_result <= 8'h00;
            end
            8'd51: begin
                integer_part <= 8'd2;
                frac_result <= 8'h04;
            end
            8'd52: begin
                integer_part <= 8'd2; 
                frac_result <= 8'h08;
            end
            8'd53: begin
                integer_part <= 8'd2; 
                frac_result <= 8'h12;
            end
            8'd54: begin
                integer_part <= 8'd2;
                frac_result <= 8'h17;
            end
            8'd55: begin
                integer_part <= 8'd2; 
                frac_result <= 8'h22;
            end
            8'd56: begin
                integer_part <= 8'd2;
                frac_result <= 8'h27;
            end
            8'd57: begin
                integer_part <= 8'd2; 
                frac_result <= 8'h32;
            end
            8'd58: begin
                integer_part <= 8'd2; 
                frac_result <= 8'h38;
            end
            8'd59: begin
                integer_part <= 8'd2;
                frac_result <= 8'h43;
            end
            8'd60: begin
                integer_part <= 8'd2;
                frac_result <= 8'h50;
            end
            //20 more
            8'd61: begin
                integer_part <= 8'd2;
                frac_result <= 8'h56;
            end
            8'd62: begin
                integer_part <= 8'd2;
                frac_result <= 8'h63; 
            end
            8'd63: begin
                integer_part <= 8'd2;
                frac_result <= 8'h70;
            end
            8'd64: begin
                integer_part <= 8'd2;
                frac_result <= 8'h77;
            end
            8'd65: begin
                integer_part <= 8'd2;
                frac_result <= 8'h85;
            end
            8'd66: begin
                integer_part <= 8'd2;
                frac_result <= 8'h94;
            end
            8'd67: begin
                integer_part <= 8'd3;
                frac_result <= 8'h03;
            end
            8'd68: begin
                integer_part <= 8'd3;
                frac_result <= 8'h12;
            end
            8'd69: begin
                integer_part <= 8'd3;
                frac_result <= 8'h22;
            end
            8'd70: begin
                integer_part <= 8'd3;
                frac_result <= 8'h33;
            end
            8'd71: begin
                integer_part <= 8'd3;
                frac_result <= 8'h44;
            end
            8'd72: begin
                integer_part <= 8'd3;
                frac_result <= 8'h57;
            end
            8'd73: begin
                integer_part <= 8'd3;
                frac_result <= 8'h70;
            end
            //Addign 1 to integer
            8'd74: begin
                integer_part <= 8'd3;
                frac_result <= 8'h84;
            end
            8'd75: begin
                integer_part <= 8'd4;
                frac_result <= 8'h00;
            end
            8'd76: begin
                integer_part <= 8'd4;
                frac_result <= 8'h16;
            end
            8'd77: begin
                integer_part <= 8'd4;
                frac_result <= 8'h34;
            end
            8'd78: begin
                integer_part <= 8'd4;
                frac_result <= 8'h54;
            end
            8'd79: begin
                integer_part <= 8'd4;
                frac_result <= 8'h76;
            end
            8'd80: begin
                integer_part <= 8'd5;
                frac_result <= 8'h00;
            end
            //20 more
            8'd81: begin
                integer_part <= 8'd5;
                frac_result <= 8'h26;
            end
            8'd82: begin
                integer_part <= 8'd5;
                frac_result <= 8'h55;
            end
            8'd83: begin
                integer_part <= 8'd5;
                frac_result <= 8'h88;
            end
            8'd84: begin
                integer_part <= 8'd6;
                frac_result <= 8'h25;
            end
            8'd85: begin
                integer_part <= 8'd6;
                frac_result <= 8'h66;
            end
            8'd86: begin
                integer_part <= 8'd7;
                frac_result <= 8'h14;
            end
            8'd87: begin
                integer_part <= 8'd7;
                frac_result <= 8'h69;
            end
            8'd88: begin
                integer_part <= 8'd8;
                frac_result <= 8'h33;
            end
            8'd89: begin
                integer_part <= 8'd9;
                frac_result <= 8'h09;
            end
            8'd90: begin
                integer_part <= 8'h10; 
                frac_result <= 8'h33;
            end
            8'd91: begin
                integer_part <= 8'h11; 
                frac_result <= 8'h11;
            end
            8'd92: begin
                integer_part <= 8'h12; 
                frac_result <= 8'h50;
            end
            8'd93: begin
                integer_part <= 8'h14; 
                frac_result <= 8'h28;
            end
            8'd94: begin
                integer_part <= 8'h16; 
                frac_result <= 8'h66;
            end
            8'd95: begin
                integer_part <= 8'h20; 
                frac_result <= 8'h00;
            end
            8'd96: begin
                integer_part <= 8'h25; 
                frac_result <= 8'h00;
            end
            8'd97: begin
                integer_part <= 8'h33; 
                frac_result <= 8'h33;
            end
            8'd98: begin
                integer_part <= 8'h50; 
                frac_result <= 8'h00;
            end
            8'd99: begin
                integer_part <= 8'h10; 
                frac_result <= 8'h0;
            end
            8'd100: begin
                frac_result <= 8'h11;
            end
            // another 100
            //RENUMBER
            
            8'd101: begin
                frac_result <= 8'h11;
            end
            8'd102: begin
                frac_result <= 8'h11;
            end
            8'd103: begin
                frac_result <= 8'h11;
            end
            8'd104: begin
                frac_result <= 8'h11;
            end
            8'd105: begin
                frac_result <= 8'h11;
            end
            8'd106: begin
                frac_result <= 8'h11;
            end
            8'd107: begin
                frac_result <= 8'h12;
            end
            8'd108: begin
                frac_result <= 8'h12;
            end
            8'd109: begin
                frac_result <= 8'h12;
            end
            8'd110: begin
                frac_result <= 8'h12;
            end
            8'd111: begin
                frac_result <= 8'h12;
            end
            8'd112: begin
                frac_result <= 8'h12;
            end
            8'd113: begin
                frac_result <= 8'h12;
            end
            8'd114: begin
                frac_result <= 8'h12;
            end
            8'd115: begin
                frac_result <= 8'h12;
            end
            8'd116: begin
                frac_result <= 8'h13;
            end
            8'd117: begin
                frac_result <= 8'h13;
            end
            8'd118: begin
                frac_result <= 8'h13;
            end
            8'd119: begin
                frac_result <= 8'h13;
            end
            8'd120: begin
                frac_result <= 8'h13;
            end
            //20 more
            8'd121: begin
                frac_result <= 8'h13;
            end
            8'd122: begin
                frac_result <= 8'h13;
            end
            8'd123: begin
                frac_result <= 8'h14;
            end
            8'd124: begin
                frac_result <= 8'h14;
            end
            8'd125: begin
                frac_result <= 8'h14;
            end
            8'd126: begin
                frac_result <= 8'h14;
            end
            8'd127: begin
                frac_result <= 8'h14;
            end
            8'd128: begin
                frac_result <= 8'h14;
            end
            8'd129: begin
                frac_result <= 8'h14;
            end
            8'd130: begin
                frac_result <= 8'h14;
            end
            8'd131: begin
                frac_result <= 8'h15;
            end
            8'd132: begin
                frac_result <= 8'h15;
            end
            8'd133: begin
                frac_result <= 8'h15;
            end
            8'd134: begin
                frac_result <= 8'h15;
            end
            8'd135: begin
                frac_result <= 8'h15;
            end
            8'd136: begin
                frac_result <= 8'h15;
            end
            8'd137: begin
                frac_result <= 8'h15;
            end
            8'd138: begin
                frac_result <= 8'h16;
            end
            8'd139: begin
                frac_result <= 8'h16;
            end
            8'd140: begin
                frac_result <= 8'h16;
            end
            // 20 more
            8'd141: begin
                frac_result <= 8'h16;
            end
            8'd142: begin
                frac_result <= 8'h16;
            end
            8'd143: begin
                frac_result <= 8'h16;
            end
            8'd144: begin
                frac_result <= 8'h16;
            end
            8'd145: begin
                frac_result <= 8'h16;
            end
            8'd146: begin
                frac_result <= 8'h17;
            end
            8'd147: begin
                frac_result <= 8'h17;
            end
            8'd148: begin
                frac_result <= 8'h17;
            end
            8'd149: begin
                frac_result <= 8'h17;
            end
            8'd150: begin
                frac_result <= 8'h17;
            end
            8'd151: begin
                frac_result <= 8'h17;
            end
            8'd152: begin
                frac_result <= 8'h17;
            end
            8'd153: begin
                frac_result <= 8'h18;
            end
            8'd154: begin
                frac_result <= 8'h18;
            end
            8'd155: begin
                frac_result <= 8'h18;
            end
            8'd156: begin
                frac_result <= 8'h18;
            end
            8'd157: begin
                frac_result <= 8'h18;
            end
            8'd158: begin
                frac_result <= 8'h18;
            end
            8'd159: begin
                frac_result <= 8'h18;
            end
            8'd160: begin
                frac_result <= 8'h19;
            end
            //20 more
            8'd161: begin
                frac_result <= 8'h19;
            end
            8'd162: begin
                frac_result <= 8'h19;
            end
            8'd163: begin
                frac_result <= 8'h19;
            end
            8'd164: begin
                frac_result <= 8'h19;
            end
            8'd165: begin
                frac_result <= 8'h19;
            end
            8'd166: begin
                frac_result <= 8'h19;
            end
            8'd167: begin
                frac_result <= 8'h20;
            end
            8'd168: begin
                frac_result <= 8'h20;
            end
            8'd169: begin
                frac_result <= 8'h20;
            end
            8'd170: begin
                frac_result <= 8'h20;
            end
            8'd171: begin
                frac_result <= 8'h20;
            end
            8'd172: begin
                frac_result <= 8'h20;
            end
            8'd173: begin
                frac_result <= 8'h20;
            end
            8'd174: begin
                frac_result <= 8'h21;
            end
            8'd175: begin
                frac_result <= 8'h21;
            end
            8'd176: begin
                frac_result <= 8'h21;
            end
            8'd177: begin
                frac_result <= 8'h21;
            end
            8'd178: begin
                frac_result <= 8'h21;
            end
            8'd179: begin
                frac_result <= 8'h21;
            end
            8'd180: begin
                frac_result <= 8'h21;
            end
            //20 more
            8'd181: begin
                frac_result <= 8'h21;
            end
            8'd182: begin
                frac_result <= 8'h22; 
            end
            8'd183: begin
                frac_result <= 8'h22;
            end
            8'd184: begin
                frac_result <= 8'h22;
            end
            8'd185: begin
                frac_result <= 8'h22;
            end
            8'd186: begin
                frac_result <= 8'h22;
            end
            8'd187: begin
                frac_result <= 8'h22;
            end
            8'd188: begin
                frac_result <= 8'h23;
            end
            8'd189: begin
                frac_result <= 8'h23;
            end
            8'd190: begin
                frac_result <= 8'h23;
            end
            8'd191: begin
                frac_result <= 8'h23;
            end
            8'd192: begin
                frac_result <= 8'h23;
            end
            8'd193: begin
                frac_result <= 8'h23;
            end
            8'd194: begin
                frac_result <= 8'h24;
            end
            8'd195: begin
                frac_result <= 8'h24;
            end
            8'd196: begin
                frac_result <= 8'h24;
            end
            8'd197: begin
                frac_result <= 8'h24;
            end
            8'd198: begin
                frac_result <= 8'h24;
            end
            8'd199: begin
                frac_result <= 8'h24;
            end
            8'd200: begin
                frac_result <= 8'h25;
            end

            // 55 MORE
            8'd201: begin
                frac_result <= 8'h25;
            end
            8'd202: begin
                frac_result <= 8'h25;
            end
            8'd203: begin
                frac_result <= 8'h25;
            end
            8'd204: begin
                frac_result <= 8'h25;
            end
            8'd205: begin
                frac_result <= 8'h25;
            end
            8'd206: begin
                frac_result <= 8'h25;
            end
            8'd207: begin
                frac_result <= 8'h26;
            end
            8'd208: begin
                frac_result <= 8'h26;
            end
            8'd209: begin
                frac_result <= 8'h26;
            end
            8'd210: begin
                frac_result <= 8'h26;
            end
            8'd211: begin
                frac_result <= 8'h26;
            end
            8'd212: begin
                frac_result <= 8'h26;
            end
            8'd213: begin
                frac_result <= 8'h26;
            end
            8'd214: begin
                frac_result <= 8'h27;
            end
            8'd215: begin
                frac_result <= 8'h27;
            end
            8'd216: begin
                frac_result <= 8'h27;
            end
            8'd217: begin
                frac_result <= 8'h27;
            end
            8'd218: begin
                frac_result <= 8'h27;
            end
            8'd219: begin
                frac_result <= 8'h28;
            end
            8'd220: begin
                frac_result <= 8'h28; 
            end
            //20 more
            8'd221: begin
                frac_result <= 8'h28;
            end
            8'd222: begin
                frac_result <= 8'h28;
            end
            8'd223: begin
                frac_result <= 8'h28;
            end
            8'd224: begin
                frac_result <= 8'h28;
            end
            8'd225: begin
                frac_result <= 8'h28;
            end
            8'd226: begin
                frac_result <= 8'h29;
            end
            8'd227: begin
                frac_result <= 8'h29;
            end
            8'd228: begin
                frac_result <= 8'h29;
            end
            8'd229: begin
                frac_result <= 8'h29;
            end
            8'd230: begin
                frac_result <= 8'h29;
            end
            8'd231: begin
                frac_result <= 8'h29;
            end
            8'd232: begin
                frac_result <= 8'h30;
            end
            8'd233: begin
                frac_result <= 8'h30;
            end
            8'd234: begin
                frac_result <= 8'h30;
            end
            8'd235: begin
                frac_result <= 8'h30;
            end
            8'd236: begin
                frac_result <= 8'h30;
            end
            8'd237: begin
                frac_result <= 8'h30;
            end
            8'd238: begin
                frac_result <= 8'h31;
            end
            8'd239: begin
                frac_result <= 8'h31;
            end
            8'd240: begin
                frac_result <= 8'h31;
            end
            // 20 more
            8'd241: begin
                frac_result <= 8'h31;
            end
            8'd242: begin
                frac_result <= 8'h31;
            end
            8'd243: begin
                frac_result <= 8'h31;
            end
            8'd244: begin
                frac_result <= 8'h32;
            end
            8'd245: begin
                frac_result <= 8'h32;
            end
            8'd246: begin
                frac_result <= 8'h32;
            end
            8'd247: begin
                frac_result <= 8'h32;
            end
            8'd248: begin
                frac_result <= 8'h32;
            end
            8'd249: begin
                frac_result <= 8'h33;
            end
            8'd250: begin
                frac_result <= 8'h33;
            end
            8'd251: begin
                frac_result <= 8'h33;
            end
            8'd252: begin
                frac_result <= 8'h33;
            end
            8'd253: begin
                frac_result <= 8'h33;
            end
            8'd254: begin
                frac_result <= 8'h33;
            end
            8'd255: begin
                frac_result <= 8'h34;
            end
            default begin
                frac_result <= 16'd0;
            end
        endcase 
end
endmodule
