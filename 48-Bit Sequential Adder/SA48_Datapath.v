`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Midterm Fall 2023 Question # 2
Simualtor: Mentor Graphics/Siemens Questa Intel FPGA Starter Editon 2021.2
Description: 48-bit Sequential Adder Datapath Module
*/
module SA48_Datapath(
    input clk,
    input rst_n,
    input [11:0] inBusA,
	input [11:0] inBusB,
    input shiftNext,
    output reg [47:0] outBus
);

wire [11:0] Result;

always @(posedge clk) begin
    if (!rst_n) begin
        outBus <= 48'd0;
    end
    else if (shiftNext) begin
        // shift in the answers
        outBus <= {Result, outBus[47:12]};
    end
    else begin
        outBus <= outBus;
    end
end


// Adder_12 Instantiation
Adder_12 ADD_0(
    .A(inBusA),
    .B(inBusB),
    .Result(Result)
);
 
endmodule