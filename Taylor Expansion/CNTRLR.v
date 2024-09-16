`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Final Exam Question # 3: Custom Instruction
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 18.1
Controller Module 1 / (1-X)
*/ 
module CNTRLR (
    input clk,
    input reset,
    input start,
    input [7:0] data_x,
    input [7:0] LUT_Bus_Frac,
    input [7:0] LUT_Bus_Int,
    output reg LUT_Bus_Ready,
    output reg done,
    output reg [15:0] result
);

integer state = 0;
integer state_next = 0;

localparam ST_RST = 0;
localparam ST_WAIT_START = 1;
localparam ST_APPROX_0 = 2;
localparam ST_APPROX_1 = 3;
localparam ST_APPROX_2 = 4;
localparam ST_APPROX_3 = 5;


reg [15:0] exp2_x;
reg [15:0] exp3_x;
reg [15:0] exp4_x;

reg [7:0] frac_result;
reg [7:0] integer_part;


// Always Block for Updating State Machine
always @(posedge clk, posedge reset) begin
    if (reset) begin
        state <= ST_RST;
    end
    else begin
        state <= state_next;
    end
end

always @(state, start) begin
    state_next <= state;
    case (state)
        ST_RST: begin
            exp2_x <= 16'd0;
            state_next <= ST_WAIT_START;
        end
        ST_WAIT_START: begin
            if (start) begin
                done <= 1'b0;
                LUT_Bus_Ready <= 1'b0;
                result <= 16'd0;
                state_next <= ST_APPROX_0;
            end
        end
        ST_APPROX_0: begin
            exp2_x = data_x * data_x;
            state_next <= ST_APPROX_1;
        end
        ST_APPROX_1: begin
            exp3_x = exp2_x * data_x;
            LUT_Bus_Ready <= 1'b1;
            state_next <= ST_APPROX_2;
        end
        ST_APPROX_2: begin
            exp4_x = exp3_x * data_x;
            frac_result <= LUT_Bus_Frac;
            integer_part <= LUT_Bus_Int;
            state_next <= ST_APPROX_3;
        end
        ST_APPROX_3: begin
            result <= {integer_part, frac_result};
            state_next <= ST_WAIT_START;
        end
    endcase
end    
endmodule