`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 2: RTL Design- Quartus Synthesis
Simualtor: Mentor Graphics Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 22.1 Lite Edition
Description: Top Module for Demultiplexer
*/

module HW2Top(
    input clk,
    input rst_n,
    input serIn,
    output valid,
    output port0,
    output port1,
    output port2,
    output port3
);

// Wires
wire [1:0] destination;
wire dataCom;

// Datapath Instatiation
Demultiplexer_Datapath DP_0(
    .rst_n(rst_n),
    .serIn(serIn),
    .destination(destination),
    .dataCom(dataCom),
    .p0(port0),
    .p1(port1),
    .p2(port2),
    .p3(port3),
    .valid(valid)
);

// Controller Instantiation
Demultiplexer_Cntrlr CNTRLR_0(
    .clk(clk),
    .rst_n(rst_n),
    .serIn(serIn),
    .destination(destination),
    .dataCom(dataCom)
);

endmodule