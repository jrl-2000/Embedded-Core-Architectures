`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Midterm Fall 2023 Question # 2
Simualtor: Mentor Graphics/Siemens Questa Intel FPGA Starter Editon 2021.2
Description: 48-bit Sequential Adder Top Module
*/

module SA48(
    input clk,
    input rst_n,
    input [11:0] inBusA,
    input [11:0] inBusB,
    input startChunks,
    output resultReady,
    output [47:0] outBus
);

wire shiftNext;

// Controller Instantiation
SA48_Controller CNTRLR_0(
    .clk(clk),
    .rst_n(rst_n),
    .startChunks(startChunks),
    .resultReady(resultReady),
    .shiftNext(shiftNext)
);

// Datapath Instantiation
SA48_Datapath DP_0(
    .clk(clk),
    .rst_n(rst_n),
    .inBusA(inBusA),
    .inBusB(inBusB),
    .shiftNext(shiftNext),
    .outBus(outBus)
);

    
endmodule
