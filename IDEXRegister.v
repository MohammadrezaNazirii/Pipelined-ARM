`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:24 12/04/2023 
// Design Name: 
// Module Name:    IDEXRegister 
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
module IDEXRegister(clk, hit, ReadData1, ReadData2, SignExtendImmediate, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp, WriteReg, Opcode, pc, hitOut, ReadData1Out, ReadData2Out, SignExtendImmediateOut, ALUSrcOut, MemtoRegOut, RegWriteOut, MemReadOut, MemWriteOut, BranchOut, ALUOpOut, WriteRegOut, OpcodeOut, PCOut
    );
	 input clk;
	 input hit;
	 input [63:0] ReadData1;
	 input [63:0] ReadData2;
	 input [63:0] SignExtendImmediate;
	 input ALUSrc;
	 input MemtoReg;
	 input RegWrite;
	 input MemRead;
	 input MemWrite;
	 input Branch;
	 input [1:0] ALUOp;
	 input [4:0] WriteReg;
	 input [10:0] Opcode;
	 input [63:0] pc;
	 
	 output hitOut;
	 output reg [63:0] ReadData1Out = 0;
	 output reg [63:0] ReadData2Out = 0 ;
	 output reg [63:0] SignExtendImmediateOut = 0;
	 output reg ALUSrcOut = 0;
	 output reg MemtoRegOut = 0;
	 output reg RegWriteOut = 0;
	 output reg MemReadOut =0 ;
	 output reg MemWriteOut = 0;
	 output reg BranchOut = 0;
	 output reg [1:0] ALUOpOut = 0;
	 output reg [4:0] WriteRegOut = 0;
	 output reg [10:0] OpcodeOut = 0;
	 output reg [63:0] PCOut = 0;

	 
	 always @ (negedge clk) begin 
		 if(hit) begin
			 ReadData1Out = ReadData1;
			 ReadData2Out = ReadData2;
			 SignExtendImmediateOut = SignExtendImmediate;
			 ALUSrcOut = ALUSrc;
			 MemtoRegOut = MemtoReg;
			 RegWriteOut = RegWrite;
			 MemReadOut = MemRead;
			 MemWriteOut = MemWrite;
			 BranchOut = Branch;
			 ALUOpOut = ALUOp;
			 WriteRegOut = WriteReg;
			 OpcodeOut = Opcode;
			 PCOut = pc;
		 end
	 end
	 
	 assign hitOut = hit;

endmodule
