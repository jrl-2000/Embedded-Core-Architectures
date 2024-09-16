`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 1: RTL Design and Simulation
Simualtor: Mentor Graphics Questa Intel FPGA Starter Editon 2023.1
Testbench for Top Level Design 
*/
module HW1TB(
);

// Regs
reg clk = 1'b1;
reg rst_n = 1'b1;
reg j;
reg [31:0] Data_Stream = 32'd0;

wire w;

integer i = 31;

// Unit Under Test
HW1Top UUT(
    .clk(clk),
    .rst_n(rst_n),
    .j(j),
    .w(w)
);

// This task is for clocking in data to the input port j
task SERIAL_DATA_J;
    input [31:0] Data;
    begin
        for (i = 31; i >= 0; i = i - 1) begin
            j = Data[i];
            @(posedge clk);
        end
    end
endtask

// Simulate CLK
always #1
clk = ~clk;

initial begin
    rst_n = 1'b1;
    j = 1'b0;
    @(posedge clk);
    rst_n = 1'b0;
    @(posedge clk);
    rst_n = 1'b1;
    Data_Stream = 32'b0000_1101_0001_1010_0000_1111_0000_0000;
    SERIAL_DATA_J(Data_Stream);
    @(posedge clk);
    // This test has a bated 11011 with the start of a 11010 as the last 2 1's. Also contains  later 11010 to test ignorance
    Data_Stream = 32'b1101_1010_1111_1101_1010_0001_1010_1111;
    SERIAL_DATA_J(Data_Stream);
    #20;
    $finish;
end
endmodule