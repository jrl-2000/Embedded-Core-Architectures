`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Final Exam Question # 3: Custom Instruction
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 18.1
Top Module 1 / (1-X)
*/ 
module oneOver_Top (
    input clk,
    input clk_en,
    input reset,
    input start,
    input [7:0] data_x,
    output done,
    output wire [15:0] result
);

wire [7:0]  LUT_Bus_Frac;
wire [7:0] LUT_Bus_Int;
wire LUT_Bus_Ready;


CNTRLR CNTRLR_0(
    .clk(clk),
    .reset(reset),
    .start(start),
    .data_x(data_x),
    .LUT_Bus_Frac(LUT_Bus_Frac),
    .LUT_Bus_Int(LUT_Bus_Int),
    .LUT_Bus_Ready(LUT_Bus_Ready),
    .done (done),
    .result(result)
);


Datapath DP_0(
    .data_x(data_x),
    .LUT_Bus_Ready(LUT_Bus_Ready),
    .frac_result(LUT_Bus_Frac),
    .integer_part(LUT_Bus_Int)
);

    
endmodule