`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:44 12/11/2023 
// Design Name: 
// Module Name:    WriteBack 
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
module WriteBack(MemtoReg, readData, ALUResult, writeData
    );
	 input MemtoReg;
	 input [63:0] readData;
	 input [63:0] ALUResult;
	 
	 output [63:0] writeData;
	 
	 assign writeData = MemtoReg ? readData : ALUResult;

endmodule
