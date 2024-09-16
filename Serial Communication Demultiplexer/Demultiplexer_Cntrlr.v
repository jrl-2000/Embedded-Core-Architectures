`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 2: RTL Design- Quartus Synthesis
Simualtor: Mentor Graphics Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 22.1 Lite Edition
Description: Controller Module
*/

module Demultiplexer_Cntrlr(
    input clk,
    input rst_n,
    input serIn,
    output reg [1:0] destination,
    output reg dataCom
);

integer state;
integer state_next;

integer i = 7;

reg [3:0] counter = 5'd0;
//reg [1:0] destination_0; 
localparam ST_RST = 0;
localparam ST_START = 1;
localparam ST_DESTINATION_1 = 2;
localparam ST_DESTINATION_2 = 3;
localparam ST_TRANSMISSION = 4;
localparam ST_SPACER = 5;


// Always Block for Updating State Machine
always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        state <= ST_RST;
    end
    else begin
        state <= state_next;
    end
end

always @(negedge serIn, state) begin
    state_next <= state;
    case (state)
        ST_RST: begin
            destination <= 2'bZ; // Set destination to tristate logic to not select any ports yet
            counter <= 5'd0;
            dataCom <= 1'b0;
            i <= 7;
            if (serIn) begin
                state_next <= ST_START;
            end
        end
        ST_START: begin
            if (!serIn) begin
                state_next <= ST_DESTINATION_1;
            end
        end
        ST_DESTINATION_1: begin
            destination[0] <= serIn;
            state_next <= ST_DESTINATION_2;
        end
        ST_DESTINATION_2 : begin
            destination[1] <= serIn;
            state_next <= ST_TRANSMISSION;
        end
        ST_TRANSMISSION: begin
            dataCom <= 1'b1;
            for (i = 7; i >= 0; i = i - 1) begin
                counter <= counter + 1'b1;
                @(posedge clk);
            end
            if (counter == 4'd8) begin
                state_next <= ST_SPACER;
            end         
        end
        ST_SPACER: begin
            dataCom <= 1'b0;
            if (!serIn) begin
                state_next <= ST_TRANSMISSION;
                counter <= 5'd0;
            end
            else begin
                state_next <= ST_RST;
            end
        end
    endcase
end


    
endmodule
