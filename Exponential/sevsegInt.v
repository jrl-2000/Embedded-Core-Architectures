`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 6: Custom Instruction
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 18.1
Exponent Datapath Seven Seg
*/
module sevsegInt (
    input [3:0] result,
	 output [6:0] displayarry_int
 
);


// Display 0
  wire digit00;
  wire digit01;
  wire digit02;
  wire digit03;
  wire digit04;
  wire digit05;
  wire digit06;
  
  reg [6:0] digit0;
  
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

	 
  assign digit00 = digit0[0];
  assign digit01 = digit0[1];
  assign digit02 = digit0[2];
  assign digit03 = digit0[3];
  assign digit04 = digit0[4];
  assign digit05 = digit0[5];
  assign digit06 = digit0[6];
  
  assign displayarry_int = digit0;
  
endmodule