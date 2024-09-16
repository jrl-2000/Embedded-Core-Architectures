`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 3: Embedded processor hardware and software
Simualtor: Mentor Graphics/Siemens Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 22.1 Lite Edition
Description: Datapath Module of a Flash Memory Interface
*/
module Flash_Intf_Datapath(
    input start,
    input write_buffer,
    input read_buffer,
    input [15:0] data,
    input [7:0] address,
    output get_data,
    output reg [15:0] data_cpu,
    output reg interupt = 1'b0
);
// Buffer
reg [15:0] buffer [0:255];


always @(address, write_buffer, read_buffer, data) begin
    if (address != 8'hFF && write_buffer && !read_buffer) begin
        buffer[address] <= data;
    end
    else if (address == 8'hFF && write_buffer && !read_buffer) begin
        buffer[255] <= data;
        interupt <= 1'b1;
    end
end

always @(address, read_buffer, write_buffer) begin
    if (address != 8'hFF && read_buffer && !write_buffer) begin
        data_cpu <= buffer[address];
    end
    else if (address == 8'hFF && read_buffer && !write_buffer) begin
        data_cpu <= buffer[255];
        interupt <= 1'b0;
    end
end

assign get_data = (start) ? 1'b1 : 1'b0;
endmodule