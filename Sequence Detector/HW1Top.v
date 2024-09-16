`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 1: RTL Design and Simulation
Simualtor: Mentor Graphics Questa Intel FPGA Starter Editon 2023.1
Top Module
*/
module HW1Top(      
    input clk,              // CLK for clocking in data ti input j on thge posedge
    input rst_n,            // A-synchronous reset
    input j,                // Input j to look for sequence 11010
    output w                 // Asserted when 11010 is found
);

// Wires
wire Co;
wire cen;
wire init0;

// Sequence Detector Instantiation
SequenceDetector SD0(
    .clk(clk),
    .rst_n(rst_n),          
    .j(j),
    .Co(Co),
    .w(w),
    .init0(init0),
    .cen(cen)
);

// Counter Instantiation
Counter Cntr0(
    .clk(clk),
    .rst_n(rst_n),
    .init0(init0),
    .cen(cen),
    .Co(Co)
);
endmodule