`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:39 12/04/2023 
// Design Name: 
// Module Name:    ALUControlUnit 
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
module ALUControlUnit(ALUOp, Opcode, ALUCnt
    );
	 
	 input [1:0] ALUOp;
	 input [10:0] Opcode;
	 output [3:0] ALUCnt;
	 
	 reg [3:0] temp;
	 
	 always @(*) begin
		 case(ALUOp)
			2'b00:
				temp = 4'b0010;
			2'b01:
				temp = 4'b0111;
			2'b10:
				case(Opcode)
					11'b10001011000:
						temp = 4'b0010;
					11'b11001011000:
						temp = 4'b0110;
					11'b10001010000:
						temp = 4'b0000;
					11'b10101010000:
						temp = 4'b0001;
				endcase
		 endcase
	 end
	 
	 assign ALUCnt = temp;


endmodule
