`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Midterm Fall 2023 Question # 2
Simualtor: Mentor Graphics/Siemens Questa Intel FPGA Starter Editon 2021.2
Description: 48-bit Sequential Adder Controller Module
*/

module SA48_Controller(
    input clk,
    input rst_n,
    input startChunks,
    output reg resultReady,
    output reg shiftNext
);

integer state;
integer state_next;

localparam ST_IDLE = 0;
localparam ST_PULSE = 1;
localparam ST_CC1 = 2;
localparam ST_CC2 = 3;
localparam ST_CC3 = 4;
localparam ST_CC4 = 5;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= ST_IDLE;
    end
    else begin
        state <= state_next;
    end
end

always @(state, startChunks) begin
    
    case (state)
        ST_IDLE: begin
            resultReady <= 1'b1;
            if (startChunks) begin
                state_next <= ST_PULSE;
            end
        end
        ST_PULSE: begin
            if (!startChunks) begin
                state_next <= ST_CC1;
            end
        end
        ST_CC1: begin
            
            state_next <= ST_CC2;
        end
        ST_CC2: begin
            state_next <= ST_CC3;
        end
        ST_CC3: begin
            state_next <= ST_CC4;
        end
        ST_CC4: begin
           state_next <= ST_IDLE; 
        end
    endcase
end
// too touchy with start chunks
always @(state) begin
    resultReady <= 1'b0;
    shiftNext <= 1'b0;
    case (state)
        ST_IDLE: begin
            resultReady <= 1'b1;
        end
        ST_PULSE: begin
            
        end
        ST_CC1: begin
            shiftNext <= 1'b1;
        end
        ST_CC2: begin
            shiftNext <= 1'b1;
        end
        ST_CC3: begin
            shiftNext <= 1'b1;
        end
        ST_CC4: begin
            shiftNext <= 1'b1;
        end
    endcase    
end
endmodule