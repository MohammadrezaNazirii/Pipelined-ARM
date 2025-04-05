`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:48 12/04/2023 
// Design Name: 
// Module Name:    ALU 
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
module ALU(ALUCnt, input1, input2, result, zero
    );
	 
	 input [3:0] ALUCnt;
	 input [63:0] input1;
	 input [63:0] input2;
	 output reg [63:0] result;
	 output reg zero;
	 
	 always @(*) begin
		case(ALUCnt)
			4'b0010:
				result = input1 + input2;
			4'b0110:
				result = input1 - input2;
			4'b0000:
				result = input1 & input2;
			4'b0001:
				result = input1 | input2;
			4'b0111:
				result = input2;
		endcase
		if(result == 0)
			zero = 1;
		else
			zero = 0;
	 end


endmodule
