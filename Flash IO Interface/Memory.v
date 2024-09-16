`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 3: Embedded processor hardware and software
Simualtor: Mentor Graphics/Siemens Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 22.1 Lite Edition
Description: Memory
*/
module Memory(
    input clk,
    input WriteMem,
    input ReadMem,
    input [15:0] address_bus,
    input [15:0] data_bus_in,
    output reg [15:0] data_bus_out
    

);

// Block of memory
// 16 bits wide with 16 bits worth of addresses

// 16 bits wide and addresses 0x0000 to 0x8000
// 0x8000 = 32768d
reg [15:0] memory [0:32768];

always @(posedge clk, WriteMem, ReadMem) begin
    if (WriteMem && !ReadMem) begin
        memory[address_bus] <= data_bus_in;
    end
    else if (!WriteMem && ReadMem) begin
        data_bus_out <= memory [address_bus];
    end
    
end



    


    
endmodule

