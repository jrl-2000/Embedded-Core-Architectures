`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 2: RTL Design- Quartus Synthesis
Simualtor: Mentor Graphics Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 22.1 Lite Edition
Description: Datapath Module
*/

module Demultiplexer_Datapath(
    input rst_n,
    input serIn,
    input [1:0] destination,
    input dataCom,
    output reg p0,              //Port 0
    output reg p1,              //Port 1
    output reg p2,              //Port 2
    output reg p3,              //Port 3
    output reg valid
);

always @(dataCom) begin
    valid <= dataCom;
end    

always @(serIn, dataCom) begin
    p0 <= (destination == 2'b00 && dataCom == 1'b1) ? serIn: 1'b0;
    p1 <= (destination == 2'b01 && dataCom == 1'b1) ? serIn: 1'b0;
    p2 <= (destination == 2'b10 && dataCom == 1'b1) ? serIn: 1'b0;
    p3 <= (destination == 2'b11 && dataCom == 1'b1) ? serIn: 1'b0;     
end
endmodule