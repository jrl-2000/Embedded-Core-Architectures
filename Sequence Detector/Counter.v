`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 1: RTL Design and Simulation
Simualtor: Mentor Graphics Questa Intel FPGA Starter Editon 2023.1
Counter for 16 Clock cycles
*/
module Counter(
    input clk,
    input rst_n,
    input init0,
    input cen,
    output reg Co = 1'b0
);

reg [4:0] counter;

always @(posedge init0, negedge rst_n) begin
    counter <= 5'd0;
end

always @(posedge clk) begin
    if (cen) begin
        if (counter == 5'd16) begin
            Co <= 1'b1;
        end
        else begin
            counter = counter + 1'b1; // No more ++ that was SytemVerilog only :(
            Co <= 1'b0;
        end
    end
end
endmodule