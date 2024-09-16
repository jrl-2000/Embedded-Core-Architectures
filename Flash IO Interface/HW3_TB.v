`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 3: Embedded processor hardware and software
Simualtor: Mentor Graphics/Siemens Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 22.1 Lite Edition
Description: Top Module Testbench
*/
module HW3_TB(
);

reg clk = 1'b1;
reg rst_n = 1'b1;



//Simulate CLK
always #1
clk = ~clk;


// UUT Instantiation
eSAYEH_CPU UUT(
    .clk(clk),
    .rst_n(rst_n)//,
    // .start(start),
    // .ack(ack),
    // .address_bus(address_bus),
    // .data_bus_out(data_bus_out),
    // .data_bus_in(data_bus_in),
    // .ReadMem(ReadMem),
    // .WriteMem(WriteMem),
    // .WriteIO(WriteIO),
    // .ReadIO(ReadIO)
);

initial begin
    rst_n = 1'b1;
    #2;
    rst_n = 1'b0;
    #2;
    rst_n = 1'b1;
    #1000;
    //$finish;

    
end


endmodule
