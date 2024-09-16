`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 6: Custom Instruction
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 18.1
Exponent Controller and LUT to BCD
*/
module EXP_CNTRLR (
    input clk,
    input reset,
    input start,
    input [7:0] data_x,
    output reg done = 1'b0,
    output reg [19:0] result
);

integer state = 0;
integer state_next = 0;

localparam ST_RST = 0;
localparam ST_WAIT_START = 1;
localparam ST_TAYLOR_0 = 2;
localparam ST_TAYLOR_1 = 3;
localparam ST_TAYLOR_2 = 4;
localparam ST_TAYLOR_3 = 5;

reg [19:0] summation;
reg [15:0] exp_x;
reg [0:15] frac_result;
reg [3:0] integer_part;


// Always Block for Updating State Machine
always @(posedge clk, posedge reset) begin
    if (reset) begin
        state <= ST_RST;
    end
    else begin
        state <= state_next;
    end
end

always @(state, start) begin
    state_next <= state;
    case (state)
        ST_RST: begin
            summation <= 20'd1;
            exp_x <= 16'd0;
            state_next <= ST_WAIT_START;
        end
        ST_WAIT_START: begin
            if (start) begin
                done <= 1'b0;
                state_next <= ST_TAYLOR_0;
            end
        end
        ST_TAYLOR_0: begin

            exp_x = data_x * data_x;

            state_next <= ST_TAYLOR_1;
        end
        ST_TAYLOR_1: begin
            exp_x = exp_x >>> 1;
            integer_part <= 4'd1;
            state_next <= ST_TAYLOR_2;
        end
        ST_TAYLOR_2: begin
            // Check Num for over 1 + x(frac) + 3rd term calc above
            // A large LUT: Look up table
            case (data_x)
                8'd0: begin
                    frac_result <= 16'd0;
                end
                8'd1: begin
                    frac_result <= 16'b0000_0001_0000_0000;
                end
                8'd2: begin
                    frac_result <= 16'b0000_0010_0000_0010; 
                end
                8'd3: begin
                    frac_result <= 16'b0000_0011_0000_0100;
                end
                8'd4: begin
                    frac_result <= 16'b0000_0100_0000_1000;
                end
                8'd5: begin
                    frac_result <= 16'b0000_0101_0001_0010;
                end
                8'd6: begin
                    frac_result <= 16'b0000_0110_0001_1000;
                end
                8'd7: begin
                    frac_result <= 16'b0000_0111_0010_0100;
                end
                8'd8: begin
                    frac_result <= 16'b0000_1000_0011_0010;
                end
                8'd9: begin
                    frac_result <= 16'b0000_1001_0100_0000;
                end
                8'd10: begin
                    frac_result <= 16'b0001_0000_0101_0000;
                end
                8'd11: begin
                    frac_result <= 16'b0001_0001_0110_0000;
                end
                8'd12: begin
                    frac_result <= 16'b0001_0010_0111_0010;
                end
                8'd13: begin
                    frac_result <= 16'b0001_0011_1000_0100;
                end
                8'd14: begin
                    frac_result <= 16'b0001_0100_1001_1000;
                end
                8'd15: begin
                    frac_result <= 16'b0001_0110_0001_0010;
                end
                8'd16: begin
                    frac_result <= 16'b0001_0111_0010_1000;
                end
                8'd17: begin
                    frac_result <= 16'b0001_1000_0100_0100;
                end
                8'd18: begin
                    frac_result <= 16'b0001_1001_0110_0010;
                end
                8'd19: begin
                    frac_result <= 16'b0010_0000_1000_0000;
                end
                8'd20: begin
                    frac_result <= 16'b0010_0010_0000_0000;
                end
                //20 more
                8'd21: begin
                    frac_result <= 16'b0010_0011_0010_0000;
                end
                8'd22: begin
                    frac_result <= 16'b0010_0100_0100_0010; 
                end
                8'd23: begin
                    frac_result <= 16'b0010_0101_0110_0100;
                end
                8'd24: begin
                    frac_result <= 16'b0010_0110_1000_1000;
                end
                8'd25: begin
                    frac_result <= 16'b0010_1000_0001_0010;
                end
                8'd26: begin
                    frac_result <= 16'b0010_1001_0011_1000;
                end
                8'd27: begin
                    frac_result <= 16'b0011_0000_0110_0100;
                end
                8'd28: begin
                    frac_result <= 16'b0011_0001_1001_0010;
                end
                8'd29: begin
                    frac_result <= 16'b0011_0011_0010_0000;
                end
                8'd30: begin
                    frac_result <= 16'b0011_0100_0101_0000;
                end
                8'd31: begin
                    frac_result <= 16'b0011_0101_1000_0000;
                end
                8'd32: begin
                    frac_result <= 16'b0011_0111_0001_0010;
                end
                8'd33: begin
                    frac_result <= 16'b0011_1000_0100_0100;
                end
                8'd34: begin
                    frac_result <= 16'h3978; //0011 1000 0100 0100
                end
                8'd35: begin
                    frac_result <= 16'h4112;
                end
                8'd36: begin
                    frac_result <= 16'h4248;
                end
                8'd37: begin
                    frac_result <= 16'h4384;
                end
                8'd38: begin
                    frac_result <= 16'h4522;
                end
                8'd39: begin
                    frac_result <= 16'h4660;
                end
                8'd40: begin
                    frac_result <= 16'h4800;
                end
                // 20 more
                8'd41: begin
                    frac_result <= 16'h4940;
                end
                8'd42: begin
                    frac_result <= 16'h5082; 
                end
                8'd43: begin
                    frac_result <= 16'h5224;
                end
                8'd44: begin
                    frac_result <= 16'h5368;
                end
                8'd45: begin
                    frac_result <= 16'h5512;
                end
                8'd46: begin
                    frac_result <= 16'h5658;
                end
                8'd47: begin
                    frac_result <= 16'h5804;
                end
                8'd48: begin
                    frac_result <= 16'h5952;
                end
                8'd49: begin
                    frac_result <= 16'h6100;
                end
                8'd50: begin
                    frac_result <= 16'h6250;
                end
                8'd51: begin
                    frac_result <= 16'h6400;
                end
                8'd52: begin
                    frac_result <= 16'h6552;
                end
                8'd53: begin
                    frac_result <= 16'h6704;
                end
                8'd54: begin
                    frac_result <= 16'h6858;
                end
                8'd55: begin
                    frac_result <= 16'h7012;
                end
                8'd56: begin
                    frac_result <= 16'h7168;
                end
                8'd57: begin
                    frac_result <= 16'h7324;
                end
                8'd58: begin
                    frac_result <= 16'h7482;
                end
                8'd59: begin
                    frac_result <= 16'h7640;
                end
                8'd60: begin
                    frac_result <= 16'h7800;
                end
                //20 more
                8'd61: begin
                    frac_result <= 16'h7960;
                end
                8'd62: begin
                    frac_result <= 16'h8122; 
                end
                8'd63: begin
                    frac_result <= 16'h8284;
                end
                8'd64: begin
                    frac_result <= 16'h8448;
                end
                8'd65: begin
                    frac_result <= 16'h8612;
                end
                8'd66: begin
                    frac_result <= 16'h8778;
                end
                8'd67: begin
                    frac_result <= 16'h8944;
                end
                8'd68: begin
                    frac_result <= 16'h9112;
                end
                8'd69: begin
                    frac_result <= 16'h9280;
                end
                8'd70: begin
                    frac_result <= 16'h9450;
                end
                8'd71: begin
                    frac_result <= 16'h9620;
                end
                8'd72: begin
                    frac_result <= 16'h9792;
                end
                8'd73: begin
                    frac_result <= 16'h9964;
                end
                //Addign 1 to integer
                8'd74: begin
                    frac_result <= 16'h0138;
                    integer_part <= 4'd2;
                end
                8'd75: begin
                    frac_result <= 16'h0312;
                    integer_part <= 4'd2;
                end
                8'd76: begin
                    frac_result <= 16'h0488;
                    integer_part <= 4'd2;
                end
                8'd77: begin
                    frac_result <= 16'h0664;
                    integer_part <= 4'd2;
                end
                8'd78: begin
                    frac_result <= 16'h0842;
                    integer_part <= 4'd2;
                end
                8'd79: begin
                    frac_result <= 16'h1020;
                    integer_part <= 4'd2;
                end
                8'd80: begin
                    frac_result <= 16'h1200;
                    integer_part <= 4'd2;
                end
                //20 more
                8'd81: begin
                    frac_result <= 16'h1380;
                    integer_part <= 4'd2;
                end
                8'd82: begin
                    frac_result <= 16'h1562; 
                    integer_part <= 4'd2;
                end
                8'd83: begin
                    frac_result <= 16'h1744;
                    integer_part <= 4'd2;
                end
                8'd84: begin
                    frac_result <= 16'h1928;
                    integer_part <= 4'd2;
                end
                8'd85: begin
                    frac_result <= 16'h2112;
                    integer_part <= 4'd2;
                end
                8'd86: begin
                    frac_result <= 16'h2298;
                    integer_part <= 4'd2;
                end
                8'd87: begin
                    frac_result <= 16'h2484;
                    integer_part <= 4'd2;
                end
                8'd88: begin
                    frac_result <= 16'h2672;
                    integer_part <= 4'd2;
                end
                8'd89: begin
                    frac_result <= 16'h2860;
                    integer_part <= 4'd2;
                end
                8'd90: begin
                    frac_result <= 16'h3050;
                    integer_part <= 4'd2;
                end
                8'd91: begin
                    frac_result <= 16'h3240;
                    integer_part <= 4'd2;
                end
                8'd92: begin
                    frac_result <= 16'h3432;
                    integer_part <= 4'd2;
                end
                8'd93: begin
                    frac_result <= 16'h3624;
                    integer_part <= 4'd2;
                end
                8'd94: begin
                    frac_result <= 16'h3818;
                    integer_part <= 4'd2;
                end
                8'd95: begin
                    frac_result <= 16'h4012;
                    integer_part <= 4'd2;
                end
                8'd96: begin
                    frac_result <= 16'h4208;
                    integer_part <= 4'd2;
                end
                8'd97: begin
                    frac_result <= 16'h4404;
                    integer_part <= 4'd2;
                end
                8'd98: begin
                    frac_result <= 16'h4602;
                    integer_part <= 4'd2;
                end
                8'd99: begin
                    frac_result <= 16'h4800;
                    integer_part <= 4'd2;
                end
                8'd100: begin
                    frac_result <= 16'b0001_0000_0101_0000;
                end
               // another 100
               //RENUMBER
               
               8'd101: begin
                    frac_result <= 16'h1061;
                end
                8'd102: begin
                    frac_result <= 16'h1072;
                end
                8'd103: begin
                    frac_result <= 16'h1083;
                end
                8'd104: begin
                    frac_result <= 16'h1094;
                end
                8'd105: begin
                    frac_result <= 16'h1105;
                end
                8'd106: begin
                    frac_result <= 16'h1116;
                end
                8'd107: begin
                    frac_result <= 16'h1127;
                end
                8'd108: begin
                    frac_result <= 16'h1138;
                end
                8'd109: begin
                    frac_result <= 16'h1149;
                end
                8'd110: begin
                    frac_result <= 16'b0001_0001_0110_0000;
                end
                8'd111: begin
                    frac_result <= 16'h1171;
                end
                8'd112: begin
                    frac_result <= 16'h1182;
                end
                8'd113: begin
                    frac_result <= 16'h1193;
                end
                8'd114: begin
                    frac_result <= 16'h1204;
                end
                8'd115: begin
                    frac_result <= 16'h1216;
                end
                8'd116: begin
                    frac_result <= 16'h1227;
                end
                8'd117: begin
                    frac_result <= 16'h1238;
                end
                8'd118: begin
                    frac_result <= 16'h1249;
                end
                8'd119: begin
                    frac_result <= 16'h1260;
                end
                8'd120: begin
                    frac_result <= 16'b0001_0010_0111_0010;
                end
                //20 more
                8'd121: begin
                    frac_result <= 16'h1283;
                end
                8'd122: begin
                    frac_result <= 16'h1294;
                end
                8'd123: begin
                    frac_result <= 16'h1305;
                end
                8'd124: begin
                    frac_result <= 16'h1316;
                end
                8'd125: begin
                    frac_result <= 16'h1328;
                end
                8'd126: begin
                    frac_result <= 16'h1339;
                end
                8'd127: begin
                    frac_result <= 16'h1350;
                end
                8'd128: begin
                    frac_result <= 16'h1361;
                end
                8'd129: begin
                    frac_result <= 16'h1373;
                end
                8'd130: begin
                    frac_result <= 16'b0001_0011_1000_0100;
                end
                8'd131: begin
                    frac_result <= 16'h1395;
                end
                8'd132: begin
                    frac_result <= 16'h1407;
                end
                8'd133: begin
                    frac_result <= 16'h1418;
                end
                8'd134: begin
                    frac_result <= 16'h1429;
                end
                8'd135: begin
                    frac_result <= 16'h1441;
                end
                8'd136: begin
                    frac_result <= 16'h1452;
                end
                8'd137: begin
                    frac_result <= 16'h1463;
                end
                8'd138: begin
                    frac_result <= 16'h1475;
                end
                8'd139: begin
                    frac_result <= 16'h1486;
                end
                8'd140: begin
                    frac_result <= 16'b0001_0100_1001_1000;
                end
                // 20 more
                8'd141: begin
                    frac_result <= 16'h1509;
                end
                8'd142: begin
                    frac_result <= 16'h1520; 
                end
                8'd143: begin
                    frac_result <= 16'h1532;
                end
                8'd144: begin
                    frac_result <= 16'h1543;
                end
                8'd145: begin
                    frac_result <= 16'h1555;
                end
                8'd146: begin
                    frac_result <= 16'h1566;
                end
                8'd147: begin
                    frac_result <= 16'h1578;
                end
                8'd148: begin
                    frac_result <= 16'h1589;
                end
                8'd149: begin
                    frac_result <= 16'h1601;
                end
                8'd150: begin
                    frac_result <= 16'b0001_0110_0001_0010;
                end
                8'd151: begin
                    frac_result <= 16'h1624;
                end
                8'd152: begin
                    frac_result <= 16'h1635;
                end
                8'd153: begin
                    frac_result <= 16'h1647;
                end
                8'd154: begin
                    frac_result <= 16'h1658;
                end
                8'd155: begin
                    frac_result <= 16'h1670;
                end
                8'd156: begin
                    frac_result <= 16'h1681;
                end
                8'd157: begin
                    frac_result <= 16'h1693;
                end
                8'd158: begin
                    frac_result <= 16'h1704;
                end
                8'd159: begin
                    frac_result <= 16'h1716;
                end
                8'd160: begin
                    frac_result <= 16'b0001_0111_0010_1000;
                end
                //20 more
                8'd161: begin
                    frac_result <= 16'h1739;
                end
                8'd162: begin
                    frac_result <= 16'h1751; 
                end
                8'd163: begin
                    frac_result <= 16'h1762;
                end
                8'd164: begin
                    frac_result <= 16'h1774;
                end
                8'd165: begin
                    frac_result <= 16'h1786;
                end
                8'd166: begin
                    frac_result <= 16'h1797;
                end
                8'd167: begin
                    frac_result <= 16'h1809;
                end
                8'd168: begin
                    frac_result <= 16'h1821;
                end
                8'd169: begin
                    frac_result <= 16'h1832;
                end
                8'd170: begin
                    frac_result <= 16'b0001_1000_0100_0100;
                end
                8'd171: begin
                    frac_result <= 16'h1856;
                end
                8'd172: begin
                    frac_result <= 16'h1867;
                end
                8'd173: begin
                    frac_result <= 16'h1879;
                end
                8'd174: begin
                    frac_result <= 16'h1891;
                end
                8'd175: begin
                    frac_result <= 16'h1903;
                end
                8'd176: begin
                    frac_result <= 16'h1914;
                end
                8'd177: begin
                    frac_result <= 16'h1926;
                end
                8'd178: begin
                    frac_result <= 16'h1938;
                end
                8'd179: begin
                    frac_result <= 16'h1950;
                end
                8'd180: begin
                    frac_result <= 16'b0001_1001_0110_0010;
                end
                //20 more
                8'd181: begin
                    frac_result <= 16'h1973;
                end
                8'd182: begin
                    frac_result <= 16'h1985; 
                end
                8'd183: begin
                    frac_result <= 16'h1997;
                end
                8'd184: begin
                    frac_result <= 16'h2009;
                end
                8'd185: begin
                    frac_result <= 16'h2021;
                end
                8'd186: begin
                    frac_result <= 16'h2032;
                end
                8'd187: begin
                    frac_result <= 16'h2044;
                end
                8'd188: begin
                    frac_result <= 16'h2056;
                end
                8'd189: begin
                    frac_result <= 16'h2068;
                end
                8'd190: begin
                    frac_result <= 16'b0010_0000_1000_0000;
                end
                8'd191: begin
                    frac_result <= 16'h2092;
                end
                8'd192: begin
                    frac_result <= 16'h2104;
                end
                8'd193: begin
                    frac_result <= 16'h2116;
                end
                8'd194: begin
                    frac_result <= 16'h2128;
                end
                8'd195: begin
                    frac_result <= 16'h2140;
                end
                8'd196: begin
                    frac_result <= 16'h2152;
                end
                8'd197: begin
                    frac_result <= 16'h2164;
                end
                8'd198: begin
                    frac_result <= 16'h2176;
                end
                8'd199: begin
                    frac_result <= 16'h2188;
                end
                8'd200: begin
                    frac_result <= 16'b0010_0010_0000_0000;
                end

                // 55 MORE
                8'd201: begin
                    frac_result <= 16'h2212;
                end
                8'd202: begin
                    frac_result <= 16'h2224; 
                end
                8'd203: begin
                    frac_result <= 16'h2236;
                end
                8'd204: begin
                    frac_result <= 16'h2248;
                end
                8'd205: begin
                    frac_result <= 16'h2260;
                end
                8'd206: begin
                    frac_result <= 16'h2272;
                end
                8'd207: begin
                    frac_result <= 16'h2284;
                end
                8'd208: begin
                    frac_result <= 16'h2296;
                end
                8'd209: begin
                    frac_result <= 16'h2308;
                end
                8'd210: begin
                    frac_result <= 16'b0010_0011_0010_0000;
                end
                8'd211: begin
                    frac_result <= 16'h2332;
                end
                8'd212: begin
                    frac_result <= 16'h2344;
                end
                8'd213: begin
                    frac_result <= 16'h2356;
                end
                8'd214: begin
                    frac_result <= 16'h2368;
                end
                8'd215: begin
                    frac_result <= 16'h2381;
                end
                8'd216: begin
                    frac_result <= 16'h1239;
                end
                8'd217: begin
                    frac_result <= 16'h2405;
                end
                8'd218: begin
                    frac_result <= 16'h2417;
                end
                8'd219: begin
                    frac_result <= 16'h2429;
                end
                8'd220: begin
                    frac_result <= 16'b0010_0100_0100_0010; 
                end
                //20 more
                8'd221: begin
                    frac_result <= 16'h2454;
                end
                8'd222: begin
                    frac_result <= 16'h2466;
                end
                8'd223: begin
                    frac_result <= 16'h2478;
                end
                8'd224: begin
                    frac_result <= 16'h2490;
                end
                8'd225: begin
                    frac_result <= 16'h2503;
                end
                8'd226: begin
                    frac_result <= 16'h2515;
                end
                8'd227: begin
                    frac_result <= 16'h2527;
                end
                8'd228: begin
                    frac_result <= 16'h2539;
                end
                8'd229: begin
                    frac_result <= 16'h2552;
                end
                8'd230: begin
                    frac_result <= 16'b0010_0101_0110_0100;
                end
                8'd231: begin
                    frac_result <= 16'h2576;
                end
                8'd232: begin
                    frac_result <= 16'h2589;
                end
                8'd233: begin
                    frac_result <= 16'h2601;
                end
                8'd234: begin
                    frac_result <= 16'h2613;
                end
                8'd235: begin
                    frac_result <= 16'h2626;
                end
                8'd236: begin
                    frac_result <= 16'h2638;
                end
                8'd237: begin
                    frac_result <= 16'h2650;
                end
                8'd238: begin
                    frac_result <= 16'h2663;
                end
                8'd239: begin
                    frac_result <= 16'h2675;
                end
                8'd240: begin
                    frac_result <= 16'b0010_0110_1000_1000;
                end
                // 20 more
                8'd241: begin
                    frac_result <= 16'h2700;
                end
                8'd242: begin
                    frac_result <= 16'h2712;
                end
                8'd243: begin
                    frac_result <= 16'h2725;
                end
                8'd244: begin
                    frac_result <= 16'h2737;
                end
                8'd245: begin
                    frac_result <= 16'h2750;
                end
                8'd246: begin
                    frac_result <= 16'h2762;
                end
                8'd247: begin
                    frac_result <= 16'h2775;
                end
                8'd248: begin
                    frac_result <= 16'h2787;
                end
                8'd249: begin
                    frac_result <= 16'h2800;
                end
                8'd250: begin
                    frac_result <= 16'b0010_1000_0001_0010;
                end
                8'd251: begin
                    frac_result <= 16'h2825;
                end
                8'd252: begin
                    frac_result <= 16'h2837;
                end
                8'd253: begin
                    frac_result <= 16'h2850;
                end
                8'd254: begin
                    frac_result <= 16'h2868;
                end
                8'd255: begin
                    frac_result <= 16'h2875;
                end
                default begin
                    frac_result <= 16'd0;
                end
            endcase
            state_next <= ST_TAYLOR_3;
        end
        ST_TAYLOR_3: begin
            result <= {integer_part, frac_result};
            done <= 1'b1;
            state_next <= ST_RST;
        end 
    endcase
end
    
endmodule
