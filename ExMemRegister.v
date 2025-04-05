`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:21 12/11/2023 
// Design Name: 
// Module Name:    ExMemRegister 
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
module ExMemRegister(clk, hit, branchTarget, zeroFlag, ALUResult, readData2, writeReg, MemRead, MemWrite, Branch, RegWrite, MemtoReg, hitOut, branchTargetOut, zeroFlagOut, ALUResultOut, readData2Out, writeRegOut, MemReadOut, MemWriteOut, BranchOut, RegWriteOut, MemtoRegOut
    );
	 input clk;
	 input hit;
	 input [63:0] branchTarget;
	 input zeroFlag;
	 input [63:0] ALUResult;
	 input [63:0] readData2;
	 input [4:0] writeReg;
	 input MemRead;
	 input MemWrite;
	 input Branch;
	 input RegWrite;
	 input MemtoReg;
	 
	 
	 output hitOut;
	 output reg [63:0] branchTargetOut = 0;
	 output reg zeroFlagOut = 0;
	 output reg [63:0] ALUResultOut = 0;
	 output reg [63:0] readData2Out = 0;
	 output reg [4:0] writeRegOut = 0;
	 output reg MemReadOut = 0;
	 output reg MemWriteOut = 0;
	 output reg BranchOut = 0;
	 output reg RegWriteOut = 0;
	 output reg MemtoRegOut = 0;
	 
	 
	 always @ (negedge clk) begin 
		 if(hit) begin
			 branchTargetOut = branchTarget;
			 zeroFlagOut = zeroFlag;
			 ALUResultOut = ALUResult;
			 readData2Out = readData2;
			 writeRegOut = writeReg;
			 MemReadOut = MemRead;
			 MemWriteOut = MemWrite;
			 BranchOut = Branch;
			 RegWriteOut = RegWrite;
			 MemtoRegOut = MemtoReg;
		 end
	 end
	 
	 assign hitOut = hit;


endmodule
