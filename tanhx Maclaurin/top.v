`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Final Exam Question # 1
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Top Moduel for Tanh(x)
*/
module Top (
    input clk,
    input rst,
    input [16:0] data_x,
    input start,
    output done,
    output [31:0] result
);

wire [2:0] addr;
wire [16:0] LUT_BUS;
wire [31:0] result_ready;

CNTRLR CNTRLR(
    .clk(clk),
    .rst(rst),
    .start(start),
    .LUT(LUT_BUS),
    .data_x(data_x),
    .addr(addr),
    .done(done),
    .result_ready(result_ready)
);

Datapath Datapath(
    .addr(addr),
    .result_ready(result_ready),
    .LUT(LUT_BUS),
    .result(result)
);

endmodule