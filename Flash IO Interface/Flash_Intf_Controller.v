`timescale 1ns/1ps
/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Homework 3: Embedded processor hardware and software
Simualtor: Mentor Graphics/Siemens Questa Intel FPGA Starter Editon 2021.2
Synthesizer: Intel Quartus Prime 22.1 Lite Edition
Description: Controller Module of a Flash Memory Interface
*/
module Flash_Intf_Controller(
    input clk,
    input rst_n,
    input get_data,
    input ack,
    output reg [7:0] address,
    output reg [15:0] data
);

// State Localparams
localparam ST_RST = 0;
localparam ST_START = 1;
localparam ST_ACK = 2;


integer state;
integer state_next;
integer i;

always @(posedge clk, negedge rst_n) begin
    if (!rst_n) begin
        state <= ST_RST;
    end
    else begin
        state <= state_next;
    end
end

always @(state, ack, get_data) begin
    case (state)
        ST_RST: begin
            // Reset Variables here
            address <= 8'dZ;
            state_next <= ST_START;
        end
        ST_START: begin
            if (get_data) begin
                address <= 8'd0;
                for (i = 255; i >= 0; i = i - 1'b1)begin
                    data <= $random;
                    address = address + 1'b1;
                    @(posedge clk);
                end
            address <= 1'b0;
            state_next <= ST_ACK; 
            end
        end
        ST_ACK: begin
            if(ack) begin
                //address <= 1'b0;
                for (i = 255 ; i >=0 ; i = i - 1'b1)begin
                    address <= address + 1'b1;
                    @(posedge clk);
                end
            state_next <= ST_RST;
            end
        end
    endcase
end


endmodule
