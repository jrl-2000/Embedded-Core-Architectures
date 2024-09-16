`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Final Exam Question # 3: Custom Instruction
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 18.1
Top Module 1 / (1-X) Testbench
*/ 
module oneOver_TB (
);

reg clk = 1'b1;
reg reset = 1'b0;
reg start = 1'b0;
reg [7:0] data_x;
reg clk_en = 1'b1;

wire done;
wire [15:0]  result;


// Simulate CLK with EN
always #1 begin
    if (clk_en) begin
        clk = ~clk;
    end
end


oneOver_Top DUT(
    .clk(clk),
    .clk_en(clk_en),
    .reset(reset),
    .start(start),
    .data_x(data_x),
    .done(done),
    .result(result)
);


initial begin
    data_x = 8'd99;
    @(posedge clk)
    start = 1'b1;
    @(posedge clk)
    start = 1'b0;
    #30;

    data_x = 8'd98;
    @(posedge clk)
    start = 1'b1;
    @(posedge clk)
    start = 1'b0;
    #30;


    data_x = 8'd155;
    @(posedge clk)
    start = 1'b1;
    @(posedge clk)
    start = 1'b0;
    #30;
    $stop();
end
endmodule