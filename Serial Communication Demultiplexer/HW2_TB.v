`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 2: RTL Design- Quartus Synthesis
Simualtor: Mentor Graphics Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 22.1 Lite Edition
Description: Testbench for whole design
*/

module HW2_TB(
);


reg clk = 1'b1;
reg rst_n = 1'b1;
reg serIn = 1'b1;

reg [7:0] Data_0;
reg [7:0] Data_1;

reg [1:0] p0 = 2'b00;
reg [1:0] p1 = 2'b01;
reg [1:0] p2 = 2'b10;
reg [1:0] p3 = 2'b11;

wire valid;

wire port0;
wire port1;
wire port2;
wire port3;

integer i;
integer j;

// pullup(port0);
// pullup(port1);
// pullup(port2);
// pullup(port3);

// UUT Instantiation
HW2Top UUT(
    .clk(clk),
    .rst_n(rst_n),
    .serIn(serIn),
    .valid(valid),
    .port0(port0),
    .port1(port1),
    .port2(port2),
    .port3(port3)
);

// Simulate CLK
always #1
clk = ~clk;

task CLOCK_IN_SERIAL_INPUT_DATA;
    input [7:0] Data_0;
    input [7:0] Data_1;
    input [1:0] Port;
    begin
        serIn = 1'b0; // Start bit
        @(posedge clk);
        serIn = Port[0];
        @(posedge clk);
        serIn = Port[1];
        @(posedge clk);
        for (i = 7; i >= 0; i = i - 1) begin
            serIn = Data_0[i];
            @(posedge clk);
        end
        if (Data_1) begin
            serIn = 1'b0;
            @(posedge clk);
            for (j = 7; j >= 0; j = j - 1) begin
                serIn = Data_1[j];
                @(posedge clk);
            end
        end
        else begin // end
            serIn = 1'b1;
        end
    end
endtask

initial begin
    rst_n = 1'b1;
    @(posedge clk);
    rst_n = 1'b0;
    @(posedge clk);
    rst_n = 1'b1;
    @(posedge clk);

    // Port 0 Test: 1 Chunk
    Data_0 = 8'b1010_1010;
    Data_1 = 8'bX;
    //CHANGE PORT TO SELECT WHICH ONE
    CLOCK_IN_SERIAL_INPUT_DATA(Data_0, Data_1, p3);
    #20;

    // Port 0 Test: 2 Chunks
    Data_0 = 8'b1111_1100;
    Data_1 = 8'b0110_0111;
    @(posedge clk);
    //CHANGE PORT TO SELECT WHICH ONE
    CLOCK_IN_SERIAL_INPUT_DATA(Data_0, Data_1, p3);
    #20;

    #200;
    $finish;
end
endmodule
