`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:58 11/27/2023 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(opcode, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp

    );
	 
	 input [10:0] opcode;
	 output ALUSrc;
	 output MemtoReg;
	 output RegWrite;
	 output MemRead;
	 output MemWrite;
	 output Branch;
	 output [1:0] ALUOp;
	 
	 reg [7:0] out;
	 
	 always @(*) begin
		 if(opcode == 11'b11111000010)
			out = 8'b11110000;
		 else if(opcode == 11'b11111000000)
			out = 8'b1X001000;
		 else if(opcode[10:3] == 8'b10110100)
			out = 8'b0X000101;
		 else
			out = 8'b00100010;
	 end



	 assign ALUSrc = out[7];
	 assign MemtoReg = out[6];
	 assign RegWrite = out[5];
	 assign MemRead = out[4];
	 assign MemWrite = out[3];
	 assign Branch = out[2];
	 assign ALUOp = out[1:0];

endmodule
