`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 3: Embedded processor hardware and software
Simualtor: Mentor Graphics/Siemens Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 22.1 Lite Edition
Description: Controller Module of a Flash Memory Interface
*/
module eSAYEH_CPU(
    input clk,
    input rst_n,
    output reg start = 1'b0,
    output reg ack = 1'b0,
    output reg [15:0] address_bus,
    output reg [15:0] data_bus_out,
    output [15:0] data_bus_in,
    output reg ReadMem = 1'b0,
    output reg WriteMem = 1'b0,
    output WriteIO,
    output reg ReadIO = 1'b0
);

reg [15:0] pc = 16'h0000;
integer j;

wire get_data;
wire [7:0] address;

wire [15:0] data;
wire [15:0] data_cpu;

wire interupt;

always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        pc <= 16'h0200;
    end
    else begin
        pc <= pc + 1'b1;
    end
end

always @(posedge clk) begin
    if (pc == 16'h0200) begin
        // Execute user program
        // Write data to address 0x5000
        address_bus <= 16'h5000;
        
        data_bus_out <= 16'hFFFF;
        WriteMem <= 1'b1;
        @(posedge clk);
        WriteMem <= 1'b0;
        @(posedge clk);
        pc <= 16'h54F0;
        //wait 16 CC
    end
    
    if (pc == 16'h5500) begin
        address_bus <= 16'h5500;
        start <= 1'b1;
        // The flash I/O interface begins with a start signal which can easily be generated
        // when the CPU makes a write to location 0X5500
        data_bus_out <= 16'hFFFF;
        WriteMem <= 1'b1;
        @(posedge clk);
        //@(posedge clk);
        WriteMem <= 1'b0;
        start = 1'b0;
    end
    if (interupt) begin
        address_bus <= 16'h5001; // or 5501 HW sheet has 2 different addresses
        data_bus_out <= 16'hFFFF;
        WriteMem <= 1'b1;
        ack <= 1'b1;
        ReadIO <= 1'b1;  
        @(posedge clk);
        address_bus <= 16'h0900;
        for (j = 255 ; j >= 0 ; j = j - 1'b1)begin
            data_bus_out <= data_cpu;
            WriteMem <= 1'b1;
            @(posedge clk);
            address_bus <= address_bus + 1'b1;
        end
        WriteMem <= 1'b0;
        ReadIO <= 1'b0;
        ack <= 1'b0;
    end
end

// Memory
Memory MEM_0 (
    .clk(clk),
    .WriteMem(WriteMem),
    .ReadMem(ReadMem),
    .address_bus(address_bus),
    .data_bus_in(data_bus_out),
    .data_bus_out(data_bus_in)
);
// Flash Controller
Flash_Intf_Controller CNTRLR_0(
    .clk(clk),
    .rst_n(rst_n),
    .get_data(get_data),
    .ack(ack),
    .address(address),
    .data(data)

);

// Flash Datapath
Flash_Intf_Datapath DP_0(
    .start(start),
    .write_buffer(WriteIO),
    .read_buffer(ReadIO),
    .data(data),
    .address(address),
    .get_data(get_data),
    .data_cpu(data_cpu),
    .interupt(interupt)
);


assign WriteIO = (address_bus == 16'h5500) ? 1'b1 : 1'b0;

    
endmodule
