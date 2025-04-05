`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:51 11/13/2023 
// Design Name: 
// Module Name:    SignExtend 
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
module SignExtend( instruction, out
    );
	 
	 input [31:0] instruction;
	 output [63:0] out;
	 
	 assign out = instruction[26] ? {{45{instruction[23]}}, instruction[23:5]} : {{55{instruction[20]}}, instruction[20:12]};


endmodule
