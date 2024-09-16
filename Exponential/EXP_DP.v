`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 6: Custom Instruction
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 18.1
Exponent Datapath Seven Seg
*/
module EXP_DP (
    input [15:0] result,
	 output [27:0] displayarry
 
);
// Display 0
  wire digit00;
  wire digit01;
  wire digit02;
  wire digit03;
  wire digit04;
  wire digit05;
  wire digit06;
 // Display 1
  wire digit10;
  wire digit11;
  wire digit12;
  wire digit13;
  wire digit14;
  wire digit15;
  wire digit16;
 // Display 2
  wire digit20;
  wire digit21;
  wire digit22;
  wire digit23;
  wire digit24;
  wire digit25;
  wire digit26;
 // Display 3
  wire digit30;
  wire digit31;
  wire digit32;
  wire digit33;
  wire digit34;
  wire digit35;
  wire digit36;
  reg [6:0] digit0;
  reg [6:0] digit1;
  reg [6:0] digit2;
  reg [6:0] digit3;


  always @ (result)
    case (result[3:0])
      4'h0 : digit0 = 7'b1000000;
      4'h1 : digit0 = 7'b1111001;
      4'h2 : digit0 = 7'b0100100;
      4'h3 : digit0 = 7'b0110000;
      4'h4 : digit0 = 7'b0011001;
      4'h5 : digit0 = 7'b0010010;
      4'h6 : digit0 = 7'b0000010;
      4'h7 : digit0 = 7'b1111000;
      4'h8 : digit0 = 7'b0000000;
      4'h9 : digit0 = 7'b0011000;
      4'hA : digit0 = 7'b0001000;
      4'hB : digit0 = 7'b0000011;
      4'hC : digit0 = 7'b1000110;
      4'hD : digit0 = 7'b0100001;
      4'hE : digit0 = 7'b0000110;
      default : digit0 = 7'b0001110;
    endcase

    always @ (result)
    case (result[7:4])
      4'h0 : digit1 = 7'b1000000;
      4'h1 : digit1 = 7'b1111001;
      4'h2 : digit1 = 7'b0100100;
      4'h3 : digit1 = 7'b0110000;
      4'h4 : digit1 = 7'b0011001;
      4'h5 : digit1 = 7'b0010010;
      4'h6 : digit1 = 7'b0000010;
      4'h7 : digit1 = 7'b1111000;
      4'h8 : digit1 = 7'b0000000;
      4'h9 : digit1 = 7'b0011000;
      4'hA : digit1 = 7'b0001000;
      4'hB : digit1 = 7'b0000011;
      4'hC : digit1 = 7'b1000110;
      4'hD : digit1 = 7'b0100001;
      4'hE : digit1 = 7'b0000110;
      default : digit1 = 7'b0001110;
    endcase

    always @ (result)
    case (result[11:8])
      4'h0 : digit2 = 7'b1000000;
      4'h1 : digit2 = 7'b1111001;
      4'h2 : digit2 = 7'b0100100;
      4'h3 : digit2 = 7'b0110000;
      4'h4 : digit2 = 7'b0011001;
      4'h5 : digit2 = 7'b0010010;
      4'h6 : digit2 = 7'b0000010;
      4'h7 : digit2 = 7'b1111000;
      4'h8 : digit2 = 7'b0000000;
      4'h9 : digit2 = 7'b0011000;
      4'hA : digit2 = 7'b0001000;
      4'hB : digit2 = 7'b0000011;
      4'hC : digit2 = 7'b1000110;
      4'hD : digit2 = 7'b0100001;
      4'hE : digit2 = 7'b0000110;
      default : digit2 = 7'b0001110;
    endcase

     always @ (result)
    case (result[15:12])
      4'h0 : digit3 = 7'b1000000;
      4'h1 : digit3 = 7'b1111001;
      4'h2 : digit3 = 7'b0100100;
      4'h3 : digit3 = 7'b0110000;
      4'h4 : digit3 = 7'b0011001;
      4'h5 : digit3 = 7'b0010010;
      4'h6 : digit3 = 7'b0000010;
      4'h7 : digit3 = 7'b1111000;
      4'h8 : digit3 = 7'b0000000;
      4'h9 : digit3 = 7'b0011000;
      4'hA : digit3 = 7'b0001000;
      4'hB : digit3 = 7'b0000011;
      4'hC : digit3 = 7'b1000110;
      4'hD : digit3 = 7'b0100001;
      4'hE : digit3 = 7'b0000110;
      default : digit3 = 7'b0001110;
    endcase





  assign digit00 = digit0[0];
  assign digit01 = digit0[1];
  assign digit02 = digit0[2];
  assign digit03 = digit0[3];
  assign digit04 = digit0[4];
  assign digit05 = digit0[5];
  assign digit06 = digit0[6];

  assign digit10 = digit1[0];
  assign digit11 = digit1[1];
  assign digit12 = digit1[2];
  assign digit13 = digit1[3];
  assign digit14 = digit1[4];
  assign digit15 = digit1[5];
  assign digit16 = digit1[6];

  assign digit20 = digit2[0];
  assign digit21 = digit2[1];
  assign digit22 = digit2[2];
  assign digit23 = digit2[3];
  assign digit24 = digit2[4];
  assign digit25 = digit2[5];
  assign digit26 = digit2[6];

  assign digit30 = digit3[0];
  assign digit31 = digit3[1];
  assign digit32 = digit3[2];
  assign digit33 = digit3[3];
  assign digit34 = digit3[4];
  assign digit35 = digit3[5];
  assign digit36 = digit3[6];
  
  assign displayarry = {digit3, digit2, digit1, digit0};
  
  
  


endmodule