`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Final Exam Question # 1
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Top Module testbench
*/
module top_TB (
);

reg clk = 1'b1;
reg rst = 1'b0;
reg start = 1'b0;
reg [16:0] data_x;


wire done;
wire [31:0] result;


Top DUT(
    .clk(clk),
    .rst(rst),
    .data_x(data_x),
    .start(start),
    .done(done),
    .result(result)
);

// Simulate CLK
always #1
clk = ~clk;


initial begin
    data_x = 17'd14566;
    @(posedge clk)
    start = 1'b1;
    @(posedge clk)
    start = 1'b0;
    #30;

    data_x = 17'd1987;
    @(posedge clk)
    start = 1'b1;
    @(posedge clk)
    start = 1'b0;
    #30;
    $stop();
end

    
endmodule