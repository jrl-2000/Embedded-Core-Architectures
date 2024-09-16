`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 1: RTL Design and Simulation
Simualtor: Mentor Graphics Questa Intel FPGA Starter Editon 2023.1
Sequence Detector for '11010'
*/
module SequenceDetector(
    input clk,
    input rst_n,
    input j,
    input Co,
    output reg w = 1'b0,
    output reg init0 = 1'b0,
    output reg cen = 1'b0
);

// State Machine Parameters
// Sythesizer will take care of the size of the integers and optimize them
integer state = 0;          
integer state_next;

localparam ST_RST = 0;
localparam ST_FIRST_NUM = 1;
localparam ST_SEC_NUM = 2;
localparam ST_THIRD_NUM = 3;
localparam ST_FORTH_NUM = 4;
localparam ST_FIFTH_NUM = 5;
localparam ST_WAIT = 6;

// Always Block for Updating State Machine
always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        state <= ST_RST;
    end
    else begin
        state <= state_next;
    end
end

// Main State Machine for Sequence Detecting
always @(state, j, posedge Co) begin
    state_next = state;
    case (state)   
        ST_RST: begin
            w <= 1'b0;
            cen <= 1'b0;
            init0 <= 1'b0;
            state_next <= ST_FIRST_NUM;        
        end
        ST_FIRST_NUM: begin
            if (j == 1'b1) begin
                state_next <= ST_SEC_NUM;
            end
            else begin
                state_next <= ST_FIRST_NUM;
            end
        end
        ST_SEC_NUM: begin
            if (j == 1'b1) begin
                state_next <= ST_THIRD_NUM;
                
            end
            else begin
                state_next <= ST_FIRST_NUM;
            end
        end
        ST_THIRD_NUM: begin
            if (j == 1'b0) begin
                state_next <= ST_FORTH_NUM;
                init0 <= 1'b1;
            end
            else begin
                state_next <= ST_FIRST_NUM;
            end
        end
        ST_FORTH_NUM: begin
            if (j == 1'b1) begin
                state_next <= ST_FIFTH_NUM;
                init0 <= 1'b0;
            end
            else begin
                state_next <= ST_FIRST_NUM;
            end
        end
        ST_FIFTH_NUM: begin
            if (j == 1'b0) begin
                state_next <= ST_WAIT;
                cen <= 1'b1;
                w <= 1'b1;
            end
            else begin
                state_next = ST_THIRD_NUM; // could also start here based on the FORTH result
            end
        end
        ST_WAIT: begin
            if (Co) begin
                state_next <= ST_FIRST_NUM;
                cen <= 1'b0;
                w <= 1'b0;
            end
        end
    endcase
end   
endmodule