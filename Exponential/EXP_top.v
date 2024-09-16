`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 6: Custom Instruction
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 18.1
Top Module
*/
module EXP_top (
    input clk,
    input clk_en,
    input reset,
    input start,
    input [7:0] data_x,
    output done,
    output wire [19:0] result
);

EXP_CNTRLR CNTRLR(
    .clk(clk),
    .reset(reset),
    .start(start),
    .data_x(data_x),
    .done(done),
    .result(result)
);



endmodule