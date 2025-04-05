`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:59:27 12/04/2023 
// Design Name: 
// Module Name:    Execute 
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
module Execute(clk, ALUReadData1, ALUReadData2, Immediate, Opcode, ALUOp, ALUSrc, PC, ALUResult, Zero, AddResult
    );
	 
	 
	 input clk;
	 input [63:0] ALUReadData1;
	 input [63:0] ALUReadData2;
	 input [63:0] Immediate;
	 input [10:0] Opcode;
	 input [1:0] ALUOp;
	 input ALUSrc;
	 input [63:0] PC;
	 
	 output [63:0] ALUResult;
	 output Zero;
	 output [63:0] AddResult;
	 
	 wire [63:0] ALUInput = ALUSrc ? Immediate : ALUReadData2;
	 wire [3:0] temp;
	 
	 assign AddResult = (Immediate<<2) + PC;
	 
	 ALUControlUnit aluControlUnit (
		 .ALUOp(ALUOp), 
		 .Opcode(Opcode), 
		 .ALUCnt(temp)
		 );
		 
	 ALU alu (
		 .ALUCnt(temp), 
		 .input1(ALUReadData1), 
		 .input2(ALUInput), 
		 .result(ALUResult), 
		 .zero(Zero)
		 );

endmodule
