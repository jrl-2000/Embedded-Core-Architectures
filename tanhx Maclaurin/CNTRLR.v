`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Final Exam Question # 1
Simualtor: Siemens (Mentor Graphics) Questa Intel FPGA Starter Editon 2021.2
Controller for Tanh(x)
*/
module CNTRLR (
    input clk,
    input rst, 
    input start,
    input[16:0] LUT,
    input [16:0] data_x,
    output reg [2:0] addr,
    output reg done,
    output reg [31:0] result_ready
);

integer state = 0;
integer state_next = 0;

localparam ST_RST = 0;
localparam ST_WAIT_START = 1;
localparam ST_tanh_0 = 2;
localparam ST_tanh_1 = 3;
localparam ST_tanh_2 = 4;
localparam ST_tanh_3 = 5;
localparam ST_tanh_4 = 6;
localparam ST_tanh_5 = 7;
localparam ST_tanh_6 = 8;
localparam ST_tanh_7 = 9;
localparam ST_tanh_8 = 10;
localparam ST_tanh_9 = 11;
localparam ST_tanh_10 = 12;
localparam ST_RESULT = 13;

reg [15:0] fractional;

reg Ci;
reg [16:0] C0, C1, C2, C3, C4, C5, C6, C7;
reg [31:0] Sum0, Sum1, Sum2, Sum3, Sum4, Sum5, Sum6, Sum7;
reg [31:0] sum_start; 
reg [40:0] exp_frac, sum_start_1;

// Always Block for Updating State Machine
always @(posedge clk, posedge rst) begin
    if (rst) begin
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
            result_ready <= 32'd0;
            done <= 1'b0;
            Ci <= 1'b0;
            fractional <= 16'd0;
            state_next <= ST_WAIT_START;
        end
        ST_WAIT_START: begin
            if (start) begin
                done <= 1'b0;
                result_ready <= 32'd0;
                done <= 1'b0;
                Ci <= 1'b0;
                fractional <= 16'd0;
                state_next <= ST_tanh_0;
            end
        end
        ST_tanh_0: begin
            Ci <= data_x[16];
            addr <= 3'd0;
            fractional <= data_x[15:0];
            state_next <= ST_tanh_1;
        end
        ST_tanh_1: begin
            C0 <= LUT;
            exp_frac = (fractional * fractional) >> 16;
            addr <= 3'd1;
            state_next <= ST_tanh_2;
        end 
        ST_tanh_2: begin
            C1 <= LUT;
            addr <= 3'd2;
            Sum0 = data_x;
            state_next <= ST_tanh_3;
        end
        ST_tanh_3: begin
            C2 <= LUT;
            addr <= 3'd3;
            sum_start_1 <= (Sum0 * exp_frac) >> 16;
            state_next <= ST_tanh_4;
        end
        ST_tanh_4: begin
            C3 <= LUT;
            addr <= 3'd4;
            Sum1 <= (sum_start_1 * C1) >> 16;
            state_next <= ST_tanh_5;
        end
        ST_tanh_5: begin
            C4 <= LUT;
            addr <= 3'd5;
            Sum2 <= ((C2 * ((Sum1 * exp_frac) >> 16)) >> 16);
            state_next <= ST_tanh_6;
        end
        ST_tanh_6: begin
            C5 <= LUT;
            addr <= 3'd6;
             Sum3 <= ((C3 * ((Sum2 * exp_frac) >> 16)) >> 16);
            state_next <= ST_tanh_7;
        end
        ST_tanh_7: begin
            C6 <= LUT;
            addr <= 3'd7;
             Sum4 <= ((C4 * ((Sum3 * exp_frac) >> 16)) >> 16);
            state_next <= ST_tanh_8;
        end
        ST_tanh_8: begin
            C7 <= LUT;
            Sum5 <= ((C5 * ((Sum4 * exp_frac) >> 16)) >> 16);
            state_next <= ST_tanh_9;
        end
        ST_tanh_9: begin
            Sum6 <= ((C6 * ((Sum5 * exp_frac) >> 16)) >> 16);
            state_next <= ST_tanh_10;
        end
        ST_tanh_10: begin
            Sum7 <= ((C7 * ((Sum6 * exp_frac) >> 16)) >> 16);
            state_next <= ST_RESULT;
        end
        ST_RESULT: begin
            result_ready <= Sum0 + Sum1 + Sum2 + Sum3 + Sum4 + Sum5 + Sum6 + Sum7;
            done <= 1'b1;
            state_next <= ST_WAIT_START;
        end
    endcase
end    

    
endmodule