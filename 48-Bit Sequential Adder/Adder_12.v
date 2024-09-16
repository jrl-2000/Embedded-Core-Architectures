`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Midterm Fall 2023 Question # 2
Simualtor: Mentor Graphics/Siemens Questa Intel FPGA Starter Editon 2021.2
Description: 12-bit unsigned adder
*/

module Adder_12(
    input [11:0] A,
    input [11:0] B,
    output reg [11:0] Result
);

always @(*) begin
    Result <= A + B;

end
   
endmodule
