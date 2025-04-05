`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:52 12/11/2023 
// Design Name: 
// Module Name:    MemWbRegister 
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
module MemWbRegister(clk, hit, readData, ALUResult, writeReg, RegWrite, MemtoReg, hitOut, readDataOut, ALUResultOut, writeRegOut, RegWriteOut, MemtoRegOut
    );
	 input clk;
	 input hit;
	 input [63:0] readData;
	 input [63:0] ALUResult;
	 input [4:0] writeReg;
	 input RegWrite;
	 input MemtoReg;
	 
	 output hitOut;
	 output reg [63:0] readDataOut;
	 output reg [63:0] ALUResultOut;
	 output reg [4:0] writeRegOut;
	 output reg RegWriteOut;
	 output reg MemtoRegOut;
	 
	 always @ (negedge clk) begin 
		 if(hit) begin
			 readDataOut = readData;
			 ALUResultOut = ALUResult;
			 writeRegOut = writeReg;
			 RegWriteOut = RegWrite;
			 MemtoRegOut = MemtoReg;
		 end
	 end
	 
	 assign hit_out = hit;


endmodule
