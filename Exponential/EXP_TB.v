`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 6: Custom Instruction
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 18.1
Top Module Testbench for Exponent
*/
module EXP_TB (
);
    


reg clk = 1'b1;
reg reset = 1'b0;
reg start = 1'b0;

reg [7:0] data_x;

wire [19:0] result;

wire done;

// Simulate CLK
always #1
clk = ~clk;

EXP_top UUT(
    .clk(clk),
    .reset(reset),
    .start(start),
    .data_x(data_x),
    .done(done),
    .result(result)
);

initial begin
    data_x = 8'h63;
    @(posedge clk)
    start = 1'b1;
    @(posedge clk)
    start = 1'b0;
    #20;

    data_x = 8'hFF;
    @(posedge clk)
    start = 1'b1;
    @(posedge clk)
    start = 1'b0;

    #200;
    $stop();
end
endmodule