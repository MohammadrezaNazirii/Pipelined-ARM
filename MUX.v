`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:05 10/30/2023 
// Design Name: 
// Module Name:    MUX 
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
module MUX(PC, Branch_Target, PC_Source, Address
    );
	 output reg [63:0] Address;
	 input [63:0] PC;
	 input [63:0] Branch_Target;
	 input PC_Source;
	 
	 always @ (*) begin
		case (PC_Source)
			0: Address = PC;
			1: Address = Branch_Target;
		endcase

		
	 end


endmodule
