`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:52 11/27/2023 
// Design Name: 
// Module Name:    IFIDRegister 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IFIDRegister(clk, pc, instruction, hit, instruction_out, pc_out, hit_out
    );
	 input clk;
	 input [63:0] pc;
	 input [31:0] instruction;
	 input hit;
	 
	 output reg [31:0] instruction_out;
	 output reg [63:0] pc_out;
	 output hit_out;
	 
	 always @ (negedge clk) begin 
		 if(hit) begin
			 instruction_out = instruction;
			 pc_out = pc;
		 end
	 end
	 
	 assign hit_out = hit;


endmodule
