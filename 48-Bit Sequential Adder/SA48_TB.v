`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Midterm Fall 2023 Question # 2
Simualtor: Mentor Graphics/Siemens Questa Intel FPGA Starter Editon 2021.2
Description: 48-bit Sequential Adder Top Module Testnbench
*/

module SA48_TB(
);

reg clk = 1'b1;
reg rst_n = 1'b1;

reg [11:0] inBusA;
reg [11:0] inBusB;

reg startChunks;

wire resultReady;
wire [47:0] outBus;

SA48 UUT(
    .clk(clk),
    .rst_n(rst_n),
    .inBusA(inBusA),
    .inBusB(inBusB),
    .startChunks(startChunks),
    .resultReady(resultReady),
    .outBus(outBus)
);

// Simulate CLK
always #1 clk = ~clk;

initial begin
    rst_n = 1'b1;
    startChunks = 1'b0;

    @(posedge clk);
    rst_n = 1'b0;

    @(posedge clk);
    rst_n = 1'b1;

    @(posedge clk);
    startChunks = 1'b1;
    @(posedge clk);
    startChunks = 1'b0;

    @(posedge clk);


    inBusA = 12'd1;
    inBusB = 12'd1;
    @(posedge clk);
    inBusA = 12'd2;
    inBusB = 12'd2;
    @(posedge clk);
    inBusA = 12'd3;
    inBusB = 12'd3;
    @(posedge clk);
    inBusA = 12'd4;
    inBusB = 12'd4;

    #50;


    @(posedge clk);
    startChunks = 1'b1;
    @(posedge clk);
    startChunks = 1'b0;

    @(posedge clk);


    inBusA = 12'd1;
    inBusB = 12'd2;
    @(posedge clk);
    inBusA = 12'd0;
    inBusB = 12'd0;
    @(posedge clk);
    inBusA = 12'd0;
    inBusB = 12'd0;
    @(posedge clk);
    inBusA = 12'd0;
    inBusB = 12'd0;

    #50;



    @(posedge clk);
    startChunks = 1'b1;
    @(posedge clk);
    startChunks = 1'b0;

    @(posedge clk);


    inBusA = 12'd34;
    inBusB = 12'd66;
    @(posedge clk);
    inBusA = 12'd144;
    inBusB = 12'd255;
    @(posedge clk);
    inBusA = 12'd299;
    inBusB = 12'd29;
    @(posedge clk);
    inBusA = 12'd19;
    inBusB = 12'd2000;

    #100;
end
endmodule