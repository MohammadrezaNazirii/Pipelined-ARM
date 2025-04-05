`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:32 11/13/2023 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(clk, RegWrite, read_reg1, read_reg2, write_reg, write_data, read_data1,  read_data2
    );

	 input clk;
	 input RegWrite;
	 input [4:0] read_reg1;
	 input [4:0] read_reg2;
	 input [4:0] write_reg;
	 input [63:0] write_data;
	 
	 output [63:0] read_data1;
	 output [63:0] read_data2;
	 
	 
	 reg [63:0] regFile [31:0];
	 integer i;
	 
	 
	 initial begin
		for (i=0;i<31;i=i+1) begin
			regFile[i] = i;
		end
		regFile[31] = 0;
	 end
	 
	 assign read_data1 = regFile[read_reg1];
	 assign read_data2 = regFile[read_reg2];
	 
	 always@(posedge clk) begin
		if(RegWrite)begin
			if(write_reg != 5'b11111)begin
				regFile[write_reg] = write_data;
			end
		end
	 end
	 

endmodule
