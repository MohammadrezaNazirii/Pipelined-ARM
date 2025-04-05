`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:52 11/13/2023 
// Design Name: 
// Module Name:    Decode 
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
module Decode(clk, instruction, write_reg, write_data, RegWrite, opcode, read_data1, read_data2, sign_extended_immediate, dest_reg
    );
	 input clk;
	 input [31:0] instruction;
	 input [4:0] write_reg;
	 input [63:0] write_data;
	 input RegWrite;
	 
	 
	 output [63:0] read_data1;
	 output [63:0] read_data2;
	 output [63:0] sign_extended_immediate;
	 output [10:0] opcode;
	 output [4:0] dest_reg;
	 
	 wire [4:0] read2 = instruction[28] ? instruction[4:0] : instruction[20:16];
	 
	 RegisterFile registerFile (
		 .clk(clk), 
		 .RegWrite(RegWrite), 
		 .read_reg1(instruction[9:5]), 
		 .read_reg2(read2), 
		 .write_reg(write_reg), 
		 .write_data(write_data), 
		 .read_data1(read_data1), 
		 .read_data2(read_data2)
		 );
		 
	 SignExtend signExtend (
		 .instruction(instruction[31:0]), 
		 .out(sign_extended_immediate)
		 );
		 
	 assign opcode = instruction[31:21];
	 assign dest_reg = instruction[4:0];


endmodule
