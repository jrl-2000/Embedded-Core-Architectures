`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Final Exam Question # 1
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Datapath for Tanh(x)
*/
module Datapath (
input [2:0] addr,
input [31:0] result_ready,
output reg [16:0] LUT,
output reg [31:0] result
);


// LUT
always @(addr) begin
case (addr)
    3'd0: begin
        LUT = 17'b1_0000000000000000;
        end
    3'd1: begin
        LUT = 17'b0_0101010101010101;
    end
    3'd2: begin
        LUT = 17'b0_00100100100100101;
    end
    3'd3: begin
        LUT = 17'b0_00001101111001101;
    end
    3'd4: begin
        LUT = 17'b0_00000010000100111;
    end
    3'd5: begin
        LUT = 17'b0_00000000000110011;
    end
    3'd6: begin
        LUT = 17'b0_00000000000001011;
    end
    3'd7: begin
        LUT = 17'b0_00000000000000101;
    end       
endcase
end

always @(result_ready) begin
    result <= result_ready;
end


endmodule